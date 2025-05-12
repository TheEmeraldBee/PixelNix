rebuild-nvidia: git-add
	FLAKE=nvidia_pc nu scripts/rebuild-nix.nu

rebuild-nvidia-home: git-add
	FLAKE=nvidia_pc nu scripts/rebuild-home-manager.nu

rebuild-laptop: git-add
	FLAKE=framework_laptop nu scripts/rebuild-nix.nu

rebuild-laptop-home: git-add
	FLAKE=framework_laptop nu scripts/rebuild-home-manager.nu

commit-nixos: git-add
	nu scripts/commit-nixos.nu

-------:

rebuild-darwin: git-add
	nu scripts/rebuild-darwin.nu

commit-darwin: git-add
	nu scripts/commit-darwin.nu

-------:

git-add:
	git diff -U0 "*" &&\
	git add .

-------:

delete-generations:
	sudo nix-collect-garbage -d
