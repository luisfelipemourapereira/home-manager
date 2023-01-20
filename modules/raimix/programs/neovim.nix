{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.raimix.programs.neovim;

in
{
  options = {
    enable = mkEnableOption "neovim";

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
      home.packages = [ cfg.package ];
    })
  ];
}
