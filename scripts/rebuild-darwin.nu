print "Rebuilding Nix"
try {
  darwin-rebuild switch --flake ~/dotfiles#macos 
} catch {
  print "Failed to Rebuild Nix"
  exit 1
}

print "Rebuilding Nix Complete!"
