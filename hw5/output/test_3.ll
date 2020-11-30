; generated from: oatprograms/sieve.oat
target triple = "x86_64-unknown-linux"
define i64 @sieve(i64 %_n3668) {
  %_n3669 = alloca i64
  %_i3679 = alloca i64
  %_arr3685 = alloca { i64, [0 x i1] }*
  %_i3686 = alloca i64
  %_i3708 = alloca i64
  %_j3723 = alloca i64
  %_count3743 = alloca i64
  %_i3744 = alloca i64
  store i64 %_n3668, i64* %_n3669
  %_n3670 = load i64, i64* %_n3669
  %_raw_array3671 = call i64* @oat_alloc_array(i64 %_n3670)
  %_array3672 = bitcast i64* %_raw_array3671 to { i64, [0 x i1] }*
  store i64 0, i64* %_i3679
  br label %_cond3675
_cond3675:
  %_i3680 = load i64, i64* %_i3679
  %_n3681 = load i64, i64* %_n3669
  %_bop3682 = icmp slt i64 %_i3680, %_n3681
  br i1 %_bop3682, label %_body3674, label %_post3673
_body3674:
  %_local_id3678 = load i64, i64* %_i3679
  %_index_ptr3677 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3672, i32 0, i32 1, i64 %_local_id3678
  store i1 0, i1* %_index_ptr3677
  %_bop3676 = add i64 %_local_id3678, 1
  store i64 %_bop3676, i64* %_i3679
  br label %_cond3675
_post3673:
  store { i64, [0 x i1] }* %_array3672, { i64, [0 x i1] }** %_arr3685
  store i64 0, i64* %_i3686
  br label %_cond3692
_cond3692:
  %_i3687 = load i64, i64* %_i3686
  %_n3688 = load i64, i64* %_n3669
  %_bop3689 = icmp slt i64 %_i3687, %_n3688
  br i1 %_bop3689, label %_body3691, label %_post3690
_body3691:
  %_arr3693 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3685
  %_i3694 = load i64, i64* %_i3686
  %_cast3695 = bitcast { i64, [0 x i1] }* %_arr3693 to i64*
  call void @oat_assert_array_length(i64* %_cast3695, i64 %_i3694)
  %_index_ptr3697 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3693, i32 0, i32 1, i64 %_i3694
  store i1 1, i1* %_index_ptr3697
  %_i3698 = load i64, i64* %_i3686
  %_bop3699 = add i64 %_i3698, 1
  store i64 %_bop3699, i64* %_i3686
  br label %_cond3692
_post3690:
  %_arr3700 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3685
  %_cast3701 = bitcast { i64, [0 x i1] }* %_arr3700 to i64*
  call void @oat_assert_array_length(i64* %_cast3701, i64 0)
  %_index_ptr3703 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3700, i32 0, i32 1, i32 0
  store i1 0, i1* %_index_ptr3703
  %_arr3704 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3685
  %_cast3705 = bitcast { i64, [0 x i1] }* %_arr3704 to i64*
  call void @oat_assert_array_length(i64* %_cast3705, i64 1)
  %_index_ptr3707 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3704, i32 0, i32 1, i32 1
  store i1 0, i1* %_index_ptr3707
  store i64 0, i64* %_i3708
  br label %_cond3714
_cond3714:
  %_i3709 = load i64, i64* %_i3708
  %_n3710 = load i64, i64* %_n3669
  %_bop3711 = icmp slt i64 %_i3709, %_n3710
  br i1 %_bop3711, label %_body3713, label %_post3712
_body3713:
  %_arr3715 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3685
  %_i3716 = load i64, i64* %_i3708
  %_cast3717 = bitcast { i64, [0 x i1] }* %_arr3715 to i64*
  call void @oat_assert_array_length(i64* %_cast3717, i64 %_i3716)
  %_index_ptr3719 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3715, i32 0, i32 1, i64 %_i3716
  %_index3720 = load i1, i1* %_index_ptr3719
  br i1 %_index3720, label %_then3740, label %_else3739
_then3740:
  %_i3721 = load i64, i64* %_i3708
  %_bop3722 = mul i64 %_i3721, 2
  store i64 %_bop3722, i64* %_j3723
  br label %_cond3729
_cond3729:
  %_j3724 = load i64, i64* %_j3723
  %_n3725 = load i64, i64* %_n3669
  %_bop3726 = icmp slt i64 %_j3724, %_n3725
  br i1 %_bop3726, label %_body3728, label %_post3727
_body3728:
  %_arr3730 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3685
  %_j3731 = load i64, i64* %_j3723
  %_cast3732 = bitcast { i64, [0 x i1] }* %_arr3730 to i64*
  call void @oat_assert_array_length(i64* %_cast3732, i64 %_j3731)
  %_index_ptr3734 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3730, i32 0, i32 1, i64 %_j3731
  store i1 0, i1* %_index_ptr3734
  %_j3735 = load i64, i64* %_j3723
  %_i3736 = load i64, i64* %_i3708
  %_bop3737 = add i64 %_j3735, %_i3736
  store i64 %_bop3737, i64* %_j3723
  br label %_cond3729
_post3727:
  br label %_merge3738
_else3739:
  br label %_merge3738
_merge3738:
  %_i3741 = load i64, i64* %_i3708
  %_bop3742 = add i64 %_i3741, 1
  store i64 %_bop3742, i64* %_i3708
  br label %_cond3714
_post3712:
  store i64 0, i64* %_count3743
  store i64 0, i64* %_i3744
  br label %_cond3750
_cond3750:
  %_i3745 = load i64, i64* %_i3744
  %_n3746 = load i64, i64* %_n3669
  %_bop3747 = icmp slt i64 %_i3745, %_n3746
  br i1 %_bop3747, label %_body3749, label %_post3748
_body3749:
  %_arr3751 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr3685
  %_i3752 = load i64, i64* %_i3744
  %_cast3753 = bitcast { i64, [0 x i1] }* %_arr3751 to i64*
  call void @oat_assert_array_length(i64* %_cast3753, i64 %_i3752)
  %_index_ptr3755 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_arr3751, i32 0, i32 1, i64 %_i3752
  %_index3756 = load i1, i1* %_index_ptr3755
  br i1 %_index3756, label %_then3761, label %_else3760
_then3761:
  %_count3757 = load i64, i64* %_count3743
  %_bop3758 = add i64 %_count3757, 1
  store i64 %_bop3758, i64* %_count3743
  br label %_merge3759
_else3760:
  br label %_merge3759
_merge3759:
  %_i3762 = load i64, i64* %_i3744
  %_bop3763 = add i64 %_i3762, 1
  store i64 %_bop3763, i64* %_i3744
  br label %_cond3750
_post3748:
  %_count3764 = load i64, i64* %_count3743
  ret i64 %_count3764
}

define i64 @program(i64 %_argc3663, { i64, [0 x i8*] }* %_argv3661) {
  %_argc3664 = alloca i64
  %_argv3662 = alloca { i64, [0 x i8*] }*
  %_n3665 = alloca i64
  store i64 %_argc3663, i64* %_argc3664
  store { i64, [0 x i8*] }* %_argv3661, { i64, [0 x i8*] }** %_argv3662
  store i64 100, i64* %_n3665
  %_n3666 = load i64, i64* %_n3665
  %_result3667 = call i64 @sieve(i64 %_n3666)
  ret i64 %_result3667
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
