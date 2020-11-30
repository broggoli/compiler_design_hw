; generated from: oatprograms/test_new_array.oat
target triple = "x86_64-unknown-linux"
define i8* @program(i64 %_argc3, { i64, [0 x i8*] }* %_argv1) {
  %_argc4 = alloca i64
  %_argv2 = alloca { i64, [0 x i8*] }*
  %_arr10 = alloca { i64, [0 x i64] }*
  %_i14 = alloca i64
  %_r32 = alloca { i64, [0 x i64] }*
  store i64 %_argc3, i64* %_argc4
  store { i64, [0 x i8*] }* %_argv1, { i64, [0 x i8*] }** %_argv2
  %_argv5 = load { i64, [0 x i8*] }*, { i64, [0 x i8*] }** %_argv2
  %_index_ptr7 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_argv5, i32 0, i32 1, i32 1
  %_index8 = load i8*, i8** %_index_ptr7
  %_result9 = call { i64, [0 x i64] }* @array_of_string(i8* %_index8)
  store { i64, [0 x i64] }* %_result9, { i64, [0 x i64] }** %_arr10
  %_raw_array11 = call i64* @oat_alloc_array(i64 5)
  %_array12 = bitcast i64* %_raw_array11 to { i64, [0 x i64] }*
  store i64 0, i64* %_i14
  br label %_cond19
_cond19:
  %_i15 = load i64, i64* %_i14
  %_bop16 = icmp slt i64 %_i15, 5
  br i1 %_bop16, label %_body18, label %_post17
_body18:
  %__tmp_array_sym1320 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array12
  %_i21 = load i64, i64* %_i14
  %_index_ptr23 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym1320, i32 0, i32 1, i64 %_i21
  %_arr24 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr10
  %_i25 = load i64, i64* %_i14
  %_bop26 = add i64 %_i25, 3
  %_index_ptr28 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr24, i32 0, i32 1, i64 %_bop26
  %_index29 = load i64, i64* %_index_ptr28
  store i64 %_index29, i64* %_index_ptr23
  %_i30 = load i64, i64* %_i14
  %_bop31 = add i64 %_i30, 1
  store i64 %_bop31, i64* %_i14
  br label %_cond19
_post17:
  store { i64, [0 x i64] }* %_array12, { i64, [0 x i64] }** %_r32
  %_r33 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r32
  %_result34 = call i8* @string_of_array({ i64, [0 x i64] }* %_r33)
  ret i8* %_result34
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
