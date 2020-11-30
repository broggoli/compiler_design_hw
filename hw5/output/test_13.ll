; generated from: oatprograms/xor_shift.oat
target triple = "x86_64-unknown-linux"
@_str_arr3456 = global [2 x i8] c"
\00"

define i64 @xor(i64 %_x3501, i64 %_y3499) {
  %_x3502 = alloca i64
  %_y3500 = alloca i64
  store i64 %_x3501, i64* %_x3502
  store i64 %_y3499, i64* %_y3500
  %_x3503 = load i64, i64* %_x3502
  %_y3504 = load i64, i64* %_y3500
  %_bop3505 = and i64 %_x3503, %_y3504
  %_unop3506 = xor i64 %_bop3505, -1
  %_x3507 = load i64, i64* %_x3502
  %_y3508 = load i64, i64* %_y3500
  %_bop3509 = or i64 %_x3507, %_y3508
  %_bop3510 = and i64 %_unop3506, %_bop3509
  ret i64 %_bop3510
}

define i64 @xor_shift_plus({ i64, [0 x i64] }* %_s3462) {
  %_s3463 = alloca { i64, [0 x i64] }*
  %_x3468 = alloca i64
  %_y3473 = alloca i64
  store { i64, [0 x i64] }* %_s3462, { i64, [0 x i64] }** %_s3463
  %_s3464 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_s3463
  %_index_ptr3466 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_s3464, i32 0, i32 1, i32 0
  %_index3467 = load i64, i64* %_index_ptr3466
  store i64 %_index3467, i64* %_x3468
  %_s3469 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_s3463
  %_index_ptr3471 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_s3469, i32 0, i32 1, i32 1
  %_index3472 = load i64, i64* %_index_ptr3471
  store i64 %_index3472, i64* %_y3473
  %_s3474 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_s3463
  %_index_ptr3476 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_s3474, i32 0, i32 1, i32 0
  %_y3477 = load i64, i64* %_y3473
  store i64 %_y3477, i64* %_index_ptr3476
  %_x3478 = load i64, i64* %_x3468
  %_bop3479 = shl i64 %_x3478, 23
  %_x3480 = load i64, i64* %_x3468
  %_result3481 = call i64 @xor(i64 %_x3480, i64 %_bop3479)
  store i64 %_result3481, i64* %_x3468
  %_x3482 = load i64, i64* %_x3468
  %_bop3483 = lshr i64 %_x3482, 17
  %_x3484 = load i64, i64* %_x3468
  %_result3485 = call i64 @xor(i64 %_x3484, i64 %_bop3483)
  store i64 %_result3485, i64* %_x3468
  %_y3486 = load i64, i64* %_y3473
  %_bop3487 = lshr i64 %_y3486, 26
  %_y3488 = load i64, i64* %_y3473
  %_result3489 = call i64 @xor(i64 %_y3488, i64 %_bop3487)
  %_x3490 = load i64, i64* %_x3468
  %_result3491 = call i64 @xor(i64 %_x3490, i64 %_result3489)
  store i64 %_result3491, i64* %_x3468
  %_s3492 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_s3463
  %_index_ptr3494 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_s3492, i32 0, i32 1, i32 1
  %_x3495 = load i64, i64* %_x3468
  store i64 %_x3495, i64* %_index_ptr3494
  %_x3496 = load i64, i64* %_x3468
  %_y3497 = load i64, i64* %_y3473
  %_bop3498 = add i64 %_x3496, %_y3497
  ret i64 %_bop3498
}

define i64 @program(i64 %_argc3420, { i64, [0 x i8*] }* %_argv3418) {
  %_argc3421 = alloca i64
  %_argv3419 = alloca { i64, [0 x i8*] }*
  %_i3425 = alloca i64
  %_seed3437 = alloca { i64, [0 x i64] }*
  %_i3438 = alloca i64
  store i64 %_argc3420, i64* %_argc3421
  store { i64, [0 x i8*] }* %_argv3418, { i64, [0 x i8*] }** %_argv3419
  %_raw_array3422 = call i64* @oat_alloc_array(i64 2)
  %_array3423 = bitcast i64* %_raw_array3422 to { i64, [0 x i64] }*
  store i64 2, i64* %_i3425
  br label %_cond3430
_cond3430:
  %_i3426 = load i64, i64* %_i3425
  %_bop3427 = icmp slt i64 %_i3426, 2
  br i1 %_bop3427, label %_body3429, label %_post3428
_body3429:
  %__tmp_array_sym34243431 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array3423
  %_i3432 = load i64, i64* %_i3425
  %_index_ptr3434 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym34243431, i32 0, i32 1, i64 %_i3432
  store i64 0, i64* %_index_ptr3434
  %_i3435 = load i64, i64* %_i3425
  %_bop3436 = add i64 %_i3435, 1
  store i64 %_bop3436, i64* %_i3425
  br label %_cond3430
_post3428:
  store { i64, [0 x i64] }* %_array3423, { i64, [0 x i64] }** %_seed3437
  store i64 0, i64* %_i3438
  br label %_cond3443
_cond3443:
  %_i3439 = load i64, i64* %_i3438
  %_bop3440 = icmp slt i64 %_i3439, 2
  br i1 %_bop3440, label %_body3442, label %_post3441
_body3442:
  %_seed3444 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_seed3437
  %_i3445 = load i64, i64* %_i3438
  %_index_ptr3447 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_seed3444, i32 0, i32 1, i64 %_i3445
  %_i3448 = load i64, i64* %_i3438
  %_bop3449 = add i64 %_i3448, 1
  %_bop3450 = mul i64 100, %_bop3449
  store i64 %_bop3450, i64* %_index_ptr3447
  %_i3451 = load i64, i64* %_i3438
  %_bop3452 = add i64 %_i3451, 1
  store i64 %_bop3452, i64* %_i3438
  br label %_cond3443
_post3441:
  %_seed3453 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_seed3437
  %_result3454 = call i64 @xor_shift_plus({ i64, [0 x i64] }* %_seed3453)
  call void @print_int(i64 %_result3454)
  %_str3457 = getelementptr [2 x i8], [2 x i8]* @_str_arr3456, i32 0, i32 0
  call void @print_string(i8* %_str3457)
  %_seed3459 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_seed3437
  %_result3460 = call i64 @xor_shift_plus({ i64, [0 x i64] }* %_seed3459)
  call void @print_int(i64 %_result3460)
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
