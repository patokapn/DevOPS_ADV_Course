terraform {
  backend "remote" {
    organization = "devopsadv-itea"

    workspaces {
      name = "DevOPS_ADV_Course"
    }
  }
}