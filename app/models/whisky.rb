class Whisky < ActiveRecord::Base
  def pic

    "http://www2.pic-upload.de/img/#{pic_url}"

  end
end
