{lib, ...}: {
  programs.starship.enable = true;

  programs.starship.settings = {
    format = lib.concatStrings [
      "[  ](bg:#a3aed2 fg:#090c0c)"
      "[](bg:#769ff0 fg:#a3aed2)"
      "$directory"
      "[](fg:#769ff0 bg:#394260)"
      "$git_branch"
      "$git_status"
      "[](fg:#212736 bg:#1d2230)"
      "$time"
      "[ ](fg:#1d2230)"
      "\n$character"
    ];

    directory = {
      style = "fg:#e3e5e5 bg:#769ff0";
      format = "[ $path ]($style)";
      truncation_length = 3;
      truncation_symbol = "…/";
    };

    git_branch = {
      symbol = "";
      style = "bg:#394260";
      format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
    };

    git_status = {
      style = "bg:#394260";
      format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
    };

    time = {
      disabled = false;
      time_format = "%R";
      style = "bg:#1d2230";
      format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
    };
  };
}
