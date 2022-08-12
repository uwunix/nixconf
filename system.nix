{ config, pkgs, lib, ... }:
{

    nixpkgs.config.allowUnfree = true;
nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
    time.timeZone = "America/Los_Angeles";
    

  networking.hostName = "nyanix"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
   networking.firewall.enable = true;
   networking.firewall.allowedTCPPorts = [  ];
   networking.firewall.allowedUDPPorts = [  ];
  networking.useDHCP = lib.mkDefault true;
   networking.interfaces.eno1.useDHCP = lib.mkDefault false;
   networking.interfaces.eno2.useDHCP = lib.mkDefault false;
   networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
   networking.interfaces.wlp4s0.useDHCP = lib.mkDefault false;

networking.bridges.br1.interfaces = [ "eno1" ];
networking.bridges.br2.interfaces = [ "eno2" ];

 virtualisation.libvirtd.enable = true;
virtualisation.libvirtd.qemu.runAsRoot = false;
virtualisation.libvirtd.qemu.swtpm.enable = true;
virtualisation.libvirtd.qemu.ovmf.enable = true;

virtualisation.libvirtd = {
  onBoot = "ignore";
  onShutdown = "shutdown";
};


  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
hardware.nvidia.modesetting.enable = true;
 programs.xwayland.enable = true;

environment.sessionVariables.NIXOS_OZONE_WL = "1";
# Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
        # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
services.opensnitch.enable = true;
hardware.ckb-next.enable = true;
services.avahi = {
  enable = false;

};
##security.apparmor.enable = true;
##aa is broken on nixos no selinux either :/
##no way to restrict path or make the store hidden from world
# Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "uwu";
   systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  
 systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
     systemd.coredump.enable = true;

systemd.coredump.extraConfig = ''
    Storage=/home/uwu/core
'';

 services.printing.enable = false;
  services.openssh.enable = false;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.libinput.enable = true;
security.sudo.enable = true;


  nix.settings.allowed-users = [ "@wheel;" ];

}
