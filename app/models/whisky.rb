class Whisky < ActiveRecord::Base
  def pic
<<<<<<< HEAD
    "/app/assets/images/#{pic_url}"
=======
    "http://www2.pic-upload.de/img/#{pic_url}"
>>>>>>> 9ae144219a320018ccebb6d2ca2b281eb4da1ef1
  end
end
