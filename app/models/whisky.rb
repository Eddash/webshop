class Whisky < ActiveRecord::Base
  ratyrate_rateable 'geschmack', 'geruch', 'flaschendesign', 'preisleistung'

    def pic
      "http://www2.pic-upload.de/img/#{pic_url}"
    end

    def cart_action(current_user_id)
      if $redis.sismember "cart#{current_user_id}", id
        "Entfrenen aus"
      else
        "Hinzufügen zum"
      end
    end
  end
