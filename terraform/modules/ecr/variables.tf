variable "default_tags" {}

variable "repo_names" {
  type = list(string)
  default = ["clo835-a1-webapp", "clo835-a1-mysqldb"]
}