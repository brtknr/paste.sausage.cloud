resource "openstack_compute_instance_v2" "myinstance" {
  name            = "paste.sausage.cloud"
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_id       = data.openstack_compute_flavor_v2.frankfurter.id
  key_pair        = "default"
  security_groups = ["default"]

  network {
    name = "default"
  }
}

data "openstack_images_image_v2" "ubuntu" {
  name        = "Ubuntu 20.04 (20200714)"
  most_recent = true
}

data "openstack_compute_flavor_v2" "frankfurter" {
  name = "frankfurter"
}

resource "openstack_compute_floatingip_associate_v2" "paste" {
  floating_ip = "193.16.42.95"
  instance_id = openstack_compute_instance_v2.myinstance.id
}
