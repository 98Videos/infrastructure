terraform {
  backend "s3" {
    bucket = "98videos-infra"
    key    = "states/98videos-infra"
    region = "us-east-1"
    profile = "default"
  }
}
