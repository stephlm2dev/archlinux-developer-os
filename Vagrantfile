# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "archlinux"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "/Users/stephlm2dev/Documents/Github/", "/shared"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  # Copy root dotfiles
  config.vm.provision "file", source: "data/dotfiles/bigqueryrc", destination: "~/.bigqueryrc"
  config.vm.provision "file", source: "data/dotfiles/editorconfig", destination: "~/.editorconfig"
  config.vm.provision "file", source: "data/dotfiles/gitconfig", destination: "~/.gitconfig"
  config.vm.provision "file", source: "data/dotfiles/npmrc", destination: "~/.npmrc"
  config.vm.provision "file", source: "data/dotfiles/sawsrc", destination: "~/.sawsrc"
  config.vm.provision "file", source: "data/dotfiles/taskrc", destination: "~/.taskrc"
  config.vm.provision "file", source: "data/dotfiles/tmux.conf", destination: "~/.tmux.conf"
  config.vm.provision "file", source: "data/dotfiles/vimrc", destination: "~/.vimrc"
  config.vm.provision "file", source: "data/dotfiles/zshrc", destination: "~/.zshrc"

  # Configure Archlinux
  config.vm.provision "shell", path: "data/configure/pacman.sh", name: "system.sh", privileged: true
  config.vm.provision "shell", path: "data/configure/root.sh", name: "root.sh", privileged: true
  config.vm.provision "shell", path: "data/configure/yay.sh", name: "yay.sh", privileged: false
  config.vm.provision "shell", path: "data/configure/versions_manager.sh", name: "versions_manager.sh", privileged: false
  config.vm.provision "shell", path: "data/configure/terminal.sh", name: "terminal.sh", privileged: false

  # Copy last dotfiles
  config.vm.provision "file", source: "data/dotfiles/tmux_resurrect.txt", destination: "~/.tmux/ressurect/tmux_resurrect.txt"

  # Almost ready to use !
	$ready = <<-SCRIPT
	cd "$TMUX_DIR/resurrect/" ; \
  ln -s tmux_resurrect.txt last ; \
	cd

	echo "Archlinux is ready to use !"
	echo "Type 'vagrant ssh' to connect it and enjoy !"
	SCRIPT

	config.vm.provision "shell", inline: $ready
end
