; generated from: hw5programs/ifq1.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %_argc4, { i64, [0 x i8*] }* %_argv1) {
  %_x7 = alloca { i64, [0 x i64] }*
  %_i13 = alloca i64
  %_z33 = alloca i64
  store { i64, [0 x i64] }* null, { i64, [0 x i64] }** %_x7
  %_raw_array11 = call i64* @oat_alloc_array(i64 3)
  %_array12 = bitcast i64* %_raw_array11 to { i64, [0 x i64] }*
  %_bnd_10 = alloca i64
  store i64 3, i64* %_bnd_10
  %_ptr_9 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array12, { i64, [0 x i64] }** %_ptr_9
  store i64 0, i64* %_i13
  br label %_cond20
_body19:
  %__ptr_921 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr_9
  %_i22 = load i64, i64* %_i13
  %_tmp24 = bitcast { i64, [0 x i64] }* %__ptr_921 to i64*
  call void @oat_assert_array_length(i64* %_tmp24, i64 %_i22)
  %_index_ptr25 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__ptr_921, i32 0, i32 1, i64 %_i22
  store i64 0, i64* %_index_ptr25
  %_i27 = load i64, i64* %_i13
  %_bop28 = add i64 %_i27, 1
  store i64 %_bop28, i64* %_i13
  br label %_cond20
_cond20:
  %_i15 = load i64, i64* %_i13
  %__bnd_1016 = load i64, i64* %_bnd_10
  %_bop17 = icmp slt i64 %_i15, %__bnd_1016
  br i1 %_bop17, label %_body19, label %_post18
_merge40:
  %_z44 = load i64, i64* %_z33
  ret i64 %_z44
_notnull41:
  store i64 4, i64* %_z33
  br label %_merge40
_null42:
  store i64 5, i64* %_z33
  br label %_merge40
_post18:
  store { i64, [0 x i64] }* %_array12, { i64, [0 x i64] }** %_x7
  store i64 0, i64* %_z33
  %_x35 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x7
  %_cast39 = icmp eq { i64, [0 x i64] }* %_x35, null
  br i1 %_cast39, label %_null42, label %_notnull41
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
