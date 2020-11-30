; generated from: oatprograms/insertion_sort.oat
target triple = "x86_64-unknown-linux"
define { i64, [0 x i64] }* @insert({ i64, [0 x i64] }* %_partial5593, i64 %_len5591, i64 %_insertee5589) {
  %_partial5594 = alloca { i64, [0 x i64] }*
  %_len5592 = alloca i64
  %_insertee5590 = alloca i64
  %_i5602 = alloca i64
  %_inserted5616 = alloca { i64, [0 x i64] }*
  %_i5617 = alloca i64
  %_not_yet_inserted5632 = alloca i1
  %_i5646 = alloca i64
  store { i64, [0 x i64] }* %_partial5593, { i64, [0 x i64] }** %_partial5594
  store i64 %_len5591, i64* %_len5592
  store i64 %_insertee5589, i64* %_insertee5590
  %_len5595 = load i64, i64* %_len5592
  %_bop5596 = add i64 %_len5595, 1
  %_raw_array5597 = call i64* @oat_alloc_array(i64 %_bop5596)
  %_array5598 = bitcast i64* %_raw_array5597 to { i64, [0 x i64] }*
  %_len5600 = load i64, i64* %_len5592
  %_bop5601 = add i64 %_len5600, 1
  store i64 %_bop5601, i64* %_i5602
  br label %_cond5609
_cond5609:
  %_i5603 = load i64, i64* %_i5602
  %_len5604 = load i64, i64* %_len5592
  %_bop5605 = add i64 %_len5604, 1
  %_bop5606 = icmp slt i64 %_i5603, %_bop5605
  br i1 %_bop5606, label %_body5608, label %_post5607
_body5608:
  %__tmp_array_sym55995610 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5598
  %_i5611 = load i64, i64* %_i5602
  %_index_ptr5613 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym55995610, i32 0, i32 1, i64 %_i5611
  store i64 0, i64* %_index_ptr5613
  %_i5614 = load i64, i64* %_i5602
  %_bop5615 = add i64 %_i5614, 1
  store i64 %_bop5615, i64* %_i5602
  br label %_cond5609
_post5607:
  store { i64, [0 x i64] }* %_array5598, { i64, [0 x i64] }** %_inserted5616
  store i64 0, i64* %_i5617
  br label %_cond5624
_cond5624:
  %_i5618 = load i64, i64* %_i5617
  %_len5619 = load i64, i64* %_len5592
  %_bop5620 = add i64 %_len5619, 1
  %_bop5621 = icmp slt i64 %_i5618, %_bop5620
  br i1 %_bop5621, label %_body5623, label %_post5622
_body5623:
  %_inserted5625 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5616
  %_i5626 = load i64, i64* %_i5617
  %_index_ptr5628 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_inserted5625, i32 0, i32 1, i64 %_i5626
  %_unop5629 = sub i64 0, 1
  store i64 %_unop5629, i64* %_index_ptr5628
  %_i5630 = load i64, i64* %_i5617
  %_bop5631 = add i64 %_i5630, 1
  store i64 %_bop5631, i64* %_i5617
  br label %_cond5624
_post5622:
  store i1 1, i1* %_not_yet_inserted5632
  %_insertee5633 = load i64, i64* %_insertee5590
  %_partial5634 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial5594
  %_index_ptr5636 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_partial5634, i32 0, i32 1, i32 0
  %_index5637 = load i64, i64* %_index_ptr5636
  %_bop5638 = icmp slt i64 %_insertee5633, %_index5637
  br i1 %_bop5638, label %_then5645, label %_else5644
_then5645:
  store i1 0, i1* %_not_yet_inserted5632
  %_inserted5639 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5616
  %_index_ptr5641 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_inserted5639, i32 0, i32 1, i32 0
  %_insertee5642 = load i64, i64* %_insertee5590
  store i64 %_insertee5642, i64* %_index_ptr5641
  br label %_merge5643
_else5644:
  br label %_merge5643
_merge5643:
  store i64 0, i64* %_i5646
  br label %_cond5652
_cond5652:
  %_i5647 = load i64, i64* %_i5646
  %_len5648 = load i64, i64* %_len5592
  %_bop5649 = icmp slt i64 %_i5647, %_len5648
  br i1 %_bop5649, label %_body5651, label %_post5650
_body5651:
  %_not_yet_inserted5653 = load i1, i1* %_not_yet_inserted5632
  br i1 %_not_yet_inserted5653, label %_then5700, label %_else5699
_then5700:
  %_insertee5654 = load i64, i64* %_insertee5590
  %_partial5655 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial5594
  %_i5656 = load i64, i64* %_i5646
  %_index_ptr5658 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_partial5655, i32 0, i32 1, i64 %_i5656
  %_index5659 = load i64, i64* %_index_ptr5658
  %_bop5660 = icmp sgt i64 %_insertee5654, %_index5659
  br i1 %_bop5660, label %_then5687, label %_else5686
_then5687:
  store i1 0, i1* %_not_yet_inserted5632
  %_inserted5661 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5616
  %_i5662 = load i64, i64* %_i5646
  %_bop5663 = add i64 %_i5662, 1
  %_index_ptr5665 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_inserted5661, i32 0, i32 1, i64 %_bop5663
  %_insertee5666 = load i64, i64* %_insertee5590
  store i64 %_insertee5666, i64* %_index_ptr5665
  %_inserted5667 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5616
  %_i5668 = load i64, i64* %_i5646
  %_index_ptr5670 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_inserted5667, i32 0, i32 1, i64 %_i5668
  %_partial5671 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial5594
  %_i5672 = load i64, i64* %_i5646
  %_index_ptr5674 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_partial5671, i32 0, i32 1, i64 %_i5672
  %_index5675 = load i64, i64* %_index_ptr5674
  store i64 %_index5675, i64* %_index_ptr5670
  br label %_merge5685
_else5686:
  %_inserted5676 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5616
  %_i5677 = load i64, i64* %_i5646
  %_index_ptr5679 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_inserted5676, i32 0, i32 1, i64 %_i5677
  %_partial5680 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial5594
  %_i5681 = load i64, i64* %_i5646
  %_index_ptr5683 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_partial5680, i32 0, i32 1, i64 %_i5681
  %_index5684 = load i64, i64* %_index_ptr5683
  store i64 %_index5684, i64* %_index_ptr5679
  br label %_merge5685
_merge5685:
  br label %_merge5698
_else5699:
  %_inserted5688 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5616
  %_i5689 = load i64, i64* %_i5646
  %_bop5690 = add i64 %_i5689, 1
  %_index_ptr5692 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_inserted5688, i32 0, i32 1, i64 %_bop5690
  %_partial5693 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial5594
  %_i5694 = load i64, i64* %_i5646
  %_index_ptr5696 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_partial5693, i32 0, i32 1, i64 %_i5694
  %_index5697 = load i64, i64* %_index_ptr5696
  store i64 %_index5697, i64* %_index_ptr5692
  br label %_merge5698
_merge5698:
  %_i5701 = load i64, i64* %_i5646
  %_bop5702 = add i64 %_i5701, 1
  store i64 %_bop5702, i64* %_i5646
  br label %_cond5652
_post5650:
  %_inserted5703 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5616
  ret { i64, [0 x i64] }* %_inserted5703
}

define { i64, [0 x i64] }* @insort({ i64, [0 x i64] }* %_unsorted5558, i64 %_len5556) {
  %_unsorted5559 = alloca { i64, [0 x i64] }*
  %_len5557 = alloca i64
  %_out5563 = alloca { i64, [0 x i64] }*
  %_i5571 = alloca i64
  store { i64, [0 x i64] }* %_unsorted5558, { i64, [0 x i64] }** %_unsorted5559
  store i64 %_len5556, i64* %_len5557
  %_raw_array5560 = call i64* @oat_alloc_array(i64 1)
  %_array5561 = bitcast i64* %_raw_array5560 to { i64, [0 x i64] }*
  %_ind5562 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5561, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind5562
  store { i64, [0 x i64] }* %_array5561, { i64, [0 x i64] }** %_out5563
  %_out5564 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out5563
  %_index_ptr5566 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_out5564, i32 0, i32 1, i32 0
  %_unsorted5567 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_unsorted5559
  %_index_ptr5569 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_unsorted5567, i32 0, i32 1, i32 0
  %_index5570 = load i64, i64* %_index_ptr5569
  store i64 %_index5570, i64* %_index_ptr5566
  store i64 1, i64* %_i5571
  br label %_cond5577
_cond5577:
  %_i5572 = load i64, i64* %_i5571
  %_len5573 = load i64, i64* %_len5557
  %_bop5574 = icmp slt i64 %_i5572, %_len5573
  br i1 %_bop5574, label %_body5576, label %_post5575
_body5576:
  %_unsorted5578 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_unsorted5559
  %_i5579 = load i64, i64* %_i5571
  %_index_ptr5581 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_unsorted5578, i32 0, i32 1, i64 %_i5579
  %_index5582 = load i64, i64* %_index_ptr5581
  %_i5583 = load i64, i64* %_i5571
  %_out5584 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out5563
  %_result5585 = call { i64, [0 x i64] }* @insert({ i64, [0 x i64] }* %_out5584, i64 %_i5583, i64 %_index5582)
  store { i64, [0 x i64] }* %_result5585, { i64, [0 x i64] }** %_out5563
  %_i5586 = load i64, i64* %_i5571
  %_bop5587 = add i64 %_i5586, 1
  store i64 %_bop5587, i64* %_i5571
  br label %_cond5577
_post5575:
  %_out5588 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out5563
  ret { i64, [0 x i64] }* %_out5588
}

define i64 @program(i64 %_argc5538, { i64, [0 x i8*] }* %_argv5536) {
  %_argc5539 = alloca i64
  %_argv5537 = alloca { i64, [0 x i8*] }*
  %_array5548 = alloca { i64, [0 x i64] }*
  %_result5551 = alloca { i64, [0 x i64] }*
  store i64 %_argc5538, i64* %_argc5539
  store { i64, [0 x i8*] }* %_argv5536, { i64, [0 x i8*] }** %_argv5537
  %_raw_array5540 = call i64* @oat_alloc_array(i64 6)
  %_array5541 = bitcast i64* %_raw_array5540 to { i64, [0 x i64] }*
  %_ind5542 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5541, i32 0, i32 1, i32 0
  store i64 13, i64* %_ind5542
  %_ind5543 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5541, i32 0, i32 1, i32 1
  store i64 42, i64* %_ind5543
  %_ind5544 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5541, i32 0, i32 1, i32 2
  store i64 32, i64* %_ind5544
  %_ind5545 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5541, i32 0, i32 1, i32 3
  store i64 3, i64* %_ind5545
  %_ind5546 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5541, i32 0, i32 1, i32 4
  store i64 2, i64* %_ind5546
  %_ind5547 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5541, i32 0, i32 1, i32 5
  store i64 6, i64* %_ind5547
  store { i64, [0 x i64] }* %_array5541, { i64, [0 x i64] }** %_array5548
  %_array5549 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5548
  %_result5550 = call { i64, [0 x i64] }* @insort({ i64, [0 x i64] }* %_array5549, i64 6)
  store { i64, [0 x i64] }* %_result5550, { i64, [0 x i64] }** %_result5551
  %_result5552 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_result5551
  %_index_ptr5554 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_result5552, i32 0, i32 1, i32 5
  %_index5555 = load i64, i64* %_index_ptr5554
  ret i64 %_index5555
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
