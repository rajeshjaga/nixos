{configs, pkgs, ... }:
{
    networking = {
        hostName = "nixos";
        nameservers = ["1.1.1.1"];
        networkmanager = {
            enable = true;
            dns = "default";
        };

        dhcpcd.enable = true;
        proxy.noProxy = "127.0.0.1,localhost,internal,domain";
        #firewall
        firewall = {
            enable = true;
            allowedTCPPorts = [ 80 22];
            allowedUDPPorts = [ 80 ];
        };
    };
}
