# Migration from Previous Dotfiles Version

If you're upgrading from the previous version of this dotfiles repository (before chezmoi migration):

## 1. Install Chezmoi and Initialize

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init pinelibg
```

## 2. Review Changes

Check what files will be managed and what changes will be made:

```sh
chezmoi diff
```

## 3. Apply the Configuration

If the changes look good, apply them:

```sh
chezmoi apply
```

## 4. Verify Everything Works

Test that your shell and tools are working correctly with the new setup.

## 5. Remove Old Installation

Once you've confirmed the new setup works:

```sh
# Remove the old dotfiles repository
rm -rf ~/dotfiles
```

## Key Changes

- Dotfiles are now managed by chezmoi instead of manual symlinks
- Use `chezmoi update` to pull and apply the latest changes
- Customize files through `chezmoi edit` rather than editing the repository directly