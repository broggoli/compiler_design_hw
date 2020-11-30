; generated from: oatprograms/bsort.oat
target triple = "x86_64-unknown-linux"
@_str_arr2424 = global [2 x i8] c" \00"

define void @bubble_sort({ i64, [0 x i64] }* %_numbers2435, i64 %_array_size2433) {
  %_numbers2436 = alloca { i64, [0 x i64] }*
  %_array_size2434 = alloca i64
  %_temp2437 = alloca i64
  %_i2440 = alloca i64
  %_j2446 = alloca i64
  store { i64, [0 x i64] }* %_numbers2435, { i64, [0 x i64] }** %_numbers2436
  store i64 %_array_size2433, i64* %_array_size2434
  store i64 0, i64* %_temp2437
  %_array_size2438 = load i64, i64* %_array_size2434
  %_bop2439 = sub i64 %_array_size2438, 1
  store i64 %_bop2439, i64* %_i2440
  br label %_cond2445
_cond2445:
  %_i2441 = load i64, i64* %_i2440
  %_bop2442 = icmp sgt i64 %_i2441, 0
  br i1 %_bop2442, label %_body2444, label %_post2443
_body2444:
  store i64 1, i64* %_j2446
  br label %_cond2452
_cond2452:
  %_j2447 = load i64, i64* %_j2446
  %_i2448 = load i64, i64* %_i2440
  %_bop2449 = icmp sle i64 %_j2447, %_i2448
  br i1 %_bop2449, label %_body2451, label %_post2450
_body2451:
  %_numbers2453 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers2436
  %_j2454 = load i64, i64* %_j2446
  %_bop2455 = sub i64 %_j2454, 1
  %_index_ptr2457 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_numbers2453, i32 0, i32 1, i64 %_bop2455
  %_index2458 = load i64, i64* %_index_ptr2457
  %_numbers2459 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers2436
  %_i2460 = load i64, i64* %_i2440
  %_index_ptr2462 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_numbers2459, i32 0, i32 1, i64 %_i2460
  %_index2463 = load i64, i64* %_index_ptr2462
  %_bop2464 = icmp sgt i64 %_index2458, %_index2463
  br i1 %_bop2464, label %_then2488, label %_else2487
_then2488:
  %_numbers2465 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers2436
  %_j2466 = load i64, i64* %_j2446
  %_bop2467 = sub i64 %_j2466, 1
  %_index_ptr2469 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_numbers2465, i32 0, i32 1, i64 %_bop2467
  %_index2470 = load i64, i64* %_index_ptr2469
  store i64 %_index2470, i64* %_temp2437
  %_numbers2471 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers2436
  %_j2472 = load i64, i64* %_j2446
  %_bop2473 = sub i64 %_j2472, 1
  %_index_ptr2475 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_numbers2471, i32 0, i32 1, i64 %_bop2473
  %_numbers2476 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers2436
  %_i2477 = load i64, i64* %_i2440
  %_index_ptr2479 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_numbers2476, i32 0, i32 1, i64 %_i2477
  %_index2480 = load i64, i64* %_index_ptr2479
  store i64 %_index2480, i64* %_index_ptr2475
  %_numbers2481 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers2436
  %_i2482 = load i64, i64* %_i2440
  %_index_ptr2484 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_numbers2481, i32 0, i32 1, i64 %_i2482
  %_temp2485 = load i64, i64* %_temp2437
  store i64 %_temp2485, i64* %_index_ptr2484
  br label %_merge2486
_else2487:
  br label %_merge2486
_merge2486:
  %_j2489 = load i64, i64* %_j2446
  %_bop2490 = add i64 %_j2489, 1
  store i64 %_bop2490, i64* %_j2446
  br label %_cond2452
_post2450:
  %_i2491 = load i64, i64* %_i2440
  %_bop2492 = sub i64 %_i2491, 1
  store i64 %_bop2492, i64* %_i2440
  br label %_cond2445
_post2443:
  ret void
}

define i64 @program(i64 %_argc2379, { i64, [0 x i8*] }* %_argv2377) {
  %_argc2380 = alloca i64
  %_argv2378 = alloca { i64, [0 x i8*] }*
  %_i2384 = alloca i64
  %_a2396 = alloca { i64, [0 x i64] }*
  store i64 %_argc2379, i64* %_argc2380
  store { i64, [0 x i8*] }* %_argv2377, { i64, [0 x i8*] }** %_argv2378
  %_raw_array2381 = call i64* @oat_alloc_array(i64 8)
  %_array2382 = bitcast i64* %_raw_array2381 to { i64, [0 x i64] }*
  store i64 8, i64* %_i2384
  br label %_cond2389
_cond2389:
  %_i2385 = load i64, i64* %_i2384
  %_bop2386 = icmp slt i64 %_i2385, 8
  br i1 %_bop2386, label %_body2388, label %_post2387
_body2388:
  %__tmp_array_sym23832390 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array2382
  %_i2391 = load i64, i64* %_i2384
  %_index_ptr2393 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym23832390, i32 0, i32 1, i64 %_i2391
  store i64 0, i64* %_index_ptr2393
  %_i2394 = load i64, i64* %_i2384
  %_bop2395 = add i64 %_i2394, 1
  store i64 %_bop2395, i64* %_i2384
  br label %_cond2389
_post2387:
  store { i64, [0 x i64] }* %_array2382, { i64, [0 x i64] }** %_a2396
  %_a2397 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_index_ptr2399 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2397, i32 0, i32 1, i32 0
  store i64 121, i64* %_index_ptr2399
  %_a2400 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_index_ptr2402 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2400, i32 0, i32 1, i32 1
  store i64 125, i64* %_index_ptr2402
  %_a2403 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_index_ptr2405 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2403, i32 0, i32 1, i32 2
  store i64 120, i64* %_index_ptr2405
  %_a2406 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_index_ptr2408 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2406, i32 0, i32 1, i32 3
  store i64 111, i64* %_index_ptr2408
  %_a2409 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_index_ptr2411 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2409, i32 0, i32 1, i32 4
  store i64 116, i64* %_index_ptr2411
  %_a2412 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_index_ptr2414 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2412, i32 0, i32 1, i32 5
  store i64 110, i64* %_index_ptr2414
  %_a2415 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_index_ptr2417 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2415, i32 0, i32 1, i32 6
  store i64 117, i64* %_index_ptr2417
  %_a2418 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_index_ptr2420 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2418, i32 0, i32 1, i32 7
  store i64 119, i64* %_index_ptr2420
  %_a2421 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_result2422 = call i8* @string_of_array({ i64, [0 x i64] }* %_a2421)
  call void @print_string(i8* %_result2422)
  %_str2425 = getelementptr [2 x i8], [2 x i8]* @_str_arr2424, i32 0, i32 0
  call void @print_string(i8* %_str2425)
  %_a2427 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  call void @bubble_sort({ i64, [0 x i64] }* %_a2427, i64 8)
  %_a2429 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2396
  %_result2430 = call i8* @string_of_array({ i64, [0 x i64] }* %_a2429)
  call void @print_string(i8* %_result2430)
  %_unop2432 = sub i64 0, 1
  ret i64 %_unop2432
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
