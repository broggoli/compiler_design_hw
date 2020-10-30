open Assert

(* These tests are provided by you -- they will not be graded  *)

(* You should also add additional test cases here to help you   *)
(* debug your program.                                          *)
let io_test path args =
  let ll_ast = Driver.parse_ll_file path in
  let output_path = !Platform.output_path in
  let dot_s_file = Platform.gen_name output_path "test" ".s" in
  let exec_file = Platform.gen_name output_path "exec" "" in
  let tmp_file = Platform.gen_name output_path "tmp" ".txt" in
  let asm_ast = Backend.compile_prog ll_ast in
  let asm_str = X86.string_of_prog asm_ast in
  let _ = Driver.write_file dot_s_file asm_str in
  let _ = Platform.link (dot_s_file::["cinterop.c"]) exec_file in
  let args = String.concat " " args in
  let result = Driver.run_program args exec_file tmp_file in
  let _ = Platform.sh (Printf.sprintf "rm -f %s %s %s" dot_s_file exec_file tmp_file) Platform.ignore_error in
  let _ = Platform.verb @@ Printf.sprintf "** Executable output:\n%s\n" result in
  result
let executed_io tests =
  List.map (fun (fn, args, ans) ->
      (fn ^ ":" ^ (String.concat " " args)), assert_eqf (fun () -> io_test fn args) ans)
    tests
    
let student_io_tests =
  [ "llprograms/args1.ll", ["hello"; "compilerdesign"; "foo"], "argc > 3"
  ]
let provided_tests : suite = [
  Test ("io tests", executed_io student_io_tests)
] 
