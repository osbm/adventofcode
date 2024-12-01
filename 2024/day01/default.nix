let
  pkgs = builtins.getFlake "nixpkgs";
  lib = pkgs.lib;
  fileContent = builtins.readFile ./input;
  list_of_lists = lib.map (line: lib.map lib.toInt (lib.splitString "   " line)) (lib.splitString "\n" fileContent);

  first_column = lib.map (list: lib.head list) list_of_lists;
  second_column = lib.map (list: lib.head (lib.tail list)) list_of_lists;

  comparator = (a: b: a < b);

  first_column_sorted = lib.sort comparator first_column;
  second_column_sorted = lib.sort comparator second_column;

  diffs = lib.zipListsWith (a: b: a - b) first_column_sorted second_column_sorted;

  absolute_diffs = lib.map (diff: if diff < 0 then -diff else diff) diffs;

  part2_solution = lib.foldl'  (a: b: a + b) 0 (lib.map (num: lib.foldl' (a: b: a + b) 0 (lib.map (num2: if num == num2 then num else 0) second_column_sorted)) first_column_sorted);
in
{
  part1_solution = lib.foldl' lib.add 0 absolute_diffs;
  inherit part2_solution;
}
