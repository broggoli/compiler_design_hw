; generated from: llprograms/br2.ll
target triple = "x86_64-unknown-linux"
define i64 @main(i64 %argc, i8** %arcv) {
  %1 = add i64 5, 12
  br label %next
end:
  ret i64 %1
next:
  br label %end
}



