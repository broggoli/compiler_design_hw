; generated from: oatprograms/run47.oat
target triple = "x86_64-unknown-linux"
@a = global i64 1

define i64 @f() {
  %_a33 = load i64, i64* @a
  %_bop34 = add i64 %_a33, 1
  store i64 %_bop34, i64* @a
  %_a35 = load i64, i64* @a
  ret i64 %_a35
}

define i64 @program(i64 %_argc3, { i64, [0 x i8*] }* %_argv1) {
  %_argc4 = alloca i64
  %_argv2 = alloca { i64, [0 x i8*] }*
  %_i15 = alloca i64
  %_b19 = alloca { i64, [0 x i64] }*
  store i64 %_argc3, i64* %_argc4
  store { i64, [0 x i8*] }* %_argv1, { i64, [0 x i8*] }** %_argv2
  %_result5 = call i64 @f()
  %_raw_array6 = call i64* @oat_alloc_array(i64 %_result5)
  %_array7 = bitcast i64* %_raw_array6 to { i64, [0 x i64] }*
  store i64 0, i64* %_i15
  br label %_cond10
_cond10:
  %_local_id14 = load i64, i64* %_i15
  %_index_in_bound11 = icmp slt i64 %_i15, %_result5
  br i1 %_index_in_bound11, label %_body9, label %_post8
_body9:
  %_index_ptr13 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7, i32 0, i32 1, i64 %_local_id14
  %_i16 = load i64, i64* %_i15
  store i64 %_i16, i64* %_index_ptr13
  %_bop12 = add i64 %_local_id14, 1
  store i64 %_bop12, i64* %_i15
  br label %_cond10
_post8:
  store { i64, [0 x i64] }* %_array7, { i64, [0 x i64] }** %_b19
  %_a20 = load i64, i64* @a
  %_b21 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b19
  %_cast22 = bitcast { i64, [0 x i64] }* %_b21 to i64*
  call void @oat_assert_array_length(i64* %_cast22, i64 0)
  %_index_ptr24 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_b21, i32 0, i32 1, i32 0
  %_index25 = load i64, i64* %_index_ptr24
  %_bop26 = add i64 %_a20, %_index25
  %_b27 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b19
  %_cast28 = bitcast { i64, [0 x i64] }* %_b27 to i64*
  call void @oat_assert_array_length(i64* %_cast28, i64 1)
  %_index_ptr30 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_b27, i32 0, i32 1, i32 1
  %_index31 = load i64, i64* %_index_ptr30
  %_bop32 = add i64 %_bop26, %_index31
  ret i64 %_bop32
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
