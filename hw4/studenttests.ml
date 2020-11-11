open Assert
open Astlib
open Ast
(* These tests are provided by you *)

(* You should also add additional test cases here to help you   *)
(* debug your program.    
                                      *)
let assert_eq_ast (f: 'a -> 'a -> bool) (print : 'a -> string) (x: 'a) (y: unit -> 'a)  : assertion =
  fun () ->
  let result = y () in
  if f x result then () else
      let msg = Printf.sprintf "EXPECTED: %s\nGOT: %s\n" (print x) (print result) in
      failwith msg

let parse_test parse (compare : 'a -> 'a -> bool) (printer : 'a -> string) (code : string) (ast : 'a)  : assertion =
  let lexbuf = Lexing.from_string code in
  assert_eq_ast compare printer ast (fun () -> (parse Lexer.token lexbuf))

let stmt_test code ast = parse_test Parser.stmt_top eq_stmt string_of_stmt code ast

let exp_test code ast = parse_test Parser.exp_top eq_exp string_of_exp code ast
let stud_exp_test = [
  ("parse exp test 13", exp_test "1+2 >> (3-4 >>> 7*8) << 9" (no_loc (Bop (Shl,no_loc (Bop (Shr,no_loc (Bop (Add,no_loc (CInt 1L),no_loc (CInt 2L))),no_loc (Bop (Sar,no_loc (Bop (Sub,no_loc (CInt 3L),no_loc (CInt 4L))),no_loc (Bop (Mul,no_loc (CInt 7L),no_loc (CInt 8L))))))),no_loc (CInt 9L)))))
]
let stud_stmt_test = [
  ("parse stmt test 13", stmt_test "for (var i = 0, var j = 0; ;) { }" (no_loc (For ([ "i", no_loc (CInt 0L) ; "j", no_loc (CInt 0L) ], None, None, [ ]))))
]

let parse_tests = [] (*tud_stmt_test @ stud_exp_test*)
let provided_tests : suite = [
  Test("student parse tests", parse_tests);
] 
