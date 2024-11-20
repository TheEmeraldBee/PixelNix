use std/dirs shells-aliases *

enter ~/dotfiles/

nu ~/.config/zellix/run.nu ~/.config/zellix/example

git diff -U0 "*"
git add .

# Autoformat your nix files
let formatting_failed = alejandra -q . | is-not-empty

if $formatting_failed {
  alejandra .
  print "Formatting Failed!"
  exit 1
}

print "Rebuilding Nixos"
try {
  sudo nixos-rebuild switch --flake ~/dotfiles#nixos
} catch {
  print "Failed to Rebuild Nixos"
  exit 1
}

print "Rebuilding Home Manager"
try {
  home-manager switch --flake ~/dotfiles#brightonlcox
} catch {
  print "Failed To Rebuild Home Manager"
  exit 1
}

# Get Current Generaton Metadata.
let current = nixos-rebuild list-generations | grep current

# Commit all changes witih the generation metadata
git commit -am $"($current) - nixos"

notify-send -e "NixOS Rebuilt Ok!\nCheck console to finish up!"

print ""

if (input "Would you like to push? y/n" -n 1 -s) == 'y' {
  git push
}

n
