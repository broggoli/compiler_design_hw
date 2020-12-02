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

let unit_tests = [
  "typecheck_ty_fun_ok",
    (fun () ->
       try
        Typechecker.typecheck_ty (Ast.no_loc []) Tctxt.empty (TNullRef (RFun ([TInt; TRef RString; TNullRef (RArray TBool)], RetVoid)));
       with
       | Typechecker.TypeError s -> failwith "should not fail"
    )
; ("typecheck_ty_fun_fail",
    (fun () ->
       try
        Typechecker.typecheck_ty (Ast.no_loc []) Tctxt.empty (TNullRef (RFun ([TInt; TRef RString; TNullRef (RArray TBool); TNullRef (RStruct "A")], RetVoid)));
        failwith "should not succeed"
       with
       | Typechecker.TypeError s -> ()
    )
  )
]

let provided_tests : suite = [
  Test("hard_tests provided", executed_oat_file hard_tests);
  Test("student unit_tests", unit_tests)
] 
