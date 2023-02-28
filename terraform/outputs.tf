output "ecr-url" {
  value = module.ECR.ecr-url
}

output "jenkins_ip" {
  value = module.EC2.jenkins_ip
}