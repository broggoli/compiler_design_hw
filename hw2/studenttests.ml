open Assert
open X86
open Simulator
open Asm

(* You can use this file for additional test cases to help your *)
(* implementation.                                              *)


let shr =
  Gradedtests.test_machine
  [
  InsB0 (Movq, [ ~$16; ~%Rax ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Movq, [ ~$16; Gradedtests.stack_offset 0L ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Movq, [ ~$(-16); Gradedtests.stack_offset (-8L) ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Movq, [ ~$3; ~%Rcx ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Shrq, [ ~$1; ~%Rax ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Shrq, [ ~%Rcx; Gradedtests.stack_offset 0L ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Shrq, [ ~%Rcx; Gradedtests.stack_offset (-8L) ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  ]
  
  let sar =
  Gradedtests.test_machine
  [
  InsB0 (Movq, [ ~$16; ~%Rax ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Movq, [ ~$16; Gradedtests.stack_offset 0L ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Movq, [ ~$(-16); Gradedtests.stack_offset (-8L) ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Movq, [ ~$3; ~%Rcx ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Sarq, [ ~$1; ~%Rax ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Sarq, [ ~%Rcx; Gradedtests.stack_offset 0L ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsB0 (Sarq, [ ~%Rcx; Gradedtests.stack_offset (-8L) ]);
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  InsFrag;
  ]

(* Example Programs *)

let helloworld = 
[ text "foo"
  [ Xorq, [~%Rax; ~%Rax]
  ; Movq, [~$100; ~%Rax]
  ; Retq, []
  ]
; text "main" 
  [ Xorq, [~%Rax; ~%Rax]
  ; Movq, [Ind1 (Lbl "baz"); ~%Rax]
  ; Retq, []
  ]
; data "baz" 
  [ Quad (Lit 99L)
  ; Asciz "Hello, world!"
  ]
]

let factorial_iter n = 
[ text "main"
        [ Movq,  [~$1; ~%Rax]
        ; Movq,  [~$n; ~%Rdi]
        ]
 ; text "loop"
        [ Cmpq,  [~$0; ~%Rdi]
        ; J Eq,  [~$$"exit"]
        ; Imulq, [~%Rdi; ~%Rax]
        ; Decq,  [~%Rdi]
        ; Jmp,   [~$$"loop"]
        ]
 ; text "exit"
        [ Retq,  [] 
        ]
 ]

let factorial_rec n = 
[ text "fac"
  [ Subq,  [~$8; ~%Rsp]
  ; Cmpq,  [~$1; ~%Rdi]
  ; J Le,  [~$$"exit"]
  ; Movq,  [~%Rdi; Ind2 Rsp]
  ; Decq,  [~%Rdi]
  ; Callq, [~$$"fac"]
  ; Imulq, [Ind2 Rsp; ~%Rax]
  ; Addq,  [~$8; ~%Rsp]
  ; Retq,  []
  ]
; text "exit"
  [ Movq,  [~$1; ~%Rax]
  ; Addq,  [~$8; ~%Rsp]
  ; Retq,  [] 
  ]
; gtext "main"
  [ Movq,  [~$n; ~%Rdi]
  ; Callq, [~$$"fac"]
  ; Retq,  []
  ]
]


  
let bit_manipulation =
  [
  ( "shr",
  Gradedtests.machine_test "rax=8 *65528=2 *65520=0x2000000000000000" 7 shr
  (fun m -> m.regs.(rind Rax) = 8L
  && int64_of_sbytes (Gradedtests.sbyte_list m.mem (mem_size - 8)) = 2L
  && int64_of_sbytes (Gradedtests.sbyte_list m.mem (mem_size - 16))
  = 2305843009213693950L) );
  ( "sar",
  Gradedtests.machine_test "rax=8 *65528=2 *65520=-2" 7 sar (fun m -> m.regs.(rind Rax) = 8L
  && int64_of_sbytes (Gradedtests.sbyte_list m.mem (mem_size - 8)) = 2L
  && int64_of_sbytes (Gradedtests.sbyte_list m.mem (mem_size - 16))
  = -2L) );
  ]

let e2e = [
  ("Hello World", Gradedtests.program_test helloworld 99L);
  ("Factorial Iter", Gradedtests.program_test (factorial_iter 6) 720L);
  ("Factorial Rec", Gradedtests.program_test (factorial_rec 2) 2L);
]

let provided_tests : suite = [ 
  Test ("Bit manipulation", bit_manipulation);
  Test ("End-to-end", e2e);
]
