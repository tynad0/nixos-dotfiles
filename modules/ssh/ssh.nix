{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };

      myvm = {
        HostName = "192.168.0.121";
        User = "ls1u";
        Port = 22;
        IdentityFile = "~/.ssh/id_ed25519";
      };

    };
  };

  services.ssh-agent.enable = true;
}
