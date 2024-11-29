{...}: {
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
    Exec = "zen"

    [app."Discord".style]
    icon = ""
    icon_color = "blue"

    [[app."Discord".event]]
    Exec = "discord"

    [app."1Password".style]
    icon = ""
    icon_color = "red"

    [[app."1Password".event]]
    Exec = "1password"

    [app."Steam".style]
    icon = ""
    icon_color = "blue"

    [[app."Steam".event]]
    Exec = "steam"

    [app."Olympus".style]
    icon = ""
    icon_color = "magenta"

    [[app."Olympus".event]]
    Exec = "olympus"

    [app."Prism Launcher".style]
    icon = "󰍳"
    icon_color = "green"

    [[app."Prism Launcher".event]]
    Exec = "prismlauncher"

    [app."Nexus Mods".style]
    icon = ""
    icon_color = "blue"

    [[app."Nexus Mods".style]]
    Exec = "NexusMods.app"

    [app."Whiteboard".style]
    icon = "|"
    icon_color = "white"

    [[app."Whiteboard".event]]
    Exec = "xournalpp"
  '';
}
