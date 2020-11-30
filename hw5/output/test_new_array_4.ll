; generated from: oatprograms/test_new_array.oat
target triple = "x86_64-unknown-linux"
define i8* @program() {
  %_i8 = alloca i64
  %_r16 = alloca { i64, [0 x i64] }*
  %_raw_array1 = call i64* @oat_alloc_array(i64 5)
  %_array2 = bitcast i64* %_raw_array1 to { i64, [0 x i64] }*
  store i64 0, i64* %_i8
  br label %_cond5
_cond5:
  %_i9 = load i64, i64* %_i8
  %_bop10 = icmp slt i64 %_i9, 5
  br i1 %_bop10, label %_body4, label %_post3
_body4:
  %_local_id7 = load i64, i64* %i
  %_index_ptr6 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2, i32 0, i32 1, i64 %_local_id7
  %_i11 = load i64, i64* %_i8
  store i64 %_i11, i64* %_index_ptr6
  %_bop12 = add i64 %_local_id13, 1
  store i64 %_bop12, i64* %i
  br label %_cond5
_post3:
  store { i64, [0 x i64] }* %_array2, { i64, [0 x i64] }** %_r16
  %_r17 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r16
  %_result18 = call i8* @string_of_array({ i64, [0 x i64] }* %_r17)
  ret i8* %_result18
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
