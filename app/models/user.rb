class User < ActiveRecord::Base
  has_many :purchases, foreign_key: :buyer_id
  has_many :whiskies, through: :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ratyrate_rater

  def cart_count
    $redis.scard "cart#{id}"
  end

  def cart_total_price
    total_price = 0
    get_cart_whiskies.each { |whisky| total_price+= whisky.price }
    total_price
  end

  def get_cart_whiskies
    cart_ids = $redis.smembers "cart#{id}"
    Whisky.find(cart_ids)
  end

  def purchase_cart_whiskies!
    get_cart_whiskies.each { |whisky| purchase(whisky) }
    $redis.del "cart#{id}"
  end

  def purchase(whisky)
    whiskies << whisky unless purchase?(whisky)
  end

  def purchase?(whisky)
    whiskies.include?(whisky)
  end

  # Braintree
  FIELDS = [:first_name, :last_name, :phone, :website, :company, :fax, :addresses, :credit_cards, :custom_fields]
  attr_accessor *FIELDS

  def has_payment_info?
    braintree_customer_id
  end

  def with_braintree_data!
    return self unless has_payment_info?
    braintree_data = Braintree::Customer.find(braintree_customer_id)

    FIELDS.each do |field|
      send(:"#{field}=", braintree_data.send(field))
    end
    self
  end

  def default_credit_card
    return unless has_payment_info?
    credit_cards.find { |cc| cc.default? }
  end
end

