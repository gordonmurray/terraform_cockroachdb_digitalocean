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

resource "random_string" "second" {
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
  ssh_keys           = ["66:a9:2e:14:4b:48:83:b7:4b:3f:0c:35:c0:f0:26:46"]
  private_networking = "true"
}

# create a node with a unique hostname
module "cockroach-2" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.cockroachdb.image}"
  name               = "cockroachdb-${random_string.second.result}"
  region             = "lon1"
  size               = "512mb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["66:a9:2e:14:4b:48:83:b7:4b:3f:0c:35:c0:f0:26:46"]
  private_networking = "true"
}