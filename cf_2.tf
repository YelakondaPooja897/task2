
resource "aws_cloudfront_distribution" "webdistributions" {
  origin {
    domain_name = "${aws_s3_bucket.bucket897.bucket_regional_domain_name}"
    origin_id   = "${aws_s3_bucket.bucket897.id}"
  }


  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Web Distributions"


  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${aws_s3_bucket.bucket897.id}"


    forwarded_values {
      query_string = false


      cookies {
        forward = "none"
      }
    }


    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }


  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["IN"]
    }
  }


  tags = {
    Name        = "Webdistributions"
    Environment = "Production"
  }


  viewer_certificate {
    cloudfront_default_certificate = true
  }


  depends_on = [
    aws_s3_bucket.bucket897
  ]
}