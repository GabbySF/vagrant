Vagrant.configure("2") do |config|
  config.vm.box =  "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.synced_folder "../../", "/testshare"
  config.vm.network "forwarded_port", guest: 3306, host: 3306,auto_correct: true  
  config.vm.provision "shell" do |s|
  	s.inline = "echo Set UP"
  end
  config.vm.provision "shell", path: "bootscript.sh"

  config.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = "cookbook"
      chef.add_recipe "apt"
      chef.add_recipe "build-essential"
      chef.add_recipe "apache2"
      chef.add_recipe "apache2::mod_php5"
      chef.add_recipe "openssl"
      chef.add_recipe "java"
      chef.add_recipe "mysql"
      chef.add_recipe "mysql::server"
      chef.add_recipe "xml"
      chef.add_recipe "php"
      chef.add_recipe "php::module_apc"
      chef.add_recipe "php::module_mysql"
      chef.add_recipe "memcached"
      chef.add_recipe "mongodb::default"
      chef.json={
          "java"=>{
		"jdk_version"=>"7"
	  },
          "mysql" => {
        	"server_root_password" => 'root',
        	"server_repl_password" => 'root',
        	"server_debian_password" => 'root',
  		"allow_remote_root" =>true
          },
	  "apache" => {
                "default_site_enabled" => true
          }
      }
  end


end
