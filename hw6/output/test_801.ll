; generated from: oatprograms/easyrun8.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %_argc8258, { i64, [0 x i8*] }* %_argv8255) {
  %_bop8261 = icmp ne i64 6, 5
  br i1 %_bop8261, label %_then8272, label %_else8271
_else8271:
  ret i64 2
_merge8270:
  ret i64 0
_then8272:
  %_bop8269 = add i64 -102, 6
  ret i64 %_bop8269
}


declare i64* @oat_malloc(i64)
declare i64* @oat_alloc_array(i64)
declare void @oat_assert_not_null(i8*)
declare void @oat_assert_array_length(i64*, i64)
declare { i64, [0 x i64] }* @array_of_string(i8*)
declare i8* @string_of_array({ i64, [0 x i64] }*)
declare i64 @length_of_string(i8*)
declare i8* @string_of_int(i64)
declare i8* @string_cat(i8*, i8*)
declare void @print_string(i8*)
declare void @print_int(i64)
declare void @print_bool(i1)
