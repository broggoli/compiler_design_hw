; generated from: llprograms/cbr1.ll
target triple = "x86_64-unknown-linux"
define i64 @main(i64 %argc, i8** %arcv) {
  %cmp = icmp sgt i64 3, 0
  br i1 %cmp, label %then, label %else
else:
  ret i64 9
then:
  ret i64 7
}



