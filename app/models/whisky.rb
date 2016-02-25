class Whisky < ActiveRecord::Base
  has_many :purchases
  has_many :buyers, through: :purchases

  ratyrate_rateable 'geschmack', 'geruch', 'flaschendesign', 'preisleistung'

    def pic
      "#{pic_url}"
    end

    def cart_action(current_user_id)
      if $redis.sismember "cart#{current_user_id}", id
        "Entfernen aus"
      else
        "Hinzufügen zum"
      end
    end
  end