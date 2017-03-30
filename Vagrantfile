# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |vb|
        #vb.customize ["modifyvm", :id]

        vb.memory = 1024
        vb.cpus = 2
    end

    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.20"
    config.vm.hostname = "dle103u"

    #config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
    config.vm.synced_folder ".", "/var/www",
        :nfs => true,
        :mount_options => ['rw', 'vers=3', 'tcp', 'fsc' ,'actimeo=1']


    config.vm.provision "shell", path: "./bootstrap.sh", keep_color: true
    config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

end