use std/dirs shells-aliases *

enter ~/dotfiles/

hx

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

print "Rebuilt Ok!"

n
