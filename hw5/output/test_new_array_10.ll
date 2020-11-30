; generated from: oatprograms/test_new_array.oat
target triple = "x86_64-unknown-linux"
define i8* @program() {
  %_i4 = alloca i64
  %_r17 = alloca { i64, [0 x i64] }*
  %_raw_array1 = call i64* @oat_alloc_array(i64 5)
  %_array2 = bitcast i64* %_raw_array1 to { i64, [0 x i64] }*
  store i64 0, i64* %_i4
  br label %_cond9
_cond9:
  %_i5 = load i64, i64* %_i4
  %_bop6 = icmp slt i64 %_i5, 5
  br i1 %_bop6, label %_body8, label %_post7
_body8:
  %__tmp_array_sym310 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array2
  %_i11 = load i64, i64* %_i4
  %_index_ptr13 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym310, i32 0, i32 1, i64 %_i11
  %_i14 = load i64, i64* %_i4
  store i64 %_i14, i64* %_index_ptr13
  %_i15 = load i64, i64* %_i4
  %_bop16 = add i64 %_i15, 1
  store i64 %_bop16, i64* %_i4
  br label %_cond9
_post7:
  store { i64, [0 x i64] }* %_array2, { i64, [0 x i64] }** %_r17
  %_r18 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r17
  %_result19 = call i8* @string_of_array({ i64, [0 x i64] }* %_r18)
  ret i8* %_result19
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
