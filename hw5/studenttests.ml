open Assert
open Gradedtests

(* These tests are provided by you -- they will be graded manually *)

(* You should also add additional test cases here to help you   *)
(* debug your program.                                          *)

let easy_array_tests = [
  ("hw5programs/initarr1.oat", "", "1");
  ("hw5programs/initarr2.oat", "", "2");
  ]
let hard_tests = [
  ("hw5programs/compile_downcast.oat", "", "1");
  (*("hw5programs/burowski_bfs.oat", "", "");
  ("hw5programs/chmartin_heapsort.oat", "", "");
  ("hw5programs/apoth_composition.oat", "", "");
  ("hw5programs/hand_rgb_to_gray.oat", "", "");
  ("hw5programs/gregor.oat", "", "");
  ("hw5programs/hta_map_reduce.oat", "", "");
  ("hw5programs/jacbrad_kruskal.oat", "", "");*)
  ("oatprograms/linked_list.oat", "", "6");
]

let provided_tests : suite = [
  Test("hard_tests provided", executed_oat_file hard_tests);
  Test("easy_array_tests provided", executed_oat_file easy_array_tests);
] 
