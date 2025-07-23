if "ZELLIJ_OPEN" in $env {
  hx $env.ZELLIJ_OPEN
} else {
  hx
}

print "Exiting"

# Kill the session, closing other panes as soon as helix closes
zellij kill-session $env.ZELLIJ_SESSION
