{
  time.timeZone = "Europe/Zagreb";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_CTYPE = "en_US.UTF8";
    LC_ADDRESS = "hr_HR.UTF-8";
    LC_MEASUREMENT = "hr_HR.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
    LC_MONETARY = "hr_HR.UTF-8";
    LC_NAME = "hr_HR.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "hr_HR.UTF-8";
    LC_TELEPHONE = "hr_HR.UTF-8";
    LC_TIME = "hr_HR.UTF-8";
    LC_COLLATE = "hr_HR.UTF-8";
  };
  services.xserver.xkb = {
    layout = "hr";
    variant = ",";
  };
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "hr";
    XKB_DEFAULT_VARIANT = ",";
  };
  console = {
    keyMap = "croat";
  };
}
