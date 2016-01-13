class Whisky < ActiveRecord::Base
  def pic
    "/app/assets/images/#{pic_url}"
  end
end
