module "aws_entorno" {
 source = "/home/pi/terraformModules"
 key_name = "key_desarrollo"
 public_key	= file("${path.module}/id_rsa.pub")
 instance_name	= "instanciaDes"
 sg_name	= "sgDesarrollo"
 cidr_vpc	= "10.60.0.0/16"
 cidr_subnet1	= "10.60.1.0/24"
}
