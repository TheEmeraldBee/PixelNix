if "ZELLIJ_OPEN" in $env {
  nvim $env.ZELLIJ_OPEN
} else {
  nvim
}

print "Exiting"

# Kill the session, closing other panes as soon as helix closes
zellij kill-session $env.ZELLIJ_SESSION
