
// modulo local:
module "ec2" {
  source               = "./modules/ec2"
  ami = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"
  tag_name = "LinuxTipsConf"

}

// Registry do terraform
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.1"
  bucket = "LinuxTipsConf-2023"
  acl = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"


  versioning = {
    enabled = true
  }
}

//Registry privado:



module "security_group_1" {
  source = "git@github.com:marcelofreire1988/terraform-sg.git//modules/sg1"
  ingress-ports = [22]
  sg_name = "apresentacao_linux_tips_conf_2023"
}

module "security_group_2" {
  source = "git@github.com:marcelofreire1988/terraform-sg.git//modules/sg2"
  ingress-ports = [80, 8080, 8081]
}



