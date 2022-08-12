{ config, pkgs, lib, ... }:

{
 users.users.uwu = {
     isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "video" ];
     packages = with pkgs; [
       python3
       librewolf-wayland
             firefox-esr-wayland
             gparted
tilix
     ];
   };
  programs.firejail.enable = true;
programs.firejail.wrappedBinaries = {



librewolf = {
          executable = "${pkgs.lib.getBin pkgs.librewolf-wayland}/bin/librewolf";
          profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
      };

      firefox = {
          executable = "${pkgs.lib.getBin pkgs.firefox-esr-wayland}/bin/firefox";
          profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
      };

  };
}
