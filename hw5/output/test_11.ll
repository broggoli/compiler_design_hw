; generated from: oatprograms/msort2.oat
target triple = "x86_64-unknown-linux"
@_str_arr2885 = global [2 x i8] c" \00"
@_str_arr2891 = global [2 x i8] c" \00"

define i64 @program(i64 %_argc2864, { i64, [0 x i8*] }* %_argv2862) {
  %_argc2865 = alloca i64
  %_argv2863 = alloca { i64, [0 x i8*] }*
  %_a2878 = alloca { i64, [0 x i64] }*
  %_i2879 = alloca i64
  store i64 %_argc2864, i64* %_argc2865
  store { i64, [0 x i8*] }* %_argv2862, { i64, [0 x i8*] }** %_argv2863
  %_raw_array2866 = call i64* @oat_alloc_array(i64 10)
  %_array2867 = bitcast i64* %_raw_array2866 to { i64, [0 x i64] }*
  %_ind2868 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 0
  store i64 126, i64* %_ind2868
  %_ind2869 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 1
  store i64 125, i64* %_ind2869
  %_ind2870 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 2
  store i64 124, i64* %_ind2870
  %_ind2871 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 3
  store i64 123, i64* %_ind2871
  %_ind2872 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 4
  store i64 122, i64* %_ind2872
  %_ind2873 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 5
  store i64 121, i64* %_ind2873
  %_ind2874 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 6
  store i64 120, i64* %_ind2874
  %_ind2875 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 7
  store i64 119, i64* %_ind2875
  %_ind2876 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 8
  store i64 118, i64* %_ind2876
  %_ind2877 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2867, i32 0, i32 1, i32 9
  store i64 117, i64* %_ind2877
  store { i64, [0 x i64] }* %_array2867, { i64, [0 x i64] }** %_a2878
  store i64 0, i64* %_i2879
  %_a2880 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2878
  %_result2881 = call i8* @string_of_array({ i64, [0 x i64] }* %_a2880)
  call void @print_string(i8* %_result2881)
  %_a2883 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2878
  call void @oat_mergesort({ i64, [0 x i64] }* %_a2883, i64 0, i64 9)
  %_str2886 = getelementptr [2 x i8], [2 x i8]* @_str_arr2885, i32 0, i32 0
  call void @print_string(i8* %_str2886)
  %_a2888 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2878
  %_result2889 = call i8* @string_of_array({ i64, [0 x i64] }* %_a2888)
  call void @print_string(i8* %_result2889)
  %_str2892 = getelementptr [2 x i8], [2 x i8]* @_str_arr2891, i32 0, i32 0
  call void @print_string(i8* %_str2892)
  %_i2894 = load i64, i64* %_i2879
  ret i64 %_i2894
}

define void @oat_mergesort({ i64, [0 x i64] }* %_a2835, i64 %_low2833, i64 %_high2831) {
  %_a2836 = alloca { i64, [0 x i64] }*
  %_low2834 = alloca i64
  %_high2832 = alloca i64
  %_mid2837 = alloca i64
  store { i64, [0 x i64] }* %_a2835, { i64, [0 x i64] }** %_a2836
  store i64 %_low2833, i64* %_low2834
  store i64 %_high2831, i64* %_high2832
  store i64 0, i64* %_mid2837
  %_low2838 = load i64, i64* %_low2834
  %_high2839 = load i64, i64* %_high2832
  %_bop2840 = icmp slt i64 %_low2838, %_high2839
  br i1 %_bop2840, label %_then2861, label %_else2860
_then2861:
  %_low2841 = load i64, i64* %_low2834
  %_high2842 = load i64, i64* %_high2832
  %_bop2843 = add i64 %_low2841, %_high2842
  %_bop2844 = lshr i64 %_bop2843, 1
  store i64 %_bop2844, i64* %_mid2837
  %_mid2845 = load i64, i64* %_mid2837
  %_low2846 = load i64, i64* %_low2834
  %_a2847 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2836
  call void @oat_mergesort({ i64, [0 x i64] }* %_a2847, i64 %_low2846, i64 %_mid2845)
  %_high2849 = load i64, i64* %_high2832
  %_mid2850 = load i64, i64* %_mid2837
  %_bop2851 = add i64 %_mid2850, 1
  %_a2852 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2836
  call void @oat_mergesort({ i64, [0 x i64] }* %_a2852, i64 %_bop2851, i64 %_high2849)
  %_mid2854 = load i64, i64* %_mid2837
  %_high2855 = load i64, i64* %_high2832
  %_low2856 = load i64, i64* %_low2834
  %_a2857 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2836
  call void @merge({ i64, [0 x i64] }* %_a2857, i64 %_low2856, i64 %_high2855, i64 %_mid2854)
  br label %_merge2859
_else2860:
  br label %_merge2859
_merge2859:
  ret void
}

define void @merge({ i64, [0 x i64] }* %_a2700, i64 %_low2698, i64 %_high2696, i64 %_mid2694) {
  %_a2701 = alloca { i64, [0 x i64] }*
  %_low2699 = alloca i64
  %_high2697 = alloca i64
  %_mid2695 = alloca i64
  %_i2702 = alloca i64
  %_j2703 = alloca i64
  %_k2704 = alloca i64
  %_i22708 = alloca i64
  %_c2720 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_a2700, { i64, [0 x i64] }** %_a2701
  store i64 %_low2698, i64* %_low2699
  store i64 %_high2696, i64* %_high2697
  store i64 %_mid2694, i64* %_mid2695
  store i64 0, i64* %_i2702
  store i64 0, i64* %_j2703
  store i64 0, i64* %_k2704
  %_raw_array2705 = call i64* @oat_alloc_array(i64 50)
  %_array2706 = bitcast i64* %_raw_array2705 to { i64, [0 x i64] }*
  store i64 50, i64* %_i22708
  br label %_cond2713
_cond2713:
  %_i22709 = load i64, i64* %_i22708
  %_bop2710 = icmp slt i64 %_i22709, 50
  br i1 %_bop2710, label %_body2712, label %_post2711
_body2712:
  %__tmp_array_sym27072714 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array2706
  %_i22715 = load i64, i64* %_i22708
  %_index_ptr2717 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym27072714, i32 0, i32 1, i64 %_i22715
  store i64 0, i64* %_index_ptr2717
  %_i22718 = load i64, i64* %_i22708
  %_bop2719 = add i64 %_i22718, 1
  store i64 %_bop2719, i64* %_i22708
  br label %_cond2713
_post2711:
  store { i64, [0 x i64] }* %_array2706, { i64, [0 x i64] }** %_c2720
  %_low2721 = load i64, i64* %_low2699
  store i64 %_low2721, i64* %_i2702
  %_mid2722 = load i64, i64* %_mid2695
  %_bop2723 = add i64 %_mid2722, 1
  store i64 %_bop2723, i64* %_j2703
  %_low2724 = load i64, i64* %_low2699
  store i64 %_low2724, i64* %_k2704
  br label %_cond2734
_cond2734:
  %_i2725 = load i64, i64* %_i2702
  %_mid2726 = load i64, i64* %_mid2695
  %_bop2727 = icmp sle i64 %_i2725, %_mid2726
  %_j2728 = load i64, i64* %_j2703
  %_high2729 = load i64, i64* %_high2697
  %_bop2730 = icmp sle i64 %_j2728, %_high2729
  %_bop2731 = and i1 %_bop2727, %_bop2730
  br i1 %_bop2731, label %_body2733, label %_post2732
_body2733:
  %_a2735 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2701
  %_i2736 = load i64, i64* %_i2702
  %_index_ptr2738 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2735, i32 0, i32 1, i64 %_i2736
  %_index2739 = load i64, i64* %_index_ptr2738
  %_a2740 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2701
  %_j2741 = load i64, i64* %_j2703
  %_index_ptr2743 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2740, i32 0, i32 1, i64 %_j2741
  %_index2744 = load i64, i64* %_index_ptr2743
  %_bop2745 = icmp slt i64 %_index2739, %_index2744
  br i1 %_bop2745, label %_then2774, label %_else2773
_then2774:
  %_c2746 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2720
  %_k2747 = load i64, i64* %_k2704
  %_index_ptr2749 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2746, i32 0, i32 1, i64 %_k2747
  %_a2750 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2701
  %_i2751 = load i64, i64* %_i2702
  %_index_ptr2753 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2750, i32 0, i32 1, i64 %_i2751
  %_index2754 = load i64, i64* %_index_ptr2753
  store i64 %_index2754, i64* %_index_ptr2749
  %_k2755 = load i64, i64* %_k2704
  %_bop2756 = add i64 %_k2755, 1
  store i64 %_bop2756, i64* %_k2704
  %_i2757 = load i64, i64* %_i2702
  %_bop2758 = add i64 %_i2757, 1
  store i64 %_bop2758, i64* %_i2702
  br label %_merge2772
_else2773:
  %_c2759 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2720
  %_k2760 = load i64, i64* %_k2704
  %_index_ptr2762 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2759, i32 0, i32 1, i64 %_k2760
  %_a2763 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2701
  %_j2764 = load i64, i64* %_j2703
  %_index_ptr2766 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2763, i32 0, i32 1, i64 %_j2764
  %_index2767 = load i64, i64* %_index_ptr2766
  store i64 %_index2767, i64* %_index_ptr2762
  %_k2768 = load i64, i64* %_k2704
  %_bop2769 = add i64 %_k2768, 1
  store i64 %_bop2769, i64* %_k2704
  %_j2770 = load i64, i64* %_j2703
  %_bop2771 = add i64 %_j2770, 1
  store i64 %_bop2771, i64* %_j2703
  br label %_merge2772
_merge2772:
  br label %_cond2734
_post2732:
  br label %_cond2780
_cond2780:
  %_i2775 = load i64, i64* %_i2702
  %_mid2776 = load i64, i64* %_mid2695
  %_bop2777 = icmp sle i64 %_i2775, %_mid2776
  br i1 %_bop2777, label %_body2779, label %_post2778
_body2779:
  %_c2781 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2720
  %_k2782 = load i64, i64* %_k2704
  %_index_ptr2784 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2781, i32 0, i32 1, i64 %_k2782
  %_a2785 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2701
  %_i2786 = load i64, i64* %_i2702
  %_index_ptr2788 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2785, i32 0, i32 1, i64 %_i2786
  %_index2789 = load i64, i64* %_index_ptr2788
  store i64 %_index2789, i64* %_index_ptr2784
  %_k2790 = load i64, i64* %_k2704
  %_bop2791 = add i64 %_k2790, 1
  store i64 %_bop2791, i64* %_k2704
  %_i2792 = load i64, i64* %_i2702
  %_bop2793 = add i64 %_i2792, 1
  store i64 %_bop2793, i64* %_i2702
  br label %_cond2780
_post2778:
  br label %_cond2799
_cond2799:
  %_j2794 = load i64, i64* %_j2703
  %_high2795 = load i64, i64* %_high2697
  %_bop2796 = icmp sle i64 %_j2794, %_high2795
  br i1 %_bop2796, label %_body2798, label %_post2797
_body2798:
  %_c2800 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2720
  %_k2801 = load i64, i64* %_k2704
  %_index_ptr2803 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2800, i32 0, i32 1, i64 %_k2801
  %_a2804 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2701
  %_j2805 = load i64, i64* %_j2703
  %_index_ptr2807 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2804, i32 0, i32 1, i64 %_j2805
  %_index2808 = load i64, i64* %_index_ptr2807
  store i64 %_index2808, i64* %_index_ptr2803
  %_k2809 = load i64, i64* %_k2704
  %_bop2810 = add i64 %_k2809, 1
  store i64 %_bop2810, i64* %_k2704
  %_j2811 = load i64, i64* %_j2703
  %_bop2812 = add i64 %_j2811, 1
  store i64 %_bop2812, i64* %_j2703
  br label %_cond2799
_post2797:
  %_low2813 = load i64, i64* %_low2699
  store i64 %_low2813, i64* %_i2702
  br label %_cond2819
_cond2819:
  %_i2814 = load i64, i64* %_i2702
  %_k2815 = load i64, i64* %_k2704
  %_bop2816 = icmp slt i64 %_i2814, %_k2815
  br i1 %_bop2816, label %_body2818, label %_post2817
_body2818:
  %_a2820 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2701
  %_i2821 = load i64, i64* %_i2702
  %_index_ptr2823 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a2820, i32 0, i32 1, i64 %_i2821
  %_c2824 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c2720
  %_i2825 = load i64, i64* %_i2702
  %_index_ptr2827 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_c2824, i32 0, i32 1, i64 %_i2825
  %_index2828 = load i64, i64* %_index_ptr2827
  store i64 %_index2828, i64* %_index_ptr2823
  %_i2829 = load i64, i64* %_i2702
  %_bop2830 = add i64 %_i2829, 1
  store i64 %_bop2830, i64* %_i2702
  br label %_cond2819
_post2817:
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
