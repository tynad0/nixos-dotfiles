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
        HostName = "100.65.202.86";
        User = "s1user";
        Port = 2232;
        IdentityFile = "~/.ssh/id_ed25519";
      };

      myvm2 = {
        HostName = "100.68.88.50";
        User = "s2user";
        Port = 2232;
        IdentityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  services.ssh-agent.enable = true;
}
