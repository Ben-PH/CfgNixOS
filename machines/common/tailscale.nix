
{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
#  ```and running "sudo tailscale up --auth-key=KEY" with the key generated at https://login.tailscale.com/admin/machines/new-linux .``` 
  services.tailscale = {
    enable = true;
  };
}
