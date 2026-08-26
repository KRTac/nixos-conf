{ pkgs, ... }: {
  programs.uwsm = {
    enable = true;
  };

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
      enable = false;
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
    hyprshutdown
  ];

  fonts = {
    packages = with pkgs; [
      inter
      fira-code
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  environment.sessionVariables = {
    XDG_MENU_PREFIX = "plasma-";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    # hint Electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
  };
}
