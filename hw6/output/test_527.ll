; generated from: oatprograms/easyrun6.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %_argc8228, { i64, [0 x i8*] }* %_argv8225) {
  %_bop8233 = add i64 -4, 5
  %_bop8235 = mul i64 6, 4
  %_bop8238 = or i1 0, 1
  br i1 %_bop8238, label %_then8241, label %_else8240
_else8240:
  ret i64 4
_merge8239:
  ret i64 0
_then8241:
  ret i64 9
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