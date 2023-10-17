{ pkgs, lib, ... }: {
  home.packages = [ pkgs.sublime-music ];
#   home.persistence = {
#     "/persist/home/name".directories = [ ".config/sublime-music" ];
#   };
}
