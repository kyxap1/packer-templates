# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION ||= "2"

# Vagrant version.
# version 1.8.0 is required due to issue https://github.com/mitchellh/vagrant/issues/5497
Vagrant.require_version ">= 1.8.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_agent = false
  config.ssh.forward_x11 = false
  config.ssh.keep_alive = true
  config.ssh.username = "pollywog"

  config.vm.box_check_update = true

  config.vm.network "forwarded_port", guest: 7000, host: 7000, protocol: "tcp", auto_correct: true
  config.vm.network "forwarded_port", guest: 7001, host: 7001, protocol: "tcp", auto_correct: true
  config.vm.network "forwarded_port", guest: 7199, host: 7199, protocol: "tcp", auto_correct: true
  config.vm.network "forwarded_port", guest: 9042, host: 9042, protocol: "tcp", auto_correct: true
  config.vm.network "forwarded_port", guest: 9142, host: 9142, protocol: "tcp", auto_correct: true
  config.vm.network "forwarded_port", guest: 9160, host: 9160, protocol: "tcp", auto_correct: true

  config.vm.communicator = "ssh"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/shared", create: true
end
