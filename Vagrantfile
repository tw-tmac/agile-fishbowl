VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "AgileFishbowl-dev-fedora"
    config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_fedora-20_chef-provisionerless.box"

    config.vm.host_name = "bc-geeknight.local"
    config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "1", "--name", "AgileFishbowl"]
    end

    config.vm.network "forwarded_port", guest: 9393, host: 9393, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 9292, host: 9292, host_ip: "127.0.0.1"

    config.vm.provision "ansible" do |ansible|
        ansible.host_key_checking = false
        ansible.playbook = "provision_server.yml"
        ansible.sudo = true
        ansible.verbose = ''        
	end
end
