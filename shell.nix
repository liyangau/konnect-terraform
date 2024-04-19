{
  pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
   }
}:

pkgs.mkShell {
  packages = with pkgs; [ terraform ];
  shellHook = ''
    export TF_VAR_cp_region=au
    export TF_VAR_exclude_mesh_control_plane=true
  '';
}
