rebuild-nix: format
	nu scripts/rebuild-nixos.nu

rebuild-home-manager: format
	nu scripts/rebuild-home-manager.nu

commit-nixos: pre-commit
	nu scripts/commit-nixos.nu

-------:

rebuild-darwin: format
	nu scripts/rebuild-darwin.nu

commit-darwin: pre-commit
	nu scripts/commit-darwin.nu

-------:

pre-commit: format git-add

format:
	nu scripts/format.nu

git-add:
	git diff -U0 "*" &&\
	git add .

