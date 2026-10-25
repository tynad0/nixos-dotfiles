{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };

      myserver = {
        HostName = "ip_safe_hidden";
        User = "user_safe_hidden";
        Port = "port_safe_hidden";
        IdentityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  services.ssh-agent.enable = true;
}

# trap file
