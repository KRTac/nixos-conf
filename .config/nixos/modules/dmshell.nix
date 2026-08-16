{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;

    settings = {
      initial_session = {
        command = "uwsm start hyprland.desktop";
        user = "krt";
      };
      default_session = {
        command = "uwsm start hyprland.desktop";
        user = "krt";
      };
    };
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };
    
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = false;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
  };

  environment.systemPackages = with pkgs; [
    dgop
    matugen
    cava
    khal
    cups-pk-helper
  ];

  fonts = {
    packages = with pkgs; [
      inter
      fira-code
    ];
  };

  environment.sessionVariables = {
    XDG_MENU_PREFIX = "plasma-";
  };
}
