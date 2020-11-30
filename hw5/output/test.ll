; generated from: oatprograms/run42.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %_argc808, { i64, [0 x i8*] }* %_argv806) {
  %_argc809 = alloca i64
  %_argv807 = alloca { i64, [0 x i8*] }*
  %_i818 = alloca i64
  %_j829 = alloca i64
  %_a1836 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i845 = alloca i64
  %_j856 = alloca i64
  %_a2863 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i872 = alloca i64
  %_j883 = alloca i64
  %_a3890 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i899 = alloca i64
  %_j910 = alloca i64
  %_a4917 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i926 = alloca i64
  %_a5932 = alloca { i64, [0 x i64] }*
  store i64 %_argc808, i64* %_argc809
  store { i64, [0 x i8*] }* %_argv806, { i64, [0 x i8*] }** %_argv807
  %_raw_array810 = call i64* @oat_alloc_array(i64 3)
  %_array811 = bitcast i64* %_raw_array810 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i818
  br label %_cond814
_cond814:
  %_i819 = load i64, i64* %_i818
  %_bop820 = icmp slt i64 %_i819, 3
  br i1 %_bop820, label %_body813, label %_post812
_body813:
  %_local_id817 = load i64, i64* %_i818
  %_index_ptr816 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array811, i32 0, i32 1, i64 %_local_id817
  %_raw_array821 = call i64* @oat_alloc_array(i64 1)
  %_array822 = bitcast i64* %_raw_array821 to { i64, [0 x i64] }*
  store i64 0, i64* %_j829
  br label %_cond825
_cond825:
  %_j830 = load i64, i64* %_j829
  %_bop831 = icmp slt i64 %_j830, 1
  br i1 %_bop831, label %_body824, label %_post823
_body824:
  %_local_id828 = load i64, i64* %_j829
  %_index_ptr827 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array822, i32 0, i32 1, i64 %_local_id828
  store i64 0, i64* %_index_ptr827
  %_bop826 = add i64 %_local_id828, 1
  store i64 %_bop826, i64* %_j829
  br label %_cond825
_post823:
  store { i64, [0 x i64] }* %_array822, { i64, [0 x i64] }** %_index_ptr816
  %_bop815 = add i64 %_local_id817, 1
  store i64 %_bop815, i64* %_i818
  br label %_cond814
_post812:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array811, { i64, [0 x { i64, [0 x i64] }*] }** %_a1836
  %_raw_array837 = call i64* @oat_alloc_array(i64 3)
  %_array838 = bitcast i64* %_raw_array837 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i845
  br label %_cond841
_cond841:
  %_i846 = load i64, i64* %_i845
  %_bop847 = icmp slt i64 %_i846, 3
  br i1 %_bop847, label %_body840, label %_post839
_body840:
  %_local_id844 = load i64, i64* %_i845
  %_index_ptr843 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array838, i32 0, i32 1, i64 %_local_id844
  %_raw_array848 = call i64* @oat_alloc_array(i64 1)
  %_array849 = bitcast i64* %_raw_array848 to { i64, [0 x i64] }*
  store i64 0, i64* %_j856
  br label %_cond852
_cond852:
  %_j857 = load i64, i64* %_j856
  %_bop858 = icmp slt i64 %_j857, 1
  br i1 %_bop858, label %_body851, label %_post850
_body851:
  %_local_id855 = load i64, i64* %_j856
  %_index_ptr854 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array849, i32 0, i32 1, i64 %_local_id855
  store i64 0, i64* %_index_ptr854
  %_bop853 = add i64 %_local_id855, 1
  store i64 %_bop853, i64* %_j856
  br label %_cond852
_post850:
  store { i64, [0 x i64] }* %_array849, { i64, [0 x i64] }** %_index_ptr843
  %_bop842 = add i64 %_local_id844, 1
  store i64 %_bop842, i64* %_i845
  br label %_cond841
_post839:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array838, { i64, [0 x { i64, [0 x i64] }*] }** %_a2863
  %_raw_array864 = call i64* @oat_alloc_array(i64 3)
  %_array865 = bitcast i64* %_raw_array864 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i872
  br label %_cond868
_cond868:
  %_i873 = load i64, i64* %_i872
  %_bop874 = icmp slt i64 %_i873, 3
  br i1 %_bop874, label %_body867, label %_post866
_body867:
  %_local_id871 = load i64, i64* %_i872
  %_index_ptr870 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array865, i32 0, i32 1, i64 %_local_id871
  %_raw_array875 = call i64* @oat_alloc_array(i64 1)
  %_array876 = bitcast i64* %_raw_array875 to { i64, [0 x i64] }*
  store i64 0, i64* %_j883
  br label %_cond879
_cond879:
  %_j884 = load i64, i64* %_j883
  %_bop885 = icmp slt i64 %_j884, 1
  br i1 %_bop885, label %_body878, label %_post877
_body878:
  %_local_id882 = load i64, i64* %_j883
  %_index_ptr881 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array876, i32 0, i32 1, i64 %_local_id882
  store i64 0, i64* %_index_ptr881
  %_bop880 = add i64 %_local_id882, 1
  store i64 %_bop880, i64* %_j883
  br label %_cond879
_post877:
  store { i64, [0 x i64] }* %_array876, { i64, [0 x i64] }** %_index_ptr870
  %_bop869 = add i64 %_local_id871, 1
  store i64 %_bop869, i64* %_i872
  br label %_cond868
_post866:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array865, { i64, [0 x { i64, [0 x i64] }*] }** %_a3890
  %_raw_array891 = call i64* @oat_alloc_array(i64 3)
  %_array892 = bitcast i64* %_raw_array891 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i899
  br label %_cond895
_cond895:
  %_i900 = load i64, i64* %_i899
  %_bop901 = icmp slt i64 %_i900, 3
  br i1 %_bop901, label %_body894, label %_post893
_body894:
  %_local_id898 = load i64, i64* %_i899
  %_index_ptr897 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array892, i32 0, i32 1, i64 %_local_id898
  %_raw_array902 = call i64* @oat_alloc_array(i64 1)
  %_array903 = bitcast i64* %_raw_array902 to { i64, [0 x i64] }*
  store i64 0, i64* %_j910
  br label %_cond906
_cond906:
  %_j911 = load i64, i64* %_j910
  %_bop912 = icmp slt i64 %_j911, 1
  br i1 %_bop912, label %_body905, label %_post904
_body905:
  %_local_id909 = load i64, i64* %_j910
  %_index_ptr908 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array903, i32 0, i32 1, i64 %_local_id909
  store i64 0, i64* %_index_ptr908
  %_bop907 = add i64 %_local_id909, 1
  store i64 %_bop907, i64* %_j910
  br label %_cond906
_post904:
  store { i64, [0 x i64] }* %_array903, { i64, [0 x i64] }** %_index_ptr897
  %_bop896 = add i64 %_local_id898, 1
  store i64 %_bop896, i64* %_i899
  br label %_cond895
_post893:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array892, { i64, [0 x { i64, [0 x i64] }*] }** %_a4917
  %_raw_array918 = call i64* @oat_alloc_array(i64 3)
  %_array919 = bitcast i64* %_raw_array918 to { i64, [0 x i64] }*
  store i64 0, i64* %_i926
  br label %_cond922
_cond922:
  %_i927 = load i64, i64* %_i926
  %_bop928 = icmp slt i64 %_i927, 3
  br i1 %_bop928, label %_body921, label %_post920
_body921:
  %_local_id925 = load i64, i64* %_i926
  %_index_ptr924 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array919, i32 0, i32 1, i64 %_local_id925
  %_i929 = load i64, i64* %_i926
  store i64 %_i929, i64* %_index_ptr924
  %_bop923 = add i64 %_local_id925, 1
  store i64 %_bop923, i64* %_i926
  br label %_cond922
_post920:
  store { i64, [0 x i64] }* %_array919, { i64, [0 x i64] }** %_a5932
  %_a2933 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2863
  %_cast934 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_a2933 to i64*
  call void @oat_assert_array_length(i64* %_cast934, i64 0)
  %_index_ptr936 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a2933, i32 0, i32 1, i32 0
  %_a5937 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a5932
  store { i64, [0 x i64] }* %_a5937, { i64, [0 x i64] }** %_index_ptr936
  %_a2938 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2863
  %_cast939 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_a2938 to i64*
  call void @oat_assert_array_length(i64* %_cast939, i64 0)
  %_index_ptr941 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a2938, i32 0, i32 1, i32 0
  %_index942 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr941
  %_cast943 = bitcast { i64, [0 x i64] }* %_index942 to i64*
  call void @oat_assert_array_length(i64* %_cast943, i64 0)
  %_index_ptr945 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index942, i32 0, i32 1, i32 0
  store i64 2, i64* %_index_ptr945
  %_a2946 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2863
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a2946, { i64, [0 x { i64, [0 x i64] }*] }** %_a1836
  %_a1947 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1836
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a1947, { i64, [0 x { i64, [0 x i64] }*] }** %_a3890
  %_a4948 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a4917
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a4948, { i64, [0 x { i64, [0 x i64] }*] }** %_a1836
  %_a3949 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a3890
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a3949, { i64, [0 x { i64, [0 x i64] }*] }** %_a2863
  %_a2950 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2863
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a2950, { i64, [0 x { i64, [0 x i64] }*] }** %_a4917
  %_a4951 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a4917
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a4951, { i64, [0 x { i64, [0 x i64] }*] }** %_a3890
  %_a3952 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a3890
  %_cast953 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_a3952 to i64*
  call void @oat_assert_array_length(i64* %_cast953, i64 0)
  %_index_ptr955 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a3952, i32 0, i32 1, i32 0
  %_index956 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr955
  %_cast957 = bitcast { i64, [0 x i64] }* %_index956 to i64*
  call void @oat_assert_array_length(i64* %_cast957, i64 0)
  %_index_ptr959 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index956, i32 0, i32 1, i32 0
  %_index960 = load i64, i64* %_index_ptr959
  ret i64 %_index960
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
