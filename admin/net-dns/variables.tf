variable "recordsets" {
  type = list(object({
    name    = string
    type    = string
    ttl     = number
    records = list(string)
  }))
  description = "List of DNS record objects to manage, in the standard terraform dns structure."
  default     = [
    {name = "dev"
    type = "public"
    ttl = 300
    records = ["ns-cloud-b1.googledomains.com.", "ns-cloud-b2.googledomains.com.","ns-cloud-b3.googledomains.com.", "ns-cloud-b4.googledomains.com."]
    },
    {name = "stg"
    type = "public"
    ttl = 300
    records = ["ns-cloud-d1.googledomains.com.", "ns-cloud-d2.googledomains.com.","ns-cloud-d3.googledomains.com.", "ns-cloud-d4.googledomains.com."]
    },
    {name = "prod"
    type = "public"
    ttl = 300
    records = ["ns-cloud-d1.googledomains.com.", "ns-cloud-d2.googledomains.com.","ns-cloud-d3.googledomains.com.", "ns-cloud-d4.googledomains.com."]
    }
  ]
}