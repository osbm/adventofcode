let
  pkgs = builtins.getFlake "nixpkgs";
  lib = pkgs.lib;
  fileContent = builtins.readFile ./input;
  list_of_lists = lib.map (line: lib.map lib.toInt (lib.splitString "   " line)) (lib.splitString "\n" fileContent);

  is_safe = list: let
    is_increasing = lib.head list < lib.last list;
    check_diff = i: let
      diff = list.${toString (i + 1)} - list.${toString i};
    in
      (0 < lib.abs diff && lib.abs diff < 4) && (is_increasing && diff >= 0 || !is_increasing && diff <= 0);
  in
    lib.all (i: check_diff i) (lib.range 0 (lib.length list - 2));

  safe_lists = lib.filter is_safe list_of_lists;
in
{
  part1_solution = lib.length safe_lists;
}