terraform {
  backend "s3" {
    bucket = "irofessional-main-tfstate"
    key    = "dailyidolsong/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
