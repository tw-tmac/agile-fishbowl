VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "AgileFishbowl-dev-fedora"
    config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_fedora-20_chef-provisionerless.box"

    config.vm.host_name = "localhost"
    config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "1", "--name", "AgileFishbowl"]
    end

    config.vm.network "private_network", ip: "192.168.0.42"
    config.vm.provision "ansible" do |ansible|
        ansible.host_key_checking = false
        ansible.playbook = "provision_server.yml"
        ansible.sudo = true
        ansible.verbose = ''        
	end
end
