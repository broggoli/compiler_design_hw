; generated from: hw5programs/compile_assign_struct.oat
target triple = "x86_64-unknown-linux"
%Point = type { i64, i64 }

define i64 @program(i64 %_argc3, { i64, [0 x i8*] }* %_argv1) {
  %_argc4 = alloca i64
  %_argv2 = alloca { i64, [0 x i8*] }*
  %_p11 = alloca %Point*
  store i64 %_argc3, i64* %_argc4
  store { i64, [0 x i8*] }* %_argv1, { i64, [0 x i8*] }** %_argv2
  %_raw_struct5 = call i64* @oat_malloc(i64 2)
  %_struct6 = bitcast i64* %_raw_struct5 to %Point*
  %_index_ptr9 = getelementptr %Point, %Point* %_struct6, i32 0, i32 1, i32 1
  store i64 4, i64* %_index_ptr9
  %_index_ptr7 = getelementptr %Point, %Point* %_struct6, i32 0, i32 1, i32 0
  store i64 3, i64* %_index_ptr7
  store %Point* %_struct6, %Point** %_p11
  %_p12 = load %Point*, %Point** %_p11
  store i64 5, i64* %_field_op14
  %_p15 = load %Point*, %Point** %_p11
  %_p18 = load %Point*, %Point** %_p11
  %_proj21 = load i64, i64* %_field_op20
  %_p22 = load %Point*, %Point** %_p11
  %_proj25 = load i64, i64* %_field_op24
  %_bop26 = add i64 %_proj21, %_proj25
  %_bop27 = add i64 %_bop26, 3
  store i64 %_bop27, i64* %_field_op17
  %_p28 = load %Point*, %Point** %_p11
  %_p31 = load %Point*, %Point** %_p11
  %_proj34 = load i64, i64* %_field_op33
  %_bop35 = add i64 %_proj34, 4
  store i64 %_bop35, i64* %_field_op30
  %_p36 = load %Point*, %Point** %_p11
  %_proj39 = load i64, i64* %_field_op38
  ret i64 %_proj39
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
