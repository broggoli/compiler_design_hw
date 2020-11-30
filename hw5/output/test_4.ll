; generated from: oatprograms/run16.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %_argc1551, { i64, [0 x i8*] }* %_argv1549) {
  %_argc1552 = alloca i64
  %_argv1550 = alloca { i64, [0 x i8*] }*
  %_x1553 = alloca i64
  %_i1557 = alloca i64
  %_j1570 = alloca i64
  %_a1589 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_b1591 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %_argc1551, i64* %_argc1552
  store { i64, [0 x i8*] }* %_argv1549, { i64, [0 x i8*] }** %_argv1550
  store i64 10, i64* %_x1553
  %_raw_array1554 = call i64* @oat_alloc_array(i64 3)
  %_array1555 = bitcast i64* %_raw_array1554 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 3, i64* %_i1557
  br label %_cond1562
_cond1562:
  %_i1558 = load i64, i64* %_i1557
  %_bop1559 = icmp slt i64 %_i1558, 3
  br i1 %_bop1559, label %_body1561, label %_post1560
_body1561:
  %__tmp_array_sym15561563 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array1555
  %_i1564 = load i64, i64* %_i1557
  %_index_ptr1566 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym15561563, i32 0, i32 1, i64 %_i1564
  %_raw_array1567 = call i64* @oat_alloc_array(i64 3)
  %_array1568 = bitcast i64* %_raw_array1567 to { i64, [0 x i64] }*
  store i64 3, i64* %_j1570
  br label %_cond1575
_cond1575:
  %_j1571 = load i64, i64* %_j1570
  %_bop1572 = icmp slt i64 %_j1571, 3
  br i1 %_bop1572, label %_body1574, label %_post1573
_body1574:
  %__tmp_array_sym15691576 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1568
  %_j1577 = load i64, i64* %_j1570
  %_index_ptr1579 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym15691576, i32 0, i32 1, i64 %_j1577
  %_x1580 = load i64, i64* %_x1553
  %_i1581 = load i64, i64* %_i1557
  %_bop1582 = add i64 %_x1580, %_i1581
  %_j1583 = load i64, i64* %_j1570
  %_bop1584 = add i64 %_bop1582, %_j1583
  store i64 %_bop1584, i64* %_index_ptr1579
  %_j1585 = load i64, i64* %_j1570
  %_bop1586 = add i64 %_j1585, 1
  store i64 %_bop1586, i64* %_j1570
  br label %_cond1575
_post1573:
  store { i64, [0 x i64] }* %_array1568, { i64, [0 x i64] }** %_index_ptr1566
  %_i1587 = load i64, i64* %_i1557
  %_bop1588 = add i64 %_i1587, 1
  store i64 %_bop1588, i64* %_i1557
  br label %_cond1562
_post1560:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1555, { i64, [0 x { i64, [0 x i64] }*] }** %_a1589
  %_a1590 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1589
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a1590, { i64, [0 x { i64, [0 x i64] }*] }** %_b1591
  %_b1592 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b1591
  %_index_ptr1594 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_b1592, i32 0, i32 1, i32 2
  %_index1595 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1594
  %_index_ptr1597 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1595, i32 0, i32 1, i32 1
  %_index1598 = load i64, i64* %_index_ptr1597
  ret i64 %_index1598
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
