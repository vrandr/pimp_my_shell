# -*- mode: ruby -*-
# vi: set ft=ruby :
# frozen_string_literal: false

setup_zsh = true

Vagrant.configure('2') do |config|
  config.vm.define 'pimp_my_shell', primary: true do |instance|
    instance.vm.box = 'ubuntu/lunar64'
    instance.vm.hostname = 'lunar'
    instance.vm.box_check_update = true
    instance.vm.provider :virtualbox do |vm|
      vm.cpus = 2
      vm.memory = 1024
      vm.name = 'vagrant_pimp_my_shell'
    end
    instance.vm.provision 'file', source: 'assets/df-focal', destination: '${HOME}/demo/df-focal'
    instance.vm.provision 'file', source: 'assets/user-gitconfig', destination: '${HOME}/.gitconfig'
    instance.vm.provision 'file', source: 'assets/user-starship.toml', destination: '${HOME}/.config/starship.toml'
    instance.vm.provision 'file', source: 'assets/user-vimrc', destination: '${HOME}/.vimrc'
    instance.vm.provision 'file', source: 'assets/user-zshrc.local', destination: '${HOME}/.zshrc.local'
    instance.vm.provision 'shell', path: 'bin/bootstrap.sh'
    instance.vm.provision 'shell', path: 'bin/bootstrap.sh', privileged: false
    instance.vm.provision 'shell', inline: 'chsh -s /usr/bin/zsh vagrant' if setup_zsh
    instance.vm.provision 'shell', inline: 'curl -L https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc -o "${HOME}/.zshrc"', privileged: false if setup_zsh
  end
end
