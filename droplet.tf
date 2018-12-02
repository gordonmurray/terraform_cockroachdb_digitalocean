# get the pre made salt master image
data "digitalocean_image" "cockroachdb" {
  name = "cockroachdb"
}

# generate a short random string
resource "random_string" "first" {
  length  = 5
  special = false
  upper   = false
}

# create a node with a unique hostname
module "cockroach-1" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.cockroachdb.image}"
  name               = "cockroachdb-${random_string.first.result}"
  region             = "lon1"
  size               = "512mb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["${module.my_ssh_key.ssh_fingerprint}"]
  private_networking = "true"
}

