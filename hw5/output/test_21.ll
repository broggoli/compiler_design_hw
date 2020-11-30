; generated from: oatprograms/maxsubsequence.oat
target triple = "x86_64-unknown-linux"
define i64 @maxsum({ i64, [0 x i64] }* %_arr5724, i64 %_size5722) {
  %_arr5725 = alloca { i64, [0 x i64] }*
  %_size5723 = alloca i64
  %_i5731 = alloca i64
  %_maxarr5744 = alloca { i64, [0 x i64] }*
  %_maxs5745 = alloca i64
  %_i5753 = alloca i64
  %_j5760 = alloca i64
  store { i64, [0 x i64] }* %_arr5724, { i64, [0 x i64] }** %_arr5725
  store i64 %_size5722, i64* %_size5723
  %_size5726 = load i64, i64* %_size5723
  %_raw_array5727 = call i64* @oat_alloc_array(i64 %_size5726)
  %_array5728 = bitcast i64* %_raw_array5727 to { i64, [0 x i64] }*
  %_size5730 = load i64, i64* %_size5723
  store i64 %_size5730, i64* %_i5731
  br label %_cond5737
_cond5737:
  %_i5732 = load i64, i64* %_i5731
  %_size5733 = load i64, i64* %_size5723
  %_bop5734 = icmp slt i64 %_i5732, %_size5733
  br i1 %_bop5734, label %_body5736, label %_post5735
_body5736:
  %__tmp_array_sym57295738 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5728
  %_i5739 = load i64, i64* %_i5731
  %_index_ptr5741 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym57295738, i32 0, i32 1, i64 %_i5739
  store i64 0, i64* %_index_ptr5741
  %_i5742 = load i64, i64* %_i5731
  %_bop5743 = add i64 %_i5742, 1
  store i64 %_bop5743, i64* %_i5731
  br label %_cond5737
_post5735:
  store { i64, [0 x i64] }* %_array5728, { i64, [0 x i64] }** %_maxarr5744
  store i64 0, i64* %_maxs5745
  %_maxarr5746 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5744
  %_index_ptr5748 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_maxarr5746, i32 0, i32 1, i32 0
  %_arr5749 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5725
  %_index_ptr5751 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr5749, i32 0, i32 1, i32 0
  %_index5752 = load i64, i64* %_index_ptr5751
  store i64 %_index5752, i64* %_index_ptr5748
  store i64 0, i64* %_i5753
  br label %_cond5759
_cond5759:
  %_i5754 = load i64, i64* %_i5753
  %_size5755 = load i64, i64* %_size5723
  %_bop5756 = icmp slt i64 %_i5754, %_size5755
  br i1 %_bop5756, label %_body5758, label %_post5757
_body5758:
  store i64 0, i64* %_j5760
  br label %_cond5766
_cond5766:
  %_j5761 = load i64, i64* %_j5760
  %_i5762 = load i64, i64* %_i5753
  %_bop5763 = icmp slt i64 %_j5761, %_i5762
  br i1 %_bop5763, label %_body5765, label %_post5764
_body5765:
  %_arr5767 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5725
  %_i5768 = load i64, i64* %_i5753
  %_index_ptr5770 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr5767, i32 0, i32 1, i64 %_i5768
  %_index5771 = load i64, i64* %_index_ptr5770
  %_arr5772 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5725
  %_j5773 = load i64, i64* %_j5760
  %_index_ptr5775 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr5772, i32 0, i32 1, i64 %_j5773
  %_index5776 = load i64, i64* %_index_ptr5775
  %_bop5777 = icmp sgt i64 %_index5771, %_index5776
  %_maxarr5778 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5744
  %_i5779 = load i64, i64* %_i5753
  %_index_ptr5781 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_maxarr5778, i32 0, i32 1, i64 %_i5779
  %_index5782 = load i64, i64* %_index_ptr5781
  %_maxarr5783 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5744
  %_j5784 = load i64, i64* %_j5760
  %_index_ptr5786 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_maxarr5783, i32 0, i32 1, i64 %_j5784
  %_index5787 = load i64, i64* %_index_ptr5786
  %_arr5788 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5725
  %_i5789 = load i64, i64* %_i5753
  %_index_ptr5791 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr5788, i32 0, i32 1, i64 %_i5789
  %_index5792 = load i64, i64* %_index_ptr5791
  %_bop5793 = add i64 %_index5787, %_index5792
  %_bop5794 = icmp slt i64 %_index5782, %_bop5793
  %_bop5795 = and i1 %_bop5777, %_bop5794
  br i1 %_bop5795, label %_then5813, label %_else5812
_then5813:
  %_maxarr5796 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5744
  %_i5797 = load i64, i64* %_i5753
  %_index_ptr5799 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_maxarr5796, i32 0, i32 1, i64 %_i5797
  %_maxarr5800 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5744
  %_j5801 = load i64, i64* %_j5760
  %_index_ptr5803 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_maxarr5800, i32 0, i32 1, i64 %_j5801
  %_index5804 = load i64, i64* %_index_ptr5803
  %_arr5805 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5725
  %_i5806 = load i64, i64* %_i5753
  %_index_ptr5808 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr5805, i32 0, i32 1, i64 %_i5806
  %_index5809 = load i64, i64* %_index_ptr5808
  %_bop5810 = add i64 %_index5804, %_index5809
  store i64 %_bop5810, i64* %_index_ptr5799
  br label %_merge5811
_else5812:
  br label %_merge5811
_merge5811:
  %_j5814 = load i64, i64* %_j5760
  %_bop5815 = add i64 %_j5814, 1
  store i64 %_bop5815, i64* %_j5760
  br label %_cond5766
_post5764:
  %_maxs5816 = load i64, i64* %_maxs5745
  %_maxarr5817 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5744
  %_i5818 = load i64, i64* %_i5753
  %_index_ptr5820 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_maxarr5817, i32 0, i32 1, i64 %_i5818
  %_index5821 = load i64, i64* %_index_ptr5820
  %_bop5822 = icmp slt i64 %_maxs5816, %_index5821
  br i1 %_bop5822, label %_then5830, label %_else5829
_then5830:
  %_maxarr5823 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5744
  %_i5824 = load i64, i64* %_i5753
  %_index_ptr5826 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_maxarr5823, i32 0, i32 1, i64 %_i5824
  %_index5827 = load i64, i64* %_index_ptr5826
  store i64 %_index5827, i64* %_maxs5745
  br label %_merge5828
_else5829:
  br label %_merge5828
_merge5828:
  %_i5831 = load i64, i64* %_i5753
  %_bop5832 = add i64 %_i5831, 1
  store i64 %_bop5832, i64* %_i5753
  br label %_cond5759
_post5757:
  %_maxs5833 = load i64, i64* %_maxs5745
  ret i64 %_maxs5833
}

define i64 @program(i64 %_argc5706, { i64, [0 x i8*] }* %_argv5704) {
  %_argc5707 = alloca i64
  %_argv5705 = alloca { i64, [0 x i8*] }*
  %_array5717 = alloca { i64, [0 x i64] }*
  %_max_ans5720 = alloca i64
  store i64 %_argc5706, i64* %_argc5707
  store { i64, [0 x i8*] }* %_argv5704, { i64, [0 x i8*] }** %_argv5705
  %_raw_array5708 = call i64* @oat_alloc_array(i64 7)
  %_array5709 = bitcast i64* %_raw_array5708 to { i64, [0 x i64] }*
  %_ind5710 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5709, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind5710
  %_ind5711 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5709, i32 0, i32 1, i32 1
  store i64 101, i64* %_ind5711
  %_ind5712 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5709, i32 0, i32 1, i32 2
  store i64 2, i64* %_ind5712
  %_ind5713 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5709, i32 0, i32 1, i32 3
  store i64 3, i64* %_ind5713
  %_ind5714 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5709, i32 0, i32 1, i32 4
  store i64 101, i64* %_ind5714
  %_ind5715 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5709, i32 0, i32 1, i32 5
  store i64 4, i64* %_ind5715
  %_ind5716 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5709, i32 0, i32 1, i32 6
  store i64 5, i64* %_ind5716
  store { i64, [0 x i64] }* %_array5709, { i64, [0 x i64] }** %_array5717
  %_array5718 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5717
  %_result5719 = call i64 @maxsum({ i64, [0 x i64] }* %_array5718, i64 7)
  store i64 %_result5719, i64* %_max_ans5720
  %_max_ans5721 = load i64, i64* %_max_ans5720
  ret i64 %_max_ans5721
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
