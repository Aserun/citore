# == Schema Information
#
# Table name: image_meta
#
#  id                :integer          not null, primary key
#  type              :string(255)      not null
#  title             :string(255)      not null
#  original_filename :string(255)
#  filename          :string(255)
#  url               :string(255)
#
# Indexes
#
#  index_image_meta_on_title  (title)
#  index_image_meta_on_type   (type)
#

class Citore::EroticImage < ImageMetum
  IMAGE_S3_FILE_ROOT = "project/citore/images/"

  def s3_file_url
    return "https://taptappun.s3.amazonaws.com/" + Citore::EroticImage::IMAGE_S3_FILE_ROOT + self.filename
  end
end
