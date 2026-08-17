# Home Manager Configuration

This repo is for my home manager configuration, which manages my development
environment across Linux and MacOS.

## Setup
1. Install Nix, I personally use the [Determinate Nix installer](https://docs.determinate.systems/determinate-nix/).
2. Clone the repository into `~/.config/home-manager`.
3. Run `nix run home-manager/master -- switch --flake .#adrianb@linux` if on linux, or `nix run home-manager/master -- switch --flake .#adrian@mac`
on mac
