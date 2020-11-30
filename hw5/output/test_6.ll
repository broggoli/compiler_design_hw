; generated from: oatprograms/lfsr.oat
target triple = "x86_64-unknown-linux"
@lfsr_iterations = global i64 5
@lfsr_length = global i64 4
@lfsr_init_values = global { i64, [4 x i1] }* @_global_arr4791
@_global_arr4791 = global { i64, [4 x i1] } { i64 4, [4 x i1] [ i1 1, i1 0, i1 1, i1 0 ] }
@_str_arr4771 = global [2 x i8] c"T\00"
@_str_arr4773 = global [2 x i8] c"F\00"
@_str_arr4741 = global [2 x i8] c" \00"

define i1 @xor(i1 %_x4780, i1 %_y4778) {
  %_x4781 = alloca i1
  %_y4779 = alloca i1
  store i1 %_x4780, i1* %_x4781
  store i1 %_y4778, i1* %_y4779
  %_x4782 = load i1, i1* %_x4781
  %_y4783 = load i1, i1* %_y4779
  %_unop4784 = icmp eq i1 %_y4783, 0
  %_bop4785 = and i1 %_x4782, %_unop4784
  %_x4786 = load i1, i1* %_x4781
  %_unop4787 = icmp eq i1 %_x4786, 0
  %_y4788 = load i1, i1* %_y4779
  %_bop4789 = and i1 %_unop4787, %_y4788
  %_bop4790 = or i1 %_bop4785, %_bop4789
  ret i1 %_bop4790
}

define i8* @string_of_bool(i1 %_b4768) {
  %_b4769 = alloca i1
  store i1 %_b4768, i1* %_b4769
  %_b4770 = load i1, i1* %_b4769
  br i1 %_b4770, label %_then4777, label %_else4776
_then4777:
  %_str4772 = getelementptr [2 x i8], [2 x i8]* @_str_arr4771, i32 0, i32 0
  ret i8* %_str4772
_else4776:
  %_str4774 = getelementptr [2 x i8], [2 x i8]* @_str_arr4773, i32 0, i32 0
  ret i8* %_str4774
}

define void @print_lfsr({ i64, [0 x i1] }* %_lfsr_register4749, i64 %_len4747) {
  %_lfsr_register4750 = alloca { i64, [0 x i1] }*
  %_len4748 = alloca i64
  %_i4751 = alloca i64
  store { i64, [0 x i1] }* %_lfsr_register4749, { i64, [0 x i1] }** %_lfsr_register4750
  store i64 %_len4747, i64* %_len4748
  store i64 0, i64* %_i4751
  br label %_cond4757
_cond4757:
  %_i4752 = load i64, i64* %_i4751
  %_len4753 = load i64, i64* %_len4748
  %_bop4754 = icmp slt i64 %_i4752, %_len4753
  br i1 %_bop4754, label %_body4756, label %_post4755
_body4756:
  %_lfsr_register4758 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4750
  %_i4759 = load i64, i64* %_i4751
  %_cast4760 = bitcast { i64, [0 x i1] }* %_lfsr_register4758 to i64*
  call void @oat_assert_array_length(i64* %_cast4760, i64 %_i4759)
  %_index_ptr4762 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4758, i32 0, i32 1, i64 %_i4759
  %_index4763 = load i1, i1* %_index_ptr4762
  %_result4764 = call i8* @string_of_bool(i1 %_index4763)
  call void @print_string(i8* %_result4764)
  %_i4766 = load i64, i64* %_i4751
  %_bop4767 = add i64 %_i4766, 1
  store i64 %_bop4767, i64* %_i4751
  br label %_cond4757
_post4755:
  ret void
}

define i64 @program(i64 %_argc4647, { i64, [0 x i8*] }* %_argv4645) {
  %_argc4648 = alloca i64
  %_argv4646 = alloca { i64, [0 x i8*] }*
  %_i4658 = alloca i64
  %_lfsr_register4664 = alloca { i64, [0 x i1] }*
  %_i4665 = alloca i64
  %_i4685 = alloca i64
  %_new_first4707 = alloca i1
  %_j4710 = alloca i64
  store i64 %_argc4647, i64* %_argc4648
  store { i64, [0 x i8*] }* %_argv4645, { i64, [0 x i8*] }** %_argv4646
  %_lfsr_length4649 = load i64, i64* @lfsr_length
  %_raw_array4650 = call i64* @oat_alloc_array(i64 %_lfsr_length4649)
  %_array4651 = bitcast i64* %_raw_array4650 to { i64, [0 x i1] }*
  store i64 0, i64* %_i4658
  br label %_cond4654
_cond4654:
  %_i4659 = load i64, i64* %_i4658
  %_lfsr_length4660 = load i64, i64* @lfsr_length
  %_bop4661 = icmp slt i64 %_i4659, %_lfsr_length4660
  br i1 %_bop4661, label %_body4653, label %_post4652
_body4653:
  %_local_id4657 = load i64, i64* %_i4658
  %_index_ptr4656 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4651, i32 0, i32 1, i64 %_local_id4657
  store i1 0, i1* %_index_ptr4656
  %_bop4655 = add i64 %_local_id4657, 1
  store i64 %_bop4655, i64* %_i4658
  br label %_cond4654
_post4652:
  store { i64, [0 x i1] }* %_array4651, { i64, [0 x i1] }** %_lfsr_register4664
  store i64 0, i64* %_i4665
  br label %_cond4671
_cond4671:
  %_i4666 = load i64, i64* %_i4665
  %_lfsr_length4667 = load i64, i64* @lfsr_length
  %_bop4668 = icmp slt i64 %_i4666, %_lfsr_length4667
  br i1 %_bop4668, label %_body4670, label %_post4669
_body4670:
  %_lfsr_register4672 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4664
  %_i4673 = load i64, i64* %_i4665
  %_cast4674 = bitcast { i64, [0 x i1] }* %_lfsr_register4672 to i64*
  call void @oat_assert_array_length(i64* %_cast4674, i64 %_i4673)
  %_index_ptr4676 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4672, i32 0, i32 1, i64 %_i4673
  %_lfsr_init_values4677 = load { i64, [4 x i1] }*, { i64, [4 x i1] }** @lfsr_init_values
  %_i4678 = load i64, i64* %_i4665
  %_cast4679 = bitcast { i64, [4 x i1] }* %_lfsr_init_values4677 to i64*
  call void @oat_assert_array_length(i64* %_cast4679, i64 %_i4678)
  %_index_ptr4681 = getelementptr { i64, [4 x i1] }, { i64, [4 x i1] }* %_lfsr_init_values4677, i32 0, i32 1, i64 %_i4678
  %_index4682 = load i1, i1* %_index_ptr4681
  store i1 %_index4682, i1* %_index_ptr4676
  %_i4683 = load i64, i64* %_i4665
  %_bop4684 = add i64 %_i4683, 1
  store i64 %_bop4684, i64* %_i4665
  br label %_cond4671
_post4669:
  store i64 0, i64* %_i4685
  br label %_cond4691
_cond4691:
  %_i4686 = load i64, i64* %_i4685
  %_lfsr_iterations4687 = load i64, i64* @lfsr_iterations
  %_bop4688 = icmp slt i64 %_i4686, %_lfsr_iterations4687
  br i1 %_bop4688, label %_body4690, label %_post4689
_body4690:
  %_lfsr_register4692 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4664
  %_lfsr_length4693 = load i64, i64* @lfsr_length
  %_bop4694 = sub i64 %_lfsr_length4693, 2
  %_cast4695 = bitcast { i64, [0 x i1] }* %_lfsr_register4692 to i64*
  call void @oat_assert_array_length(i64* %_cast4695, i64 %_bop4694)
  %_index_ptr4697 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4692, i32 0, i32 1, i64 %_bop4694
  %_index4698 = load i1, i1* %_index_ptr4697
  %_lfsr_register4699 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4664
  %_lfsr_length4700 = load i64, i64* @lfsr_length
  %_bop4701 = sub i64 %_lfsr_length4700, 1
  %_cast4702 = bitcast { i64, [0 x i1] }* %_lfsr_register4699 to i64*
  call void @oat_assert_array_length(i64* %_cast4702, i64 %_bop4701)
  %_index_ptr4704 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4699, i32 0, i32 1, i64 %_bop4701
  %_index4705 = load i1, i1* %_index_ptr4704
  %_result4706 = call i1 @xor(i1 %_index4705, i1 %_index4698)
  store i1 %_result4706, i1* %_new_first4707
  %_lfsr_length4708 = load i64, i64* @lfsr_length
  %_bop4709 = sub i64 %_lfsr_length4708, 1
  store i64 %_bop4709, i64* %_j4710
  br label %_cond4715
_cond4715:
  %_j4711 = load i64, i64* %_j4710
  %_bop4712 = icmp sgt i64 %_j4711, 0
  br i1 %_bop4712, label %_body4714, label %_post4713
_body4714:
  %_lfsr_register4716 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4664
  %_j4717 = load i64, i64* %_j4710
  %_cast4718 = bitcast { i64, [0 x i1] }* %_lfsr_register4716 to i64*
  call void @oat_assert_array_length(i64* %_cast4718, i64 %_j4717)
  %_index_ptr4720 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4716, i32 0, i32 1, i64 %_j4717
  %_lfsr_register4721 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4664
  %_j4722 = load i64, i64* %_j4710
  %_bop4723 = sub i64 %_j4722, 1
  %_cast4724 = bitcast { i64, [0 x i1] }* %_lfsr_register4721 to i64*
  call void @oat_assert_array_length(i64* %_cast4724, i64 %_bop4723)
  %_index_ptr4726 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4721, i32 0, i32 1, i64 %_bop4723
  %_index4727 = load i1, i1* %_index_ptr4726
  store i1 %_index4727, i1* %_index_ptr4720
  %_j4728 = load i64, i64* %_j4710
  %_bop4729 = sub i64 %_j4728, 1
  store i64 %_bop4729, i64* %_j4710
  br label %_cond4715
_post4713:
  %_lfsr_register4730 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4664
  %_cast4731 = bitcast { i64, [0 x i1] }* %_lfsr_register4730 to i64*
  call void @oat_assert_array_length(i64* %_cast4731, i64 0)
  %_index_ptr4733 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_lfsr_register4730, i32 0, i32 1, i32 0
  %_new_first4734 = load i1, i1* %_new_first4707
  store i1 %_new_first4734, i1* %_index_ptr4733
  %_i4735 = load i64, i64* %_i4685
  %_bop4736 = add i64 %_i4735, 1
  store i64 %_bop4736, i64* %_i4685
  br label %_cond4691
_post4689:
  %_lfsr_length4737 = load i64, i64* @lfsr_length
  %_lfsr_init_values4738 = load { i64, [4 x i1] }*, { i64, [4 x i1] }** @lfsr_init_values
  %_cast4739 = bitcast { i64, [4 x i1] }* %_lfsr_init_values4738 to { i64, [0 x i1] }*
  call void @print_lfsr({ i64, [0 x i1] }* %_cast4739, i64 %_lfsr_length4737)
  %_str4742 = getelementptr [2 x i8], [2 x i8]* @_str_arr4741, i32 0, i32 0
  call void @print_string(i8* %_str4742)
  %_lfsr_length4744 = load i64, i64* @lfsr_length
  %_lfsr_register4745 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4664
  call void @print_lfsr({ i64, [0 x i1] }* %_lfsr_register4745, i64 %_lfsr_length4744)
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
