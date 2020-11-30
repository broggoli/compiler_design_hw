; generated from: oatprograms/count_sort.oat
target triple = "x86_64-unknown-linux"
@_str_arr3632 = global [2 x i8] c"
\00"

define i64 @min({ i64, [0 x i64] }* %_arr3812, i64 %_len3810) {
  %_arr3813 = alloca { i64, [0 x i64] }*
  %_len3811 = alloca i64
  %_min3818 = alloca i64
  %_i3819 = alloca i64
  store { i64, [0 x i64] }* %_arr3812, { i64, [0 x i64] }** %_arr3813
  store i64 %_len3810, i64* %_len3811
  %_arr3814 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3813
  %_index_ptr3816 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr3814, i32 0, i32 1, i32 0
  %_index3817 = load i64, i64* %_index_ptr3816
  store i64 %_index3817, i64* %_min3818
  store i64 0, i64* %_i3819
  br label %_cond3825
_cond3825:
  %_i3820 = load i64, i64* %_i3819
  %_len3821 = load i64, i64* %_len3811
  %_bop3822 = icmp slt i64 %_i3820, %_len3821
  br i1 %_bop3822, label %_body3824, label %_post3823
_body3824:
  %_arr3826 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3813
  %_i3827 = load i64, i64* %_i3819
  %_index_ptr3829 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr3826, i32 0, i32 1, i64 %_i3827
  %_index3830 = load i64, i64* %_index_ptr3829
  %_min3831 = load i64, i64* %_min3818
  %_bop3832 = icmp slt i64 %_index3830, %_min3831
  br i1 %_bop3832, label %_then3840, label %_else3839
_then3840:
  %_arr3833 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3813
  %_i3834 = load i64, i64* %_i3819
  %_index_ptr3836 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr3833, i32 0, i32 1, i64 %_i3834
  %_index3837 = load i64, i64* %_index_ptr3836
  store i64 %_index3837, i64* %_min3818
  br label %_merge3838
_else3839:
  br label %_merge3838
_merge3838:
  %_i3841 = load i64, i64* %_i3819
  %_bop3842 = add i64 %_i3841, 1
  store i64 %_bop3842, i64* %_i3819
  br label %_cond3825
_post3823:
  %_min3843 = load i64, i64* %_min3818
  ret i64 %_min3843
}

define i64 @max({ i64, [0 x i64] }* %_arr3778, i64 %_len3776) {
  %_arr3779 = alloca { i64, [0 x i64] }*
  %_len3777 = alloca i64
  %_max3784 = alloca i64
  %_i3785 = alloca i64
  store { i64, [0 x i64] }* %_arr3778, { i64, [0 x i64] }** %_arr3779
  store i64 %_len3776, i64* %_len3777
  %_arr3780 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3779
  %_index_ptr3782 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr3780, i32 0, i32 1, i32 0
  %_index3783 = load i64, i64* %_index_ptr3782
  store i64 %_index3783, i64* %_max3784
  store i64 0, i64* %_i3785
  br label %_cond3791
_cond3791:
  %_i3786 = load i64, i64* %_i3785
  %_len3787 = load i64, i64* %_len3777
  %_bop3788 = icmp slt i64 %_i3786, %_len3787
  br i1 %_bop3788, label %_body3790, label %_post3789
_body3790:
  %_arr3792 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3779
  %_i3793 = load i64, i64* %_i3785
  %_index_ptr3795 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr3792, i32 0, i32 1, i64 %_i3793
  %_index3796 = load i64, i64* %_index_ptr3795
  %_max3797 = load i64, i64* %_max3784
  %_bop3798 = icmp sgt i64 %_index3796, %_max3797
  br i1 %_bop3798, label %_then3806, label %_else3805
_then3806:
  %_arr3799 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3779
  %_i3800 = load i64, i64* %_i3785
  %_index_ptr3802 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr3799, i32 0, i32 1, i64 %_i3800
  %_index3803 = load i64, i64* %_index_ptr3802
  store i64 %_index3803, i64* %_max3784
  br label %_merge3804
_else3805:
  br label %_merge3804
_merge3804:
  %_i3807 = load i64, i64* %_i3785
  %_bop3808 = add i64 %_i3807, 1
  store i64 %_bop3808, i64* %_i3785
  br label %_cond3791
_post3789:
  %_max3809 = load i64, i64* %_max3784
  ret i64 %_max3809
}

define { i64, [0 x i64] }* @count_sort({ i64, [0 x i64] }* %_arr3644, i64 %_len3642) {
  %_arr3645 = alloca { i64, [0 x i64] }*
  %_len3643 = alloca i64
  %_min3649 = alloca i64
  %_max3653 = alloca i64
  %_i3665 = alloca i64
  %_counts3681 = alloca { i64, [0 x i64] }*
  %_i3682 = alloca i64
  %_i3714 = alloca i64
  %_j3715 = alloca i64
  %_i23721 = alloca i64
  %_out3734 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_arr3644, { i64, [0 x i64] }** %_arr3645
  store i64 %_len3642, i64* %_len3643
  %_len3646 = load i64, i64* %_len3643
  %_arr3647 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3645
  %_result3648 = call i64 @min({ i64, [0 x i64] }* %_arr3647, i64 %_len3646)
  store i64 %_result3648, i64* %_min3649
  %_len3650 = load i64, i64* %_len3643
  %_arr3651 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3645
  %_result3652 = call i64 @max({ i64, [0 x i64] }* %_arr3651, i64 %_len3650)
  store i64 %_result3652, i64* %_max3653
  %_max3654 = load i64, i64* %_max3653
  %_min3655 = load i64, i64* %_min3649
  %_bop3656 = sub i64 %_max3654, %_min3655
  %_bop3657 = add i64 %_bop3656, 1
  %_raw_array3658 = call i64* @oat_alloc_array(i64 %_bop3657)
  %_array3659 = bitcast i64* %_raw_array3658 to { i64, [0 x i64] }*
  %_max3661 = load i64, i64* %_max3653
  %_min3662 = load i64, i64* %_min3649
  %_bop3663 = sub i64 %_max3661, %_min3662
  %_bop3664 = add i64 %_bop3663, 1
  store i64 %_bop3664, i64* %_i3665
  br label %_cond3674
_cond3674:
  %_i3666 = load i64, i64* %_i3665
  %_max3667 = load i64, i64* %_max3653
  %_min3668 = load i64, i64* %_min3649
  %_bop3669 = sub i64 %_max3667, %_min3668
  %_bop3670 = add i64 %_bop3669, 1
  %_bop3671 = icmp slt i64 %_i3666, %_bop3670
  br i1 %_bop3671, label %_body3673, label %_post3672
_body3673:
  %__tmp_array_sym36603675 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array3659
  %_i3676 = load i64, i64* %_i3665
  %_index_ptr3678 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym36603675, i32 0, i32 1, i64 %_i3676
  store i64 0, i64* %_index_ptr3678
  %_i3679 = load i64, i64* %_i3665
  %_bop3680 = add i64 %_i3679, 1
  store i64 %_bop3680, i64* %_i3665
  br label %_cond3674
_post3672:
  store { i64, [0 x i64] }* %_array3659, { i64, [0 x i64] }** %_counts3681
  store i64 0, i64* %_i3682
  br label %_cond3688
_cond3688:
  %_i3683 = load i64, i64* %_i3682
  %_len3684 = load i64, i64* %_len3643
  %_bop3685 = icmp slt i64 %_i3683, %_len3684
  br i1 %_bop3685, label %_body3687, label %_post3686
_body3687:
  %_counts3689 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts3681
  %_arr3690 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3645
  %_i3691 = load i64, i64* %_i3682
  %_index_ptr3693 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr3690, i32 0, i32 1, i64 %_i3691
  %_index3694 = load i64, i64* %_index_ptr3693
  %_min3695 = load i64, i64* %_min3649
  %_bop3696 = sub i64 %_index3694, %_min3695
  %_index_ptr3698 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_counts3689, i32 0, i32 1, i64 %_bop3696
  %_counts3699 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts3681
  %_arr3700 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3645
  %_i3701 = load i64, i64* %_i3682
  %_index_ptr3703 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr3700, i32 0, i32 1, i64 %_i3701
  %_index3704 = load i64, i64* %_index_ptr3703
  %_min3705 = load i64, i64* %_min3649
  %_bop3706 = sub i64 %_index3704, %_min3705
  %_index_ptr3708 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_counts3699, i32 0, i32 1, i64 %_bop3706
  %_index3709 = load i64, i64* %_index_ptr3708
  %_bop3710 = add i64 %_index3709, 1
  store i64 %_bop3710, i64* %_index_ptr3698
  %_i3711 = load i64, i64* %_i3682
  %_bop3712 = add i64 %_i3711, 1
  store i64 %_bop3712, i64* %_i3682
  br label %_cond3688
_post3686:
  %_min3713 = load i64, i64* %_min3649
  store i64 %_min3713, i64* %_i3714
  store i64 0, i64* %_j3715
  %_len3716 = load i64, i64* %_len3643
  %_raw_array3717 = call i64* @oat_alloc_array(i64 %_len3716)
  %_array3718 = bitcast i64* %_raw_array3717 to { i64, [0 x i64] }*
  %_len3720 = load i64, i64* %_len3643
  store i64 %_len3720, i64* %_i23721
  br label %_cond3727
_cond3727:
  %_i23722 = load i64, i64* %_i23721
  %_len3723 = load i64, i64* %_len3643
  %_bop3724 = icmp slt i64 %_i23722, %_len3723
  br i1 %_bop3724, label %_body3726, label %_post3725
_body3726:
  %__tmp_array_sym37193728 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array3718
  %_i23729 = load i64, i64* %_i23721
  %_index_ptr3731 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym37193728, i32 0, i32 1, i64 %_i23729
  store i64 0, i64* %_index_ptr3731
  %_i23732 = load i64, i64* %_i23721
  %_bop3733 = add i64 %_i23732, 1
  store i64 %_bop3733, i64* %_i23721
  br label %_cond3727
_post3725:
  store { i64, [0 x i64] }* %_array3718, { i64, [0 x i64] }** %_out3734
  br label %_cond3740
_cond3740:
  %_i3735 = load i64, i64* %_i3714
  %_max3736 = load i64, i64* %_max3653
  %_bop3737 = icmp sle i64 %_i3735, %_max3736
  br i1 %_bop3737, label %_body3739, label %_post3738
_body3739:
  %_counts3741 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts3681
  %_i3742 = load i64, i64* %_i3714
  %_min3743 = load i64, i64* %_min3649
  %_bop3744 = sub i64 %_i3742, %_min3743
  %_index_ptr3746 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_counts3741, i32 0, i32 1, i64 %_bop3744
  %_index3747 = load i64, i64* %_index_ptr3746
  %_bop3748 = icmp sgt i64 %_index3747, 0
  br i1 %_bop3748, label %_then3774, label %_else3773
_then3774:
  %_out3749 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out3734
  %_j3750 = load i64, i64* %_j3715
  %_index_ptr3752 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_out3749, i32 0, i32 1, i64 %_j3750
  %_i3753 = load i64, i64* %_i3714
  store i64 %_i3753, i64* %_index_ptr3752
  %_counts3754 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts3681
  %_i3755 = load i64, i64* %_i3714
  %_min3756 = load i64, i64* %_min3649
  %_bop3757 = sub i64 %_i3755, %_min3756
  %_index_ptr3759 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_counts3754, i32 0, i32 1, i64 %_bop3757
  %_counts3760 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts3681
  %_i3761 = load i64, i64* %_i3714
  %_min3762 = load i64, i64* %_min3649
  %_bop3763 = sub i64 %_i3761, %_min3762
  %_index_ptr3765 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_counts3760, i32 0, i32 1, i64 %_bop3763
  %_index3766 = load i64, i64* %_index_ptr3765
  %_bop3767 = sub i64 %_index3766, 1
  store i64 %_bop3767, i64* %_index_ptr3759
  %_j3768 = load i64, i64* %_j3715
  %_bop3769 = add i64 %_j3768, 1
  store i64 %_bop3769, i64* %_j3715
  br label %_merge3772
_else3773:
  %_i3770 = load i64, i64* %_i3714
  %_bop3771 = add i64 %_i3770, 1
  store i64 %_bop3771, i64* %_i3714
  br label %_merge3772
_merge3772:
  br label %_cond3740
_post3738:
  %_out3775 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out3734
  ret { i64, [0 x i64] }* %_out3775
}

define i64 @program(i64 %_argc3614, { i64, [0 x i8*] }* %_argv3612) {
  %_argc3615 = alloca i64
  %_argv3613 = alloca { i64, [0 x i8*] }*
  %_arr3627 = alloca { i64, [0 x i64] }*
  %_len3628 = alloca i64
  %_sorted3638 = alloca { i64, [0 x i64] }*
  store i64 %_argc3614, i64* %_argc3615
  store { i64, [0 x i8*] }* %_argv3612, { i64, [0 x i8*] }** %_argv3613
  %_raw_array3616 = call i64* @oat_alloc_array(i64 9)
  %_array3617 = bitcast i64* %_raw_array3616 to { i64, [0 x i64] }*
  %_ind3618 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 0
  store i64 65, i64* %_ind3618
  %_ind3619 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 1
  store i64 70, i64* %_ind3619
  %_ind3620 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 2
  store i64 72, i64* %_ind3620
  %_ind3621 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 3
  store i64 90, i64* %_ind3621
  %_ind3622 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 4
  store i64 65, i64* %_ind3622
  %_ind3623 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 5
  store i64 65, i64* %_ind3623
  %_ind3624 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 6
  store i64 69, i64* %_ind3624
  %_ind3625 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 7
  store i64 89, i64* %_ind3625
  %_ind3626 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3617, i32 0, i32 1, i32 8
  store i64 67, i64* %_ind3626
  store { i64, [0 x i64] }* %_array3617, { i64, [0 x i64] }** %_arr3627
  store i64 9, i64* %_len3628
  %_arr3629 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3627
  %_result3630 = call i8* @string_of_array({ i64, [0 x i64] }* %_arr3629)
  call void @print_string(i8* %_result3630)
  %_str3633 = getelementptr [2 x i8], [2 x i8]* @_str_arr3632, i32 0, i32 0
  call void @print_string(i8* %_str3633)
  %_len3635 = load i64, i64* %_len3628
  %_arr3636 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr3627
  %_result3637 = call { i64, [0 x i64] }* @count_sort({ i64, [0 x i64] }* %_arr3636, i64 %_len3635)
  store { i64, [0 x i64] }* %_result3637, { i64, [0 x i64] }** %_sorted3638
  %_sorted3639 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_sorted3638
  %_result3640 = call i8* @string_of_array({ i64, [0 x i64] }* %_sorted3639)
  call void @print_string(i8* %_result3640)
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
