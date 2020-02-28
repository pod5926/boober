class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [128, 128], :fix_exif_rotation_and_strip_exif

  storage :file

  # アップロードファイルの保存先ディレクトリは上書き可能
  # 下記はデフォルトの保存先
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # アップロード可能な拡張子のリスト
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def fix_exif_rotation_and_strip_exif
    manipulate! do |img|
      img.auto_orient # よしなに！
      img.strip       # Exif情報除去
      img = yield(img) if block_given?
      img
    end
  end
end
