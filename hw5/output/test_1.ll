; generated from: oatprograms/run15.oat
target triple = "x86_64-unknown-linux"
define i64 @f({ i64, [0 x { i64, [0 x i64] }*] }* %_a1584) {
  %_a1585 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a1584, { i64, [0 x { i64, [0 x i64] }*] }** %_a1585
  %_a1586 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1585
  %_cast1587 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_a1586 to i64*
  call void @oat_assert_array_length(i64* %_cast1587, i64 1)
  %_index_ptr1589 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a1586, i32 0, i32 1, i32 1
  %_index1590 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1589
  %_cast1591 = bitcast { i64, [0 x i64] }* %_index1590 to i64*
  call void @oat_assert_array_length(i64* %_cast1591, i64 1)
  %_index_ptr1593 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1590, i32 0, i32 1, i32 1
  %_index1594 = load i64, i64* %_index_ptr1593
  ret i64 %_index1594
}

define i64 @g(i64 %_x1545) {
  %_x1546 = alloca i64
  %_i1555 = alloca i64
  %_j1566 = alloca i64
  %_arr1574 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %_x1545, i64* %_x1546
  %_raw_array1547 = call i64* @oat_alloc_array(i64 3)
  %_array1548 = bitcast i64* %_raw_array1547 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i1555
  br label %_cond1551
_cond1551:
  %_i1556 = load i64, i64* %_i1555
  %_bop1557 = icmp slt i64 %_i1556, 3
  br i1 %_bop1557, label %_body1550, label %_post1549
_body1550:
  %_local_id1554 = load i64, i64* %_i1555
  %_index_ptr1553 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1548, i32 0, i32 1, i64 %_local_id1554
  %_raw_array1558 = call i64* @oat_alloc_array(i64 3)
  %_array1559 = bitcast i64* %_raw_array1558 to { i64, [0 x i64] }*
  store i64 0, i64* %_j1566
  br label %_cond1562
_cond1562:
  %_j1567 = load i64, i64* %_j1566
  %_bop1568 = icmp slt i64 %_j1567, 3
  br i1 %_bop1568, label %_body1561, label %_post1560
_body1561:
  %_local_id1565 = load i64, i64* %_j1566
  %_index_ptr1564 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1559, i32 0, i32 1, i64 %_local_id1565
  %_x1569 = load i64, i64* %_x1546
  store i64 %_x1569, i64* %_index_ptr1564
  %_bop1563 = add i64 %_local_id1565, 1
  store i64 %_bop1563, i64* %_j1566
  br label %_cond1562
_post1560:
  store { i64, [0 x i64] }* %_array1559, { i64, [0 x i64] }** %_index_ptr1553
  %_bop1552 = add i64 %_local_id1554, 1
  store i64 %_bop1552, i64* %_i1555
  br label %_cond1551
_post1549:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1548, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1574
  %_arr1575 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1574
  %_cast1576 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr1575 to i64*
  call void @oat_assert_array_length(i64* %_cast1576, i64 1)
  %_index_ptr1578 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr1575, i32 0, i32 1, i32 1
  %_index1579 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1578
  %_cast1580 = bitcast { i64, [0 x i64] }* %_index1579 to i64*
  call void @oat_assert_array_length(i64* %_cast1580, i64 1)
  %_index_ptr1582 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1579, i32 0, i32 1, i32 1
  %_index1583 = load i64, i64* %_index_ptr1582
  ret i64 %_index1583
}

define i64 @program(i64 %_argc1431, { i64, [0 x i8*] }* %_argv1429) {
  %_argc1432 = alloca i64
  %_argv1430 = alloca { i64, [0 x i8*] }*
  %_i1441 = alloca i64
  %_j1452 = alloca i64
  %_a1460 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i1469 = alloca i64
  %_j1480 = alloca i64
  %_arr1490 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i1499 = alloca i64
  %_j1510 = alloca i64
  %_arr01520 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %_argc1431, i64* %_argc1432
  store { i64, [0 x i8*] }* %_argv1429, { i64, [0 x i8*] }** %_argv1430
  %_raw_array1433 = call i64* @oat_alloc_array(i64 3)
  %_array1434 = bitcast i64* %_raw_array1433 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i1441
  br label %_cond1437
_cond1437:
  %_i1442 = load i64, i64* %_i1441
  %_bop1443 = icmp slt i64 %_i1442, 3
  br i1 %_bop1443, label %_body1436, label %_post1435
_body1436:
  %_local_id1440 = load i64, i64* %_i1441
  %_index_ptr1439 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1434, i32 0, i32 1, i64 %_local_id1440
  %_raw_array1444 = call i64* @oat_alloc_array(i64 3)
  %_array1445 = bitcast i64* %_raw_array1444 to { i64, [0 x i64] }*
  store i64 0, i64* %_j1452
  br label %_cond1448
_cond1448:
  %_j1453 = load i64, i64* %_j1452
  %_bop1454 = icmp slt i64 %_j1453, 3
  br i1 %_bop1454, label %_body1447, label %_post1446
_body1447:
  %_local_id1451 = load i64, i64* %_j1452
  %_index_ptr1450 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1445, i32 0, i32 1, i64 %_local_id1451
  %_j1455 = load i64, i64* %_j1452
  store i64 %_j1455, i64* %_index_ptr1450
  %_bop1449 = add i64 %_local_id1451, 1
  store i64 %_bop1449, i64* %_j1452
  br label %_cond1448
_post1446:
  store { i64, [0 x i64] }* %_array1445, { i64, [0 x i64] }** %_index_ptr1439
  %_bop1438 = add i64 %_local_id1440, 1
  store i64 %_bop1438, i64* %_i1441
  br label %_cond1437
_post1435:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1434, { i64, [0 x { i64, [0 x i64] }*] }** %_a1460
  %_raw_array1461 = call i64* @oat_alloc_array(i64 4)
  %_array1462 = bitcast i64* %_raw_array1461 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i1469
  br label %_cond1465
_cond1465:
  %_i1470 = load i64, i64* %_i1469
  %_bop1471 = icmp slt i64 %_i1470, 4
  br i1 %_bop1471, label %_body1464, label %_post1463
_body1464:
  %_local_id1468 = load i64, i64* %_i1469
  %_index_ptr1467 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1462, i32 0, i32 1, i64 %_local_id1468
  %_raw_array1472 = call i64* @oat_alloc_array(i64 5)
  %_array1473 = bitcast i64* %_raw_array1472 to { i64, [0 x i64] }*
  store i64 0, i64* %_j1480
  br label %_cond1476
_cond1476:
  %_j1481 = load i64, i64* %_j1480
  %_bop1482 = icmp slt i64 %_j1481, 5
  br i1 %_bop1482, label %_body1475, label %_post1474
_body1475:
  %_local_id1479 = load i64, i64* %_j1480
  %_index_ptr1478 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1473, i32 0, i32 1, i64 %_local_id1479
  %_i1483 = load i64, i64* %_i1469
  %_j1484 = load i64, i64* %_j1480
  %_bop1485 = mul i64 %_i1483, %_j1484
  store i64 %_bop1485, i64* %_index_ptr1478
  %_bop1477 = add i64 %_local_id1479, 1
  store i64 %_bop1477, i64* %_j1480
  br label %_cond1476
_post1474:
  store { i64, [0 x i64] }* %_array1473, { i64, [0 x i64] }** %_index_ptr1467
  %_bop1466 = add i64 %_local_id1468, 1
  store i64 %_bop1466, i64* %_i1469
  br label %_cond1465
_post1463:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1462, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1490
  %_raw_array1491 = call i64* @oat_alloc_array(i64 3)
  %_array1492 = bitcast i64* %_raw_array1491 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i1499
  br label %_cond1495
_cond1495:
  %_i1500 = load i64, i64* %_i1499
  %_bop1501 = icmp slt i64 %_i1500, 3
  br i1 %_bop1501, label %_body1494, label %_post1493
_body1494:
  %_local_id1498 = load i64, i64* %_i1499
  %_index_ptr1497 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1492, i32 0, i32 1, i64 %_local_id1498
  %_raw_array1502 = call i64* @oat_alloc_array(i64 3)
  %_array1503 = bitcast i64* %_raw_array1502 to { i64, [0 x i64] }*
  store i64 0, i64* %_j1510
  br label %_cond1506
_cond1506:
  %_j1511 = load i64, i64* %_j1510
  %_bop1512 = icmp slt i64 %_j1511, 3
  br i1 %_bop1512, label %_body1505, label %_post1504
_body1505:
  %_local_id1509 = load i64, i64* %_j1510
  %_index_ptr1508 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1503, i32 0, i32 1, i64 %_local_id1509
  %_i1513 = load i64, i64* %_i1499
  %_j1514 = load i64, i64* %_j1510
  %_bop1515 = mul i64 %_i1513, %_j1514
  store i64 %_bop1515, i64* %_index_ptr1508
  %_bop1507 = add i64 %_local_id1509, 1
  store i64 %_bop1507, i64* %_j1510
  br label %_cond1506
_post1504:
  store { i64, [0 x i64] }* %_array1503, { i64, [0 x i64] }** %_index_ptr1497
  %_bop1496 = add i64 %_local_id1498, 1
  store i64 %_bop1496, i64* %_i1499
  br label %_cond1495
_post1493:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1492, { i64, [0 x { i64, [0 x i64] }*] }** %_arr01520
  %_arr1521 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1490
  %_cast1522 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr1521 to i64*
  call void @oat_assert_array_length(i64* %_cast1522, i64 3)
  %_index_ptr1524 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr1521, i32 0, i32 1, i32 3
  %_index1525 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1524
  %_cast1526 = bitcast { i64, [0 x i64] }* %_index1525 to i64*
  call void @oat_assert_array_length(i64* %_cast1526, i64 4)
  %_index_ptr1528 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1525, i32 0, i32 1, i32 4
  %_index1529 = load i64, i64* %_index_ptr1528
  %_a1530 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1460
  %_cast1531 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_a1530 to i64*
  call void @oat_assert_array_length(i64* %_cast1531, i64 1)
  %_index_ptr1533 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a1530, i32 0, i32 1, i32 1
  %_index1534 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1533
  %_cast1535 = bitcast { i64, [0 x i64] }* %_index1534 to i64*
  call void @oat_assert_array_length(i64* %_cast1535, i64 2)
  %_index_ptr1537 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1534, i32 0, i32 1, i32 2
  %_index1538 = load i64, i64* %_index_ptr1537
  %_bop1539 = add i64 %_index1529, %_index1538
  %_arr01540 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr01520
  %_result1541 = call i64 @f({ i64, [0 x { i64, [0 x i64] }*] }* %_arr01540)
  %_bop1542 = add i64 %_bop1539, %_result1541
  %_result1543 = call i64 @g(i64 4)
  %_bop1544 = add i64 %_bop1542, %_result1543
  ret i64 %_bop1544
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
