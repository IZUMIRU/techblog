class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  process :fix_exif_rotation

  # iPhoneで撮影した写真が横向きになってしまう対応
  def fix_exif_rotation
    manipulate! do |img|
      img.auto_orient!
      img = yield(img) if block_given?
      img
    end
  end

  case Rails.env
    when 'production'
      # storage :fog
      storage :file
    when 'development'
      storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_and_pad: [360, 240, background = :transparent, gravity = ::Magick::CenterGravity]
  end

  def extension_white_list
    %w(jpg jpeg png gif)
  end

  def filename
    if original_filename.present?
      if original_filename.include?(".jpeg")
        "#{secure_token}.jpeg"
      elsif original_filename.include?(".png")
        "#{secure_token}.png"
      elsif original_filename.include?(".gif")
        "#{secure_token}.gif"
      else original_filename.include?(".jpg")
        "#{secure_token}.jpg"
      end
    end
  end

  protected
  #ファイル名を自動でユニークに設定
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
