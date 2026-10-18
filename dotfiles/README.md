# Dotfiles

Personal configuration files, scripts, and libraries managed with Git and GNU Stow.
## Requirements

  - Git
  - GNU Stow

On Fedora , Stow can be installed with `sudo dnf install stow`

## Structure

Each directory is a Stow package that mirrors paths inside $HOME.

  - **sway/, waybar/, foot/, dunst/, pipewire/, mangohud/**: application configurations
  - **shell/**: Zsh configuration
  - **bin/**: personal scripts and executables
  - **lib/**: local libraries, including the RNNoise LADSPA plugin

## Sync / Apply configurations

Clone the repository, then back up any existing configuration files that conflict with the managed files.

Apply all packages:

`stow --target="$HOME" sway waybar foot dunst pipewire shell bin lib mangohud`

Preview changes before applying:

`stow --simulate --verbose --target="$HOME" sway waybar foot dunst pipewire shell bin lib mangohud`

To manage only one package:

`stow --target="$HOME" sway`

## Backup and sync changes

Configuration files are symlinks to files in this repository. Editing a managed file through $HOME also edits the repository copy.

Changes to managed files are reflected automatically because the symlinks point into the repository.

Note: Git does not back up files outside this repository. Keep separate backups of untracked files and machine-specific data.

## Backups

Before replacing existing configurations, create a backup:

`cp -a ~/.config/sway ~/.config/sway.backup`

Repeat for other configuration directories as needed.

## Remove a package

Remove its symlinks without deleting the files in the repository:

`stow --delete --target="$HOME" sway`
