rebuild-os: jj
	nu scripts/rebuild-nix.nu

rebuild-home: jj
	nu scripts/rebuild-home-manager.nu

-------:

jj:
	jj diff

-------:

delete-generations:
	sudo nix-collect-garbage -d
