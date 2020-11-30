; generated from: oatprograms/test_new_array.oat
target triple = "x86_64-unknown-linux"
define i8* @program() {
  %_r8 = alloca { i64, [0 x i64] }*
  %_raw_array1 = call i64* @oat_alloc_array(i64 5)
  %_array2 = bitcast i64* %_raw_array1 to { i64, [0 x i64] }*
  %_ind3 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind3
  %_ind4 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4
  %_ind5 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2, i32 0, i32 1, i32 2
  store i64 2, i64* %_ind5
  %_ind6 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2, i32 0, i32 1, i32 3
  store i64 3, i64* %_ind6
  %_ind7 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2, i32 0, i32 1, i32 4
  store i64 4, i64* %_ind7
  store { i64, [0 x i64] }* %_array2, { i64, [0 x i64] }** %_r8
  %_r9 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r8
  %_result10 = call i8* @string_of_array({ i64, [0 x i64] }* %_r9)
  ret i8* %_result10
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
