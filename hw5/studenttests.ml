open Assert
open Gradedtests

(* These tests are provided by you -- they will be graded manually *)

(* You should also add additional test cases here to help you   *)
(* debug your program.                                          *)


let hard_tests = [
  ("hw5programs/compile_downcast.oat", "", "1");
  ("hw5programs/compile_function_fieldstest.oat", "", "1");
  ("oatprograms/linked_list.oat", "", "6");
]

let provided_tests : suite = [
  Test("hard_tests provided", executed_oat_file hard_tests);
  Test("easy_array_tests provided", executed_oat_file easy_array_tests);
] 
