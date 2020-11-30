; generated from: oatprograms/run15.oat
target triple = "x86_64-unknown-linux"
define i64 @f({ i64, [0 x { i64, [0 x i64] }*] }* %_a1540) {
  %_a1541 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a1540, { i64, [0 x { i64, [0 x i64] }*] }** %_a1541
  %_a1542 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1541
  %_index_ptr1544 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a1542, i32 0, i32 1, i32 1
  %_index1545 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1544
  %_index_ptr1547 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1545, i32 0, i32 1, i32 1
  %_index1548 = load i64, i64* %_index_ptr1547
  ret i64 %_index1548
}

define i64 @g(i64 %_x1499) {
  %_x1500 = alloca i64
  %_i1504 = alloca i64
  %_j1517 = alloca i64
  %_arr1532 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %_x1499, i64* %_x1500
  %_raw_array1501 = call i64* @oat_alloc_array(i64 3)
  %_array1502 = bitcast i64* %_raw_array1501 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 3, i64* %_i1504
  br label %_cond1509
_cond1509:
  %_i1505 = load i64, i64* %_i1504
  %_bop1506 = icmp slt i64 %_i1505, 3
  br i1 %_bop1506, label %_body1508, label %_post1507
_body1508:
  %__tmp_array_sym15031510 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array1502
  %_i1511 = load i64, i64* %_i1504
  %_index_ptr1513 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym15031510, i32 0, i32 1, i64 %_i1511
  %_raw_array1514 = call i64* @oat_alloc_array(i64 3)
  %_array1515 = bitcast i64* %_raw_array1514 to { i64, [0 x i64] }*
  store i64 3, i64* %_j1517
  br label %_cond1522
_cond1522:
  %_j1518 = load i64, i64* %_j1517
  %_bop1519 = icmp slt i64 %_j1518, 3
  br i1 %_bop1519, label %_body1521, label %_post1520
_body1521:
  %__tmp_array_sym15161523 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1515
  %_j1524 = load i64, i64* %_j1517
  %_index_ptr1526 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym15161523, i32 0, i32 1, i64 %_j1524
  %_x1527 = load i64, i64* %_x1500
  store i64 %_x1527, i64* %_index_ptr1526
  %_j1528 = load i64, i64* %_j1517
  %_bop1529 = add i64 %_j1528, 1
  store i64 %_bop1529, i64* %_j1517
  br label %_cond1522
_post1520:
  store { i64, [0 x i64] }* %_array1515, { i64, [0 x i64] }** %_index_ptr1513
  %_i1530 = load i64, i64* %_i1504
  %_bop1531 = add i64 %_i1530, 1
  store i64 %_bop1531, i64* %_i1504
  br label %_cond1509
_post1507:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1502, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1532
  %_arr1533 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1532
  %_index_ptr1535 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr1533, i32 0, i32 1, i32 1
  %_index1536 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1535
  %_index_ptr1538 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1536, i32 0, i32 1, i32 1
  %_index1539 = load i64, i64* %_index_ptr1538
  ret i64 %_index1539
}

define i64 @program(i64 %_argc1377, { i64, [0 x i8*] }* %_argv1375) {
  %_argc1378 = alloca i64
  %_argv1376 = alloca { i64, [0 x i8*] }*
  %_i1382 = alloca i64
  %_j1395 = alloca i64
  %_a1410 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i1414 = alloca i64
  %_j1427 = alloca i64
  %_arr1444 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i1448 = alloca i64
  %_j1461 = alloca i64
  %_arr01478 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %_argc1377, i64* %_argc1378
  store { i64, [0 x i8*] }* %_argv1375, { i64, [0 x i8*] }** %_argv1376
  %_raw_array1379 = call i64* @oat_alloc_array(i64 3)
  %_array1380 = bitcast i64* %_raw_array1379 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 3, i64* %_i1382
  br label %_cond1387
_cond1387:
  %_i1383 = load i64, i64* %_i1382
  %_bop1384 = icmp slt i64 %_i1383, 3
  br i1 %_bop1384, label %_body1386, label %_post1385
_body1386:
  %__tmp_array_sym13811388 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array1380
  %_i1389 = load i64, i64* %_i1382
  %_index_ptr1391 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym13811388, i32 0, i32 1, i64 %_i1389
  %_raw_array1392 = call i64* @oat_alloc_array(i64 3)
  %_array1393 = bitcast i64* %_raw_array1392 to { i64, [0 x i64] }*
  store i64 3, i64* %_j1395
  br label %_cond1400
_cond1400:
  %_j1396 = load i64, i64* %_j1395
  %_bop1397 = icmp slt i64 %_j1396, 3
  br i1 %_bop1397, label %_body1399, label %_post1398
_body1399:
  %__tmp_array_sym13941401 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1393
  %_j1402 = load i64, i64* %_j1395
  %_index_ptr1404 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym13941401, i32 0, i32 1, i64 %_j1402
  %_j1405 = load i64, i64* %_j1395
  store i64 %_j1405, i64* %_index_ptr1404
  %_j1406 = load i64, i64* %_j1395
  %_bop1407 = add i64 %_j1406, 1
  store i64 %_bop1407, i64* %_j1395
  br label %_cond1400
_post1398:
  store { i64, [0 x i64] }* %_array1393, { i64, [0 x i64] }** %_index_ptr1391
  %_i1408 = load i64, i64* %_i1382
  %_bop1409 = add i64 %_i1408, 1
  store i64 %_bop1409, i64* %_i1382
  br label %_cond1387
_post1385:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1380, { i64, [0 x { i64, [0 x i64] }*] }** %_a1410
  %_raw_array1411 = call i64* @oat_alloc_array(i64 4)
  %_array1412 = bitcast i64* %_raw_array1411 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 4, i64* %_i1414
  br label %_cond1419
_cond1419:
  %_i1415 = load i64, i64* %_i1414
  %_bop1416 = icmp slt i64 %_i1415, 4
  br i1 %_bop1416, label %_body1418, label %_post1417
_body1418:
  %__tmp_array_sym14131420 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array1412
  %_i1421 = load i64, i64* %_i1414
  %_index_ptr1423 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym14131420, i32 0, i32 1, i64 %_i1421
  %_raw_array1424 = call i64* @oat_alloc_array(i64 5)
  %_array1425 = bitcast i64* %_raw_array1424 to { i64, [0 x i64] }*
  store i64 5, i64* %_j1427
  br label %_cond1432
_cond1432:
  %_j1428 = load i64, i64* %_j1427
  %_bop1429 = icmp slt i64 %_j1428, 5
  br i1 %_bop1429, label %_body1431, label %_post1430
_body1431:
  %__tmp_array_sym14261433 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1425
  %_j1434 = load i64, i64* %_j1427
  %_index_ptr1436 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym14261433, i32 0, i32 1, i64 %_j1434
  %_i1437 = load i64, i64* %_i1414
  %_j1438 = load i64, i64* %_j1427
  %_bop1439 = mul i64 %_i1437, %_j1438
  store i64 %_bop1439, i64* %_index_ptr1436
  %_j1440 = load i64, i64* %_j1427
  %_bop1441 = add i64 %_j1440, 1
  store i64 %_bop1441, i64* %_j1427
  br label %_cond1432
_post1430:
  store { i64, [0 x i64] }* %_array1425, { i64, [0 x i64] }** %_index_ptr1423
  %_i1442 = load i64, i64* %_i1414
  %_bop1443 = add i64 %_i1442, 1
  store i64 %_bop1443, i64* %_i1414
  br label %_cond1419
_post1417:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1412, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1444
  %_raw_array1445 = call i64* @oat_alloc_array(i64 3)
  %_array1446 = bitcast i64* %_raw_array1445 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 3, i64* %_i1448
  br label %_cond1453
_cond1453:
  %_i1449 = load i64, i64* %_i1448
  %_bop1450 = icmp slt i64 %_i1449, 3
  br i1 %_bop1450, label %_body1452, label %_post1451
_body1452:
  %__tmp_array_sym14471454 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array1446
  %_i1455 = load i64, i64* %_i1448
  %_index_ptr1457 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym14471454, i32 0, i32 1, i64 %_i1455
  %_raw_array1458 = call i64* @oat_alloc_array(i64 3)
  %_array1459 = bitcast i64* %_raw_array1458 to { i64, [0 x i64] }*
  store i64 3, i64* %_j1461
  br label %_cond1466
_cond1466:
  %_j1462 = load i64, i64* %_j1461
  %_bop1463 = icmp slt i64 %_j1462, 3
  br i1 %_bop1463, label %_body1465, label %_post1464
_body1465:
  %__tmp_array_sym14601467 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1459
  %_j1468 = load i64, i64* %_j1461
  %_index_ptr1470 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym14601467, i32 0, i32 1, i64 %_j1468
  %_i1471 = load i64, i64* %_i1448
  %_j1472 = load i64, i64* %_j1461
  %_bop1473 = mul i64 %_i1471, %_j1472
  store i64 %_bop1473, i64* %_index_ptr1470
  %_j1474 = load i64, i64* %_j1461
  %_bop1475 = add i64 %_j1474, 1
  store i64 %_bop1475, i64* %_j1461
  br label %_cond1466
_post1464:
  store { i64, [0 x i64] }* %_array1459, { i64, [0 x i64] }** %_index_ptr1457
  %_i1476 = load i64, i64* %_i1448
  %_bop1477 = add i64 %_i1476, 1
  store i64 %_bop1477, i64* %_i1448
  br label %_cond1453
_post1451:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1446, { i64, [0 x { i64, [0 x i64] }*] }** %_arr01478
  %_arr1479 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1444
  %_index_ptr1481 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr1479, i32 0, i32 1, i32 3
  %_index1482 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1481
  %_index_ptr1484 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1482, i32 0, i32 1, i32 4
  %_index1485 = load i64, i64* %_index_ptr1484
  %_a1486 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1410
  %_index_ptr1488 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a1486, i32 0, i32 1, i32 1
  %_index1489 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1488
  %_index_ptr1491 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index1489, i32 0, i32 1, i32 2
  %_index1492 = load i64, i64* %_index_ptr1491
  %_bop1493 = add i64 %_index1485, %_index1492
  %_arr01494 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr01478
  %_result1495 = call i64 @f({ i64, [0 x { i64, [0 x i64] }*] }* %_arr01494)
  %_bop1496 = add i64 %_bop1493, %_result1495
  %_result1497 = call i64 @g(i64 4)
  %_bop1498 = add i64 %_bop1496, %_result1497
  ret i64 %_bop1498
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
