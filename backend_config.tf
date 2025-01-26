resource "aws_s3_bucket" "videos_bucket" {
  bucket = "videos-bucket-soat72025"
  tags = {
    Name = "VideosBucket"
  }
}

resource "aws_s3_bucket" "zip_images_bucket" {
  bucket = "zip-images-bucket-soat72025"
  tags = {
    Name = "ZipImagesBucket"
  }
}
