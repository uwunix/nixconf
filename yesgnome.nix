{ config, pkgs, lib, ... }:

{
 programs.dconf.enable = true;
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

##i dont really like gnome.. xwayland is broken on nixos plasma-wayland will try again maybe next release
environment.systemPackages = with pkgs; [
gnome.gnome-tweaks
gnomeExtensions.cpudots
gnome.dconf-editor
   ];

 environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
]) ++ (with pkgs.gnome; [
  gnome-music
  epiphany # web browser
  geary # email reader
  evince # document viewer
  gnome-characters
  totem # video player
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
]);


}
