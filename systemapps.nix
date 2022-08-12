{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
     vim 
patchelf
nix-index
tilix
geany
dconf2nix
     wget
      pciutils
    cryptsetup
    coreutils
    screenfetch
apparmor-profiles
    libsForQt5.kpmcore
    libsForQt5.full
catfish
   pfetch
   hfsprogs
   apfsprogs
ffmpeg-full
youtube-dl
yt-dlp
ckb-next
   cdrtools
   bubblewrap
gparted
   pcmanfm
dracula-theme
wayland
yt-dlp

   gparted
   pavucontrol
   arc-theme


   ];
   
   
  
}
