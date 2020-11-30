; generated from: oatprograms/sieve.oat
target triple = "x86_64-unknown-linux"
define i64 @sieve(i64 %_n3518) {
  %_n3519 = alloca i64
  %_i3525 = alloca i64
  %_arr3538 = alloca { i64, [0 x i1] }*
  %_i3539 = alloca i64
  %_i3558 = alloca i64
  %_j3572 = alloca i64
  %_count3591 = alloca i64
  %_i3592 = alloca i64
  store i64 %_n3518, i64* %_n3519
  %_n3520 = load i64, i64* %_n3519
  %_raw_array3521 = call i64* @oat_alloc_array(i64 %_n3520)
  %_array3522 = bitcast i64* %_raw_array3521 to { i64, [0 x i1] }*
  %_n3524 = load i64, i64* %_n3519
  store i64 %_n3524, i64* %_i3525
  br label %_cond3531
_cond3531:
  %_i3526 = load i64, i64* %_i3525
  %_n3527 = load i64, i64* %_n3519
  %_bop3528 = icmp slt i64 %_i3526, %_n3527
  br i1 %_bop3528, label %_body3530, label %_post3529
_body3530:
  %__tmp_array_sym35233532 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_array3522
  %_i3533 = load i64, i64* %_i3525
  %_index_ptr3535 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %__tmp_array_sym35233532, i32 0, i32 1, i64 %_i3533
  store i1 0, i1* %_index_ptr3535
  %_i3536 = load i64, i64* %_i3525
  %_bop3537 = add i64 %_i3536, 1
  store i64 %_bop3537, i64* %_i3525
  br label %_cond3531
_post3529:
  store { i64, [0 x i1] }* %_array3522, { i64, [0 x i1] }** %_arr3538
  store i64 0, i64* %_i3539
  br label %_cond3545
_cond3545:
  %_i3540 = load i64, i64* %_i3539
  %_n3541 = load i64, i64* %_n3519
  %_bop3542 = icmp slt i64 %_i3540, %_n3541
  br i1 %_bop3542, label %_body3544, label %_post3543
_body3544:
  %_arr3546 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3538
  %_i3547 = load i64, i64* %_i3539
  %_index_ptr3549 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3546, i32 0, i32 1, i64 %_i3547
  store i1 1, i1* %_index_ptr3549
  %_i3550 = load i64, i64* %_i3539
  %_bop3551 = add i64 %_i3550, 1
  store i64 %_bop3551, i64* %_i3539
  br label %_cond3545
_post3543:
  %_arr3552 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3538
  %_index_ptr3554 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3552, i32 0, i32 1, i32 0
  store i1 0, i1* %_index_ptr3554
  %_arr3555 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3538
  %_index_ptr3557 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3555, i32 0, i32 1, i32 1
  store i1 0, i1* %_index_ptr3557
  store i64 0, i64* %_i3558
  br label %_cond3564
_cond3564:
  %_i3559 = load i64, i64* %_i3558
  %_n3560 = load i64, i64* %_n3519
  %_bop3561 = icmp slt i64 %_i3559, %_n3560
  br i1 %_bop3561, label %_body3563, label %_post3562
_body3563:
  %_arr3565 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3538
  %_i3566 = load i64, i64* %_i3558
  %_index_ptr3568 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3565, i32 0, i32 1, i64 %_i3566
  %_index3569 = load i1, i1* %_index_ptr3568
  br i1 %_index3569, label %_then3588, label %_else3587
_then3588:
  %_i3570 = load i64, i64* %_i3558
  %_bop3571 = mul i64 %_i3570, 2
  store i64 %_bop3571, i64* %_j3572
  br label %_cond3578
_cond3578:
  %_j3573 = load i64, i64* %_j3572
  %_n3574 = load i64, i64* %_n3519
  %_bop3575 = icmp slt i64 %_j3573, %_n3574
  br i1 %_bop3575, label %_body3577, label %_post3576
_body3577:
  %_arr3579 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3538
  %_j3580 = load i64, i64* %_j3572
  %_index_ptr3582 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3579, i32 0, i32 1, i64 %_j3580
  store i1 0, i1* %_index_ptr3582
  %_j3583 = load i64, i64* %_j3572
  %_i3584 = load i64, i64* %_i3558
  %_bop3585 = add i64 %_j3583, %_i3584
  store i64 %_bop3585, i64* %_j3572
  br label %_cond3578
_post3576:
  br label %_merge3586
_else3587:
  br label %_merge3586
_merge3586:
  %_i3589 = load i64, i64* %_i3558
  %_bop3590 = add i64 %_i3589, 1
  store i64 %_bop3590, i64* %_i3558
  br label %_cond3564
_post3562:
  store i64 0, i64* %_count3591
  store i64 0, i64* %_i3592
  br label %_cond3598
_cond3598:
  %_i3593 = load i64, i64* %_i3592
  %_n3594 = load i64, i64* %_n3519
  %_bop3595 = icmp slt i64 %_i3593, %_n3594
  br i1 %_bop3595, label %_body3597, label %_post3596
_body3597:
  %_arr3599 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3538
  %_i3600 = load i64, i64* %_i3592
  %_index_ptr3602 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3599, i32 0, i32 1, i64 %_i3600
  %_index3603 = load i1, i1* %_index_ptr3602
  br i1 %_index3603, label %_then3608, label %_else3607
_then3608:
  %_count3604 = load i64, i64* %_count3591
  %_bop3605 = add i64 %_count3604, 1
  store i64 %_bop3605, i64* %_count3591
  br label %_merge3606
_else3607:
  br label %_merge3606
_merge3606:
  %_i3609 = load i64, i64* %_i3592
  %_bop3610 = add i64 %_i3609, 1
  store i64 %_bop3610, i64* %_i3592
  br label %_cond3598
_post3596:
  %_count3611 = load i64, i64* %_count3591
  ret i64 %_count3611
}

define i64 @program(i64 %_argc3513, { i64, [0 x i8*] }* %_argv3511) {
  %_argc3514 = alloca i64
  %_argv3512 = alloca { i64, [0 x i8*] }*
  %_n3515 = alloca i64
  store i64 %_argc3513, i64* %_argc3514
  store { i64, [0 x i8*] }* %_argv3511, { i64, [0 x i8*] }** %_argv3512
  store i64 100, i64* %_n3515
  %_n3516 = load i64, i64* %_n3515
  %_result3517 = call i64 @sieve(i64 %_n3516)
  ret i64 %_result3517
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
