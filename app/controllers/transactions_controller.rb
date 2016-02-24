class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart!

  def new
    gon.client_token = generate_client_token
  end

  def edit
    @credit_card = current_user.default_credit_card
    @tr_data = edit_customer_tr_data
  end

  def create
    @result = Braintree::Transaction.sale(
        amount: current_user.cart_total_price,
        payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      current_user.purchase_cart_whiskies!
      redirect_to root_url, notice: "Herzlichen Glückwunsch der Einkauf war erfolgreich!"
    else
      flash[:alert] = "Irgendwas ist schief gelaufen, bitte versuchen Sie es noch einmal!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private
  def generate_client_token
    Braintree::ClientToken.generate
  end

  def check_cart!
    if current_user.get_cart_whiskies.blank?
      redirect_to root_url, alert: "Bitte fügen Sie einige Produkte ihrem Warenkorb hinzu bevor es weitergehen kann!"
    end
  end
end
