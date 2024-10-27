{ ... }: {
  xdg.configFile."launcher/config.toml".text = ''
    [[each]]
    Exit = {}

    [app."Alacritty".style]
    icon = ""
    icon_color = "green"

    [[app."Alacritty".event]]
    Exec = "alacritty"

    [app."Zen Browser".style]
    icon = ""
    icon_color = "red"

    [[app."Zen Browser".event]]
    Exec = "/home/brightonlcox/nvidia-offload zen"

    [app."Discord".style]
    icon = ""
    icon_color = "blue"

    [[app."Discord".event]]
    Exec = "/home/brightonlcox/nvidia-offload discord"

    [app."1Password".style]
    icon = ""
    icon_color = "red"

    [[app."1Password".event]]
    Exec = "1password"

    [app."Steam".style]
    icon = ""
    icon_color = "blue"

    [[app."Steam".event]]
    Exec = "/home/brightonlcox/nvidia-offload steam"
  '';
}
