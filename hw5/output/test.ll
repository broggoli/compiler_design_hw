; generated from: oatprograms/arrayargs2.oat
target triple = "x86_64-unknown-linux"
define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_x438, { i64, [0 x i64] }* %_y436, i1 %_b434) {
  %_x439 = alloca { i64, [0 x i64] }*
  %_y437 = alloca { i64, [0 x i64] }*
  %_b435 = alloca i1
  store { i64, [0 x i64] }* %_x438, { i64, [0 x i64] }** %_x439
  store { i64, [0 x i64] }* %_y436, { i64, [0 x i64] }** %_y437
  store i1 %_b434, i1* %_b435
  %_b440 = load i1, i1* %_b435
  br i1 %_b440, label %_then445, label %_else444
_then445:
  %_x441 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x439
  ret { i64, [0 x i64] }* %_x441
_else444:
  %_y442 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y437
  ret { i64, [0 x i64] }* %_y442
}

define i64 @program(i64 %_argc391, { i64, [0 x i8*] }* %_argv389) {
  %_argc392 = alloca i64
  %_argv390 = alloca { i64, [0 x i8*] }*
  %_i396 = alloca i64
  %_x408 = alloca { i64, [0 x i64] }*
  %_i412 = alloca i64
  %_y424 = alloca { i64, [0 x i64] }*
  store i64 %_argc391, i64* %_argc392
  store { i64, [0 x i8*] }* %_argv389, { i64, [0 x i8*] }** %_argv390
  %_raw_array393 = call i64* @oat_alloc_array(i64 3)
  %_array394 = bitcast i64* %_raw_array393 to { i64, [0 x i64] }*
  store i64 3, i64* %_i396
  br label %_cond401
_cond401:
  %_i397 = load i64, i64* %_i396
  %_bop398 = icmp slt i64 %_i397, 3
  br i1 %_bop398, label %_body400, label %_post399
_body400:
  %__tmp_array_sym395402 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array394
  %_i403 = load i64, i64* %_i396
  %_index_ptr405 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym395402, i32 0, i32 1, i64 %_i403
  store i64 0, i64* %_index_ptr405
  %_i406 = load i64, i64* %_i396
  %_bop407 = add i64 %_i406, 1
  store i64 %_bop407, i64* %_i396
  br label %_cond401
_post399:
  store { i64, [0 x i64] }* %_array394, { i64, [0 x i64] }** %_x408
  %_raw_array409 = call i64* @oat_alloc_array(i64 3)
  %_array410 = bitcast i64* %_raw_array409 to { i64, [0 x i64] }*
  store i64 3, i64* %_i412
  br label %_cond417
_cond417:
  %_i413 = load i64, i64* %_i412
  %_bop414 = icmp slt i64 %_i413, 3
  br i1 %_bop414, label %_body416, label %_post415
_body416:
  %__tmp_array_sym411418 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array410
  %_i419 = load i64, i64* %_i412
  %_index_ptr421 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym411418, i32 0, i32 1, i64 %_i419
  store i64 0, i64* %_index_ptr421
  %_i422 = load i64, i64* %_i412
  %_bop423 = add i64 %_i422, 1
  store i64 %_bop423, i64* %_i412
  br label %_cond417
_post415:
  store { i64, [0 x i64] }* %_array410, { i64, [0 x i64] }** %_y424
  %_y425 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y424
  %_x426 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x408
  %_result427 = call { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_x426, { i64, [0 x i64] }* %_y425, i1 1)
  %_index_ptr429 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_result427, i32 0, i32 1, i32 0
  store i64 17, i64* %_index_ptr429
  %_x430 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x408
  %_index_ptr432 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_x430, i32 0, i32 1, i32 0
  %_index433 = load i64, i64* %_index_ptr432
  ret i64 %_index433
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
