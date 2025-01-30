use std/dirs shells-aliases *

enter ~/dotfiles/

# nu ~/.config/zellix/run.nu ~/.config/zellix/example

git diff -U0 "*"
git add .

# Autoformat your nix files
let formatting_failed = alejandra -q . | is-not-empty

if $formatting_failed {
  alejandra .
  print "Formatting Failed!"
  exit 1
}

print "Rebuilding Nix"
try {
  darwin-rebuild switch --flake ~/dotfiles#macos 
} catch {
  print "Failed to Rebuild Nix"
  exit 1
}

# Get Current Generaton Metadata.
let current = darwin-rebuild --list-generations | grep current

# Commit all changes witih the generation metadata
git commit -am $"($current) - macos"

print "Macos Rebuilt Ok!\n"

if (input "Would you like to push? y/n" -n 1 -s) == 'y' {
  git push
}

n
