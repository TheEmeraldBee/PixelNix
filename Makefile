rebuild-os: git-add
	nu scripts/rebuild-nix.nu

rebuild-home: git-add
	nu scripts/rebuild-home-manager.nu

commit: git-add
	nu scripts/commit-nixos.nu

-------:

git-add:
	git diff -U0 "*" &&\
	git add .

-------:

delete-generations:
	sudo nix-collect-garbage -d
