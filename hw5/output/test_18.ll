; generated from: oatprograms/lfsr.oat
target triple = "x86_64-unknown-linux"
@lfsr_iterations = global i64 5
@lfsr_length = global i64 4
@lfsr_init_values = global { i64, [4 x i1] }* @_global_arr4607
@_global_arr4607 = global { i64, [4 x i1] } { i64 4, [4 x i1] [ i1 1, i1 0, i1 1, i1 0 ] }
@_str_arr4587 = global [2 x i8] c"T\00"
@_str_arr4589 = global [2 x i8] c"F\00"
@_str_arr4558 = global [2 x i8] c" \00"

define i1 @xor(i1 %_x4596, i1 %_y4594) {
  %_x4597 = alloca i1
  %_y4595 = alloca i1
  store i1 %_x4596, i1* %_x4597
  store i1 %_y4594, i1* %_y4595
  %_x4598 = load i1, i1* %_x4597
  %_y4599 = load i1, i1* %_y4595
  %_unop4600 = icmp eq i1 %_y4599, 0
  %_bop4601 = and i1 %_x4598, %_unop4600
  %_x4602 = load i1, i1* %_x4597
  %_unop4603 = icmp eq i1 %_x4602, 0
  %_y4604 = load i1, i1* %_y4595
  %_bop4605 = and i1 %_unop4603, %_y4604
  %_bop4606 = or i1 %_bop4601, %_bop4605
  ret i1 %_bop4606
}

define i8* @string_of_bool(i1 %_b4584) {
  %_b4585 = alloca i1
  store i1 %_b4584, i1* %_b4585
  %_b4586 = load i1, i1* %_b4585
  br i1 %_b4586, label %_then4593, label %_else4592
_then4593:
  %_str4588 = getelementptr [2 x i8], [2 x i8]* @_str_arr4587, i32 0, i32 0
  ret i8* %_str4588
_else4592:
  %_str4590 = getelementptr [2 x i8], [2 x i8]* @_str_arr4589, i32 0, i32 0
  ret i8* %_str4590
}

define void @print_lfsr({ i64, [0 x i1] }* %_lfsr_register4566, i64 %_len4564) {
  %_lfsr_register4567 = alloca { i64, [0 x i1] }*
  %_len4565 = alloca i64
  %_i4568 = alloca i64
  store { i64, [0 x i1] }* %_lfsr_register4566, { i64, [0 x i1] }** %_lfsr_register4567
  store i64 %_len4564, i64* %_len4565
  store i64 0, i64* %_i4568
  br label %_cond4574
_cond4574:
  %_i4569 = load i64, i64* %_i4568
  %_len4570 = load i64, i64* %_len4565
  %_bop4571 = icmp slt i64 %_i4569, %_len4570
  br i1 %_bop4571, label %_body4573, label %_post4572
_body4573:
  %_lfsr_register4575 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4567
  %_i4576 = load i64, i64* %_i4568
  %_index_ptr4578 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4575, i32 0, i32 1, i64 %_i4576
  %_index4579 = load i1, i1* %_index_ptr4578
  %_result4580 = call i8* @string_of_bool(i1 %_index4579)
  call void @print_string(i8* %_result4580)
  %_i4582 = load i64, i64* %_i4568
  %_bop4583 = add i64 %_i4582, 1
  store i64 %_bop4583, i64* %_i4568
  br label %_cond4574
_post4572:
  ret void
}

define i64 @program(i64 %_argc4468, { i64, [0 x i8*] }* %_argv4466) {
  %_argc4469 = alloca i64
  %_argv4467 = alloca { i64, [0 x i8*] }*
  %_i4475 = alloca i64
  %_lfsr_register4488 = alloca { i64, [0 x i1] }*
  %_i4489 = alloca i64
  %_i4507 = alloca i64
  %_new_first4527 = alloca i1
  %_j4530 = alloca i64
  store i64 %_argc4468, i64* %_argc4469
  store { i64, [0 x i8*] }* %_argv4466, { i64, [0 x i8*] }** %_argv4467
  %_lfsr_length4470 = load i64, i64* @lfsr_length
  %_raw_array4471 = call i64* @oat_alloc_array(i64 %_lfsr_length4470)
  %_array4472 = bitcast i64* %_raw_array4471 to { i64, [0 x i1] }*
  %_lfsr_length4474 = load i64, i64* @lfsr_length
  store i64 %_lfsr_length4474, i64* %_i4475
  br label %_cond4481
_cond4481:
  %_i4476 = load i64, i64* %_i4475
  %_lfsr_length4477 = load i64, i64* @lfsr_length
  %_bop4478 = icmp slt i64 %_i4476, %_lfsr_length4477
  br i1 %_bop4478, label %_body4480, label %_post4479
_body4480:
  %__tmp_array_sym44734482 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_array4472
  %_i4483 = load i64, i64* %_i4475
  %_index_ptr4485 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %__tmp_array_sym44734482, i32 0, i32 1, i64 %_i4483
  store i1 0, i1* %_index_ptr4485
  %_i4486 = load i64, i64* %_i4475
  %_bop4487 = add i64 %_i4486, 1
  store i64 %_bop4487, i64* %_i4475
  br label %_cond4481
_post4479:
  store { i64, [0 x i1] }* %_array4472, { i64, [0 x i1] }** %_lfsr_register4488
  store i64 0, i64* %_i4489
  br label %_cond4495
_cond4495:
  %_i4490 = load i64, i64* %_i4489
  %_lfsr_length4491 = load i64, i64* @lfsr_length
  %_bop4492 = icmp slt i64 %_i4490, %_lfsr_length4491
  br i1 %_bop4492, label %_body4494, label %_post4493
_body4494:
  %_lfsr_register4496 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4488
  %_i4497 = load i64, i64* %_i4489
  %_index_ptr4499 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4496, i32 0, i32 1, i64 %_i4497
  %_lfsr_init_values4500 = load { i64, [4 x i1] }*, { i64, [4 x i1] }** @lfsr_init_values
  %_i4501 = load i64, i64* %_i4489
  %_index_ptr4503 = getelementptr { i64, [4 x i1] }, { i64, [4 x i1] }* %_lfsr_init_values4500, i32 0, i32 1, i64 %_i4501
  %_index4504 = load i1, i1* %_index_ptr4503
  store i1 %_index4504, i1* %_index_ptr4499
  %_i4505 = load i64, i64* %_i4489
  %_bop4506 = add i64 %_i4505, 1
  store i64 %_bop4506, i64* %_i4489
  br label %_cond4495
_post4493:
  store i64 0, i64* %_i4507
  br label %_cond4513
_cond4513:
  %_i4508 = load i64, i64* %_i4507
  %_lfsr_iterations4509 = load i64, i64* @lfsr_iterations
  %_bop4510 = icmp slt i64 %_i4508, %_lfsr_iterations4509
  br i1 %_bop4510, label %_body4512, label %_post4511
_body4512:
  %_lfsr_register4514 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4488
  %_lfsr_length4515 = load i64, i64* @lfsr_length
  %_bop4516 = sub i64 %_lfsr_length4515, 2
  %_index_ptr4518 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4514, i32 0, i32 1, i64 %_bop4516
  %_index4519 = load i1, i1* %_index_ptr4518
  %_lfsr_register4520 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4488
  %_lfsr_length4521 = load i64, i64* @lfsr_length
  %_bop4522 = sub i64 %_lfsr_length4521, 1
  %_index_ptr4524 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4520, i32 0, i32 1, i64 %_bop4522
  %_index4525 = load i1, i1* %_index_ptr4524
  %_result4526 = call i1 @xor(i1 %_index4525, i1 %_index4519)
  store i1 %_result4526, i1* %_new_first4527
  %_lfsr_length4528 = load i64, i64* @lfsr_length
  %_bop4529 = sub i64 %_lfsr_length4528, 1
  store i64 %_bop4529, i64* %_j4530
  br label %_cond4535
_cond4535:
  %_j4531 = load i64, i64* %_j4530
  %_bop4532 = icmp sgt i64 %_j4531, 0
  br i1 %_bop4532, label %_body4534, label %_post4533
_body4534:
  %_lfsr_register4536 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4488
  %_j4537 = load i64, i64* %_j4530
  %_index_ptr4539 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4536, i32 0, i32 1, i64 %_j4537
  %_lfsr_register4540 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4488
  %_j4541 = load i64, i64* %_j4530
  %_bop4542 = sub i64 %_j4541, 1
  %_index_ptr4544 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4540, i32 0, i32 1, i64 %_bop4542
  %_index4545 = load i1, i1* %_index_ptr4544
  store i1 %_index4545, i1* %_index_ptr4539
  %_j4546 = load i64, i64* %_j4530
  %_bop4547 = sub i64 %_j4546, 1
  store i64 %_bop4547, i64* %_j4530
  br label %_cond4535
_post4533:
  %_lfsr_register4548 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4488
  %_index_ptr4550 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4548, i32 0, i32 1, i32 0
  %_new_first4551 = load i1, i1* %_new_first4527
  store i1 %_new_first4551, i1* %_index_ptr4550
  %_i4552 = load i64, i64* %_i4507
  %_bop4553 = add i64 %_i4552, 1
  store i64 %_bop4553, i64* %_i4507
  br label %_cond4513
_post4511:
  %_lfsr_length4554 = load i64, i64* @lfsr_length
  %_lfsr_init_values4555 = load { i64, [4 x i1] }*, { i64, [4 x i1] }** @lfsr_init_values
  %_cast4556 = bitcast { i64, [4 x i1] }* %_lfsr_init_values4555 to { i64, [0 x i1] }*
  call void @print_lfsr({ i64, [0 x i1] }* %_cast4556, i64 %_lfsr_length4554)
  %_str4559 = getelementptr [2 x i8], [2 x i8]* @_str_arr4558, i32 0, i32 0
  call void @print_string(i8* %_str4559)
  %_lfsr_length4561 = load i64, i64* @lfsr_length
  %_lfsr_register4562 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4488
  call void @print_lfsr({ i64, [0 x i1] }* %_lfsr_register4562, i64 %_lfsr_length4561)
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
