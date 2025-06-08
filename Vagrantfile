Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
  
    servers = [
      { name: "lb",   ip: "192.168.56.22", script: "lb.sh", hostname: "lb.local" },
      { name: "api1", ip: "192.168.56.11", script: "api.sh", hostname: "api1.local" },
      { name: "api2", ip: "192.168.56.12", script: "api.sh", hostname: "api2.local" },
      { name: "api3", ip: "192.168.56.13", script: "api.sh", hostname: "api3.local" },
      { name: "db",   ip: "192.168.56.101", script: "db.sh", hostname: "db.local" }
    ]
  
    servers.each do |srv|
      config.vm.define srv[:name] do |node|
        node.vm.hostname = srv[:hostname]
        node.vm.network "private_network", ip: srv[:ip]
        node.vm.provision "shell", path: "provisioning/#{srv[:script]}"
      end
    end
  end