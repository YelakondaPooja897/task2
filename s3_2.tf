
resource "aws_s3_bucket" "bucket897" {
  bucket = "buck897"
  acl    = "public-read"
}


resource "aws_s3_bucket_object" "webobject" {
  bucket = "${aws_s3_bucket.bucket897.bucket}"
  key    = "image.jpg"
  source = "C:/Users/POOJA YELAKONDA/Downloads/task2im.jpg"
  acl    = "public-read"
}
