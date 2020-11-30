; generated from: oatprograms/run47.oat
target triple = "x86_64-unknown-linux"
@a = global i64 1

define i64 @f() {
  ret i64 1
}

define i64 @program(i64 %_argc3, { i64, [0 x i8*] }* %_argv1) {
  %_argc4 = alloca i64
  %_argv2 = alloca { i64, [0 x i8*] }*
  %_i14 = alloca i64
  %_b21 = alloca { i64, [0 x i64] }*
  store i64 %_argc3, i64* %_argc4
  store { i64, [0 x i8*] }* %_argv1, { i64, [0 x i8*] }** %_argv2
  %_result5 = call i64 @f()
  %_raw_array6 = call i64* @oat_alloc_array(i64 %_result5)
  %_array7 = bitcast i64* %_raw_array6 to { i64, [0 x i64] }*
  store i64 0, i64* %_i14
  br label %_cond10
_cond10:
  %_i15 = load i64, i64* %_i14
  %_result16 = call i64 @f()
  %_bop17 = icmp slt i64 %_i15, %_result16
  br i1 %_bop17, label %_body9, label %_post8
_body9:
  %_local_id13 = load i64, i64* %_i14
  %_index_ptr12 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7, i32 0, i32 1, i64 %_local_id13
  %_i18 = load i64, i64* %_i14
  store i64 %_i18, i64* %_index_ptr12
  %_bop11 = add i64 %_local_id13, 1
  store i64 %_bop11, i64* %_i14
  br label %_cond10
_post8:
  store { i64, [0 x i64] }* %_array7, { i64, [0 x i64] }** %_b21
  %_a22 = load i64, i64* @a
  %_b23 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b21
  %_cast24 = bitcast { i64, [0 x i64] }* %_b23 to i64*
  call void @oat_assert_array_length(i64* %_cast24, i64 0)
  %_index_ptr26 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_b23, i32 0, i32 1, i32 0
  %_index27 = load i64, i64* %_index_ptr26
  %_bop28 = add i64 %_a22, %_index27
  %_b29 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b21
  %_cast30 = bitcast { i64, [0 x i64] }* %_b29 to i64*
  call void @oat_assert_array_length(i64* %_cast30, i64 1)
  %_index_ptr32 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_b29, i32 0, i32 1, i32 1
  %_index33 = load i64, i64* %_index_ptr32
  %_bop34 = add i64 %_bop28, %_index33
  ret i64 %_bop34
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
