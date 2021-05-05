
require "vagrant-aws"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 9000, host: 9000, host_ip: "127.0.0.1"

  config.vm.synced_folder "../lmsapi", "/home/vagrant/lmsapi", owner: "lms-admin ", group:"lms-admin ", mount_options:["dmode=755,fmode=664"]
  
  config.vm.provision "shell", inline: "sudo service mysql start", run: "always"

  config.vm.provider "aws" do |aws, override|
    aws.access_key_id = “xxxxxxxxxxxxxxxxxxxxxxxxxxx”
    aws.secret_access_key = “xxxxxxxxxxxxxxxxxxxxxxxxxx”
    aws.keypair_name = "ssh-keypair-name"
    aws.instance_type = "t2.micro"
    aws.region = "us-east-1"
    aws.ami = "ami-20be7540"
    aws.security_groups = ["default"]
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "~/.ssh/ssh-keypair-file"
  end

end