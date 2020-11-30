; generated from: oatprograms/run25.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %_argc1652, { i64, [0 x i8*] }* %_argv1650) {
  %_argc1653 = alloca i64
  %_argv1651 = alloca { i64, [0 x i8*] }*
  %_i1657 = alloca i64
  %_a1669 = alloca { i64, [0 x i64] }*
  %_str1672 = alloca i8*
  store i64 %_argc1652, i64* %_argc1653
  store { i64, [0 x i8*] }* %_argv1650, { i64, [0 x i8*] }** %_argv1651
  %_raw_array1654 = call i64* @oat_alloc_array(i64 3)
  %_array1655 = bitcast i64* %_raw_array1654 to { i64, [0 x i64] }*
  store i64 3, i64* %_i1657
  br label %_cond1662
_cond1662:
  %_i1658 = load i64, i64* %_i1657
  %_bop1659 = icmp slt i64 %_i1658, 3
  br i1 %_bop1659, label %_body1661, label %_post1660
_body1661:
  %__tmp_array_sym16561663 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1655
  %_i1664 = load i64, i64* %_i1657
  %_index_ptr1666 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym16561663, i32 0, i32 1, i64 %_i1664
  store i64 110, i64* %_index_ptr1666
  %_i1667 = load i64, i64* %_i1657
  %_bop1668 = add i64 %_i1667, 1
  store i64 %_bop1668, i64* %_i1657
  br label %_cond1662
_post1660:
  store { i64, [0 x i64] }* %_array1655, { i64, [0 x i64] }** %_a1669
  %_a1670 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1669
  %_result1671 = call i8* @string_of_array({ i64, [0 x i64] }* %_a1670)
  store i8* %_result1671, i8** %_str1672
  %_str1673 = load i8*, i8** %_str1672
  call void @print_string(i8* %_str1673)
  ret i64 0
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
