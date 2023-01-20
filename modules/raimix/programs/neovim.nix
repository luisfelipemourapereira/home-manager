{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.nvim;

in
{
  options = {
    enable = mkEnableOption "nvim";

    package = mkOption {
      type = types.package;
      default = pkgs.neovim-unwrapped;
      description = lib.mdDoc ''
        neovim derivation
      '';
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      # home.packages = [ cfg.package ];
    })
  ];
}
