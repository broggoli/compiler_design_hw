; generated from: oatprograms/run16.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %_argc1597, { i64, [0 x i8*] }* %_argv1595) {
  %_argc1598 = alloca i64
  %_argv1596 = alloca { i64, [0 x i8*] }*
  %_x1599 = alloca i64
  %_i1608 = alloca i64
  %_j1619 = alloca i64
  %_a1631 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_b1633 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %_argc1597, i64* %_argc1598
  store { i64, [0 x i8*] }* %_argv1595, { i64, [0 x i8*] }** %_argv1596
  store i64 10, i64* %_x1599
  %_raw_array1600 = call i64* @oat_alloc_array(i64 3)
  %_array1601 = bitcast i64* %_raw_array1600 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i1608
  br label %_cond1604
_cond1604:
  %_i1609 = load i64, i64* %_i1608
  %_bop1610 = icmp slt i64 %_i1609, 3
  br i1 %_bop1610, label %_body1603, label %_post1602
_body1603:
  %_local_id1607 = load i64, i64* %_i1608
  %_index_ptr1606 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1601, i32 0, i32 1, i64 %_local_id1607
  %_raw_array1611 = call i64* @oat_alloc_array(i64 3)
  %_array1612 = bitcast i64* %_raw_array1611 to { i64, [0 x i64] }*
  store i64 0, i64* %_j1619
  br label %_cond1615
_cond1615:
  %_j1620 = load i64, i64* %_j1619
  %_bop1621 = icmp slt i64 %_j1620, 3
  br i1 %_bop1621, label %_body1614, label %_post1613
_body1614:
  %_local_id1618 = load i64, i64* %_j1619
  %_index_ptr1617 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1612, i32 0, i32 1, i64 %_local_id1618
  %_x1622 = load i64, i64* %_x1599
  %_i1623 = load i64, i64* %_i1608
  %_bop1624 = add i64 %_x1622, %_i1623
  %_j1625 = load i64, i64* %_j1619
  %_bop1626 = add i64 %_bop1624, %_j1625
  store i64 %_bop1626, i64* %_index_ptr1617
  %_bop1616 = add i64 %_local_id1618, 1
  store i64 %_bop1616, i64* %_j1619
  br label %_cond1615
_post1613:
  store { i64, [0 x i64] }* %_array1612, { i64, [0 x i64] }** %_index_ptr1606
  %_bop1605 = add i64 %_local_id1607, 1
  store i64 %_bop1605, i64* %_i1608
  br label %_cond1604
_post1602:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1601, { i64, [0 x { i64, [0 x i64] }*] }** %_a1631
  %_a1632 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1631
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a1632, { i64, [0 x { i64, [0 x i64] }*] }** %_b1633
  %_b1634 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b1633
  %_cast1635 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_b1634 to i64*
  call void @oat_assert_array_length(i64* %_cast1635, i64 2)
  %_index_ptr1637 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_b1634, i32 0, i32 1, i32 2
  %_index1638 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1637
  %_cast1639 = bitcast { i64, [0 x i64] }* %_index1638 to i64*
  call void @oat_assert_array_length(i64* %_cast1639, i64 1)
  %_index_ptr1641 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1638, i32 0, i32 1, i32 1
  %_index1642 = load i64, i64* %_index_ptr1641
  ret i64 %_index1642
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
