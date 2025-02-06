resource "aws_s3_bucket" "videos_bucket" {
  bucket = "98videos-videos-to-process"
  tags = {
    Name = "VideosBucket"
  }
}

resource "aws_s3_bucket" "zip_images_bucket" {
  bucket = "98videos-zip-files"
  tags = {
    Name = "ZipImagesBucket"
  }
}
