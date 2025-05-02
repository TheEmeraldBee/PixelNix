# Get Current Generaton Metadata.
let current = darwin-rebuild --list-generations | grep current

# Commit all changes witih the generation metadata
git commit -am $"($current) - macos"

print "Macos Rebuilt Ok!\n"

if (input "Would you like to push? y/n" -n 1 -s) == 'y' {
  git push
}
