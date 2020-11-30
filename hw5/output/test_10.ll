; generated from: oatprograms/msort.oat
target triple = "x86_64-unknown-linux"
@_str_arr2684 = global [2 x i8] c" \00"
@_str_arr2690 = global [2 x i8] c" \00"

define i64 @program(i64 %_argc2663, { i64, [0 x i8*] }* %_argv2661) {
  %_argc2664 = alloca i64
  %_argv2662 = alloca { i64, [0 x i8*] }*
  %_i2665 = alloca i64
  %_a2678 = alloca { i64, [0 x i64] }*
  store i64 %_argc2663, i64* %_argc2664
  store { i64, [0 x i8*] }* %_argv2661, { i64, [0 x i8*] }** %_argv2662
  store i64 0, i64* %_i2665
  %_raw_array2666 = call i64* @oat_alloc_array(i64 10)
  %_array2667 = bitcast i64* %_raw_array2666 to { i64, [0 x i64] }*
  %_ind2668 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 0
  store i64 126, i64* %_ind2668
  %_ind2669 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 1
  store i64 125, i64* %_ind2669
  %_ind2670 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 2
  store i64 124, i64* %_ind2670
  %_ind2671 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 3
  store i64 123, i64* %_ind2671
  %_ind2672 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 4
  store i64 122, i64* %_ind2672
  %_ind2673 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 5
  store i64 121, i64* %_ind2673
  %_ind2674 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 6
  store i64 120, i64* %_ind2674
  %_ind2675 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 7
  store i64 119, i64* %_ind2675
  %_ind2676 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 8
  store i64 118, i64* %_ind2676
  %_ind2677 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2667, i32 0, i32 1, i32 9
  store i64 117, i64* %_ind2677
  store { i64, [0 x i64] }* %_array2667, { i64, [0 x i64] }** %_a2678
  %_a2679 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2678
  %_result2680 = call i8* @string_of_array({ i64, [0 x i64] }* %_a2679)
  call void @print_string(i8* %_result2680)
  %_a2682 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2678
  call void @oat_mergesort({ i64, [0 x i64] }* %_a2682, i64 0, i64 9)
  %_str2685 = getelementptr [2 x i8], [2 x i8]* @_str_arr2684, i32 0, i32 0
  call void @print_string(i8* %_str2685)
  %_a2687 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2678
  %_result2688 = call i8* @string_of_array({ i64, [0 x i64] }* %_a2687)
  call void @print_string(i8* %_result2688)
  %_str2691 = getelementptr [2 x i8], [2 x i8]* @_str_arr2690, i32 0, i32 0
  call void @print_string(i8* %_str2691)
  %_i2693 = load i64, i64* %_i2665
  ret i64 %_i2693
}

define void @oat_mergesort({ i64, [0 x i64] }* %_a2634, i64 %_low2632, i64 %_high2630) {
  %_a2635 = alloca { i64, [0 x i64] }*
  %_low2633 = alloca i64
  %_high2631 = alloca i64
  %_mid2636 = alloca i64
  store { i64, [0 x i64] }* %_a2634, { i64, [0 x i64] }** %_a2635
  store i64 %_low2632, i64* %_low2633
  store i64 %_high2630, i64* %_high2631
  store i64 0, i64* %_mid2636
  %_low2637 = load i64, i64* %_low2633
  %_high2638 = load i64, i64* %_high2631
  %_bop2639 = icmp slt i64 %_low2637, %_high2638
  br i1 %_bop2639, label %_then2660, label %_else2659
_then2660:
  %_low2640 = load i64, i64* %_low2633
  %_high2641 = load i64, i64* %_high2631
  %_bop2642 = add i64 %_low2640, %_high2641
  %_bop2643 = lshr i64 %_bop2642, 1
  store i64 %_bop2643, i64* %_mid2636
  %_mid2644 = load i64, i64* %_mid2636
  %_low2645 = load i64, i64* %_low2633
  %_a2646 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2635
  call void @oat_mergesort({ i64, [0 x i64] }* %_a2646, i64 %_low2645, i64 %_mid2644)
  %_high2648 = load i64, i64* %_high2631
  %_mid2649 = load i64, i64* %_mid2636
  %_bop2650 = add i64 %_mid2649, 1
  %_a2651 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2635
  call void @oat_mergesort({ i64, [0 x i64] }* %_a2651, i64 %_bop2650, i64 %_high2648)
  %_mid2653 = load i64, i64* %_mid2636
  %_high2654 = load i64, i64* %_high2631
  %_low2655 = load i64, i64* %_low2633
  %_a2656 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2635
  call void @merge({ i64, [0 x i64] }* %_a2656, i64 %_low2655, i64 %_high2654, i64 %_mid2653)
  br label %_merge2658
_else2659:
  br label %_merge2658
_merge2658:
  ret void
}

define void @merge({ i64, [0 x i64] }* %_a2499, i64 %_low2497, i64 %_high2495, i64 %_mid2493) {
  %_a2500 = alloca { i64, [0 x i64] }*
  %_low2498 = alloca i64
  %_high2496 = alloca i64
  %_mid2494 = alloca i64
  %_i2501 = alloca i64
  %_j2502 = alloca i64
  %_k2503 = alloca i64
  %_i12507 = alloca i64
  %_c2519 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_a2499, { i64, [0 x i64] }** %_a2500
  store i64 %_low2497, i64* %_low2498
  store i64 %_high2495, i64* %_high2496
  store i64 %_mid2493, i64* %_mid2494
  store i64 0, i64* %_i2501
  store i64 0, i64* %_j2502
  store i64 0, i64* %_k2503
  %_raw_array2504 = call i64* @oat_alloc_array(i64 50)
  %_array2505 = bitcast i64* %_raw_array2504 to { i64, [0 x i64] }*
  store i64 50, i64* %_i12507
  br label %_cond2512
_cond2512:
  %_i12508 = load i64, i64* %_i12507
  %_bop2509 = icmp slt i64 %_i12508, 50
  br i1 %_bop2509, label %_body2511, label %_post2510
_body2511:
  %__tmp_array_sym25062513 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array2505
  %_i12514 = load i64, i64* %_i12507
  %_index_ptr2516 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym25062513, i32 0, i32 1, i64 %_i12514
  store i64 0, i64* %_index_ptr2516
  %_i12517 = load i64, i64* %_i12507
  %_bop2518 = add i64 %_i12517, 1
  store i64 %_bop2518, i64* %_i12507
  br label %_cond2512
_post2510:
  store { i64, [0 x i64] }* %_array2505, { i64, [0 x i64] }** %_c2519
  %_low2520 = load i64, i64* %_low2498
  store i64 %_low2520, i64* %_i2501
  %_mid2521 = load i64, i64* %_mid2494
  %_bop2522 = add i64 %_mid2521, 1
  store i64 %_bop2522, i64* %_j2502
  %_low2523 = load i64, i64* %_low2498
  store i64 %_low2523, i64* %_k2503
  br label %_cond2533
_cond2533:
  %_i2524 = load i64, i64* %_i2501
  %_mid2525 = load i64, i64* %_mid2494
  %_bop2526 = icmp sle i64 %_i2524, %_mid2525
  %_j2527 = load i64, i64* %_j2502
  %_high2528 = load i64, i64* %_high2496
  %_bop2529 = icmp sle i64 %_j2527, %_high2528
  %_bop2530 = and i1 %_bop2526, %_bop2529
  br i1 %_bop2530, label %_body2532, label %_post2531
_body2532:
  %_a2534 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2500
  %_i2535 = load i64, i64* %_i2501
  %_index_ptr2537 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2534, i32 0, i32 1, i64 %_i2535
  %_index2538 = load i64, i64* %_index_ptr2537
  %_a2539 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2500
  %_j2540 = load i64, i64* %_j2502
  %_index_ptr2542 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2539, i32 0, i32 1, i64 %_j2540
  %_index2543 = load i64, i64* %_index_ptr2542
  %_bop2544 = icmp slt i64 %_index2538, %_index2543
  br i1 %_bop2544, label %_then2573, label %_else2572
_then2573:
  %_c2545 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2519
  %_k2546 = load i64, i64* %_k2503
  %_index_ptr2548 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2545, i32 0, i32 1, i64 %_k2546
  %_a2549 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2500
  %_i2550 = load i64, i64* %_i2501
  %_index_ptr2552 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2549, i32 0, i32 1, i64 %_i2550
  %_index2553 = load i64, i64* %_index_ptr2552
  store i64 %_index2553, i64* %_index_ptr2548
  %_k2554 = load i64, i64* %_k2503
  %_bop2555 = add i64 %_k2554, 1
  store i64 %_bop2555, i64* %_k2503
  %_i2556 = load i64, i64* %_i2501
  %_bop2557 = add i64 %_i2556, 1
  store i64 %_bop2557, i64* %_i2501
  br label %_merge2571
_else2572:
  %_c2558 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2519
  %_k2559 = load i64, i64* %_k2503
  %_index_ptr2561 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2558, i32 0, i32 1, i64 %_k2559
  %_a2562 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2500
  %_j2563 = load i64, i64* %_j2502
  %_index_ptr2565 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2562, i32 0, i32 1, i64 %_j2563
  %_index2566 = load i64, i64* %_index_ptr2565
  store i64 %_index2566, i64* %_index_ptr2561
  %_k2567 = load i64, i64* %_k2503
  %_bop2568 = add i64 %_k2567, 1
  store i64 %_bop2568, i64* %_k2503
  %_j2569 = load i64, i64* %_j2502
  %_bop2570 = add i64 %_j2569, 1
  store i64 %_bop2570, i64* %_j2502
  br label %_merge2571
_merge2571:
  br label %_cond2533
_post2531:
  br label %_cond2579
_cond2579:
  %_i2574 = load i64, i64* %_i2501
  %_mid2575 = load i64, i64* %_mid2494
  %_bop2576 = icmp sle i64 %_i2574, %_mid2575
  br i1 %_bop2576, label %_body2578, label %_post2577
_body2578:
  %_c2580 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2519
  %_k2581 = load i64, i64* %_k2503
  %_index_ptr2583 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2580, i32 0, i32 1, i64 %_k2581
  %_a2584 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2500
  %_i2585 = load i64, i64* %_i2501
  %_index_ptr2587 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2584, i32 0, i32 1, i64 %_i2585
  %_index2588 = load i64, i64* %_index_ptr2587
  store i64 %_index2588, i64* %_index_ptr2583
  %_k2589 = load i64, i64* %_k2503
  %_bop2590 = add i64 %_k2589, 1
  store i64 %_bop2590, i64* %_k2503
  %_i2591 = load i64, i64* %_i2501
  %_bop2592 = add i64 %_i2591, 1
  store i64 %_bop2592, i64* %_i2501
  br label %_cond2579
_post2577:
  br label %_cond2598
_cond2598:
  %_j2593 = load i64, i64* %_j2502
  %_high2594 = load i64, i64* %_high2496
  %_bop2595 = icmp sle i64 %_j2593, %_high2594
  br i1 %_bop2595, label %_body2597, label %_post2596
_body2597:
  %_c2599 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2519
  %_k2600 = load i64, i64* %_k2503
  %_index_ptr2602 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2599, i32 0, i32 1, i64 %_k2600
  %_a2603 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2500
  %_j2604 = load i64, i64* %_j2502
  %_index_ptr2606 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2603, i32 0, i32 1, i64 %_j2604
  %_index2607 = load i64, i64* %_index_ptr2606
  store i64 %_index2607, i64* %_index_ptr2602
  %_k2608 = load i64, i64* %_k2503
  %_bop2609 = add i64 %_k2608, 1
  store i64 %_bop2609, i64* %_k2503
  %_j2610 = load i64, i64* %_j2502
  %_bop2611 = add i64 %_j2610, 1
  store i64 %_bop2611, i64* %_j2502
  br label %_cond2598
_post2596:
  %_low2612 = load i64, i64* %_low2498
  store i64 %_low2612, i64* %_i2501
  br label %_cond2618
_cond2618:
  %_i2613 = load i64, i64* %_i2501
  %_k2614 = load i64, i64* %_k2503
  %_bop2615 = icmp slt i64 %_i2613, %_k2614
  br i1 %_bop2615, label %_body2617, label %_post2616
_body2617:
  %_a2619 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2500
  %_i2620 = load i64, i64* %_i2501
  %_index_ptr2622 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2619, i32 0, i32 1, i64 %_i2620
  %_c2623 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2519
  %_i2624 = load i64, i64* %_i2501
  %_index_ptr2626 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2623, i32 0, i32 1, i64 %_i2624
  %_index2627 = load i64, i64* %_index_ptr2626
  store i64 %_index2627, i64* %_index_ptr2622
  %_i2628 = load i64, i64* %_i2501
  %_bop2629 = add i64 %_i2628, 1
  store i64 %_bop2629, i64* %_i2501
  br label %_cond2618
_post2616:
  ret void
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
