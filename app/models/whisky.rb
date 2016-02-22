class Whisky < ActiveRecord::Base
  ratyrate_rateable 'geschmack', 'geruch', 'flaschendesign', 'preisleistung'
  def pic

    "http://www2.pic-upload.de/img/#{pic_url}"

  end
end
