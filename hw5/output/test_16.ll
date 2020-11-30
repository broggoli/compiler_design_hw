; generated from: oatprograms/determinant_size2.oat
target triple = "x86_64-unknown-linux"
define i64 @compute_determinant({ i64, [0 x { i64, [0 x i64] }*] }* %_matrix3865, i64 %_n3863) {
  %_matrix3866 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_n3864 = alloca i64
  %_sum3867 = alloca i64
  %_multiplier3869 = alloca i64
  %_k3879 = alloca i64
  %_len3888 = alloca i64
  %_i3894 = alloca i64
  %_j3910 = alloca i64
  %_b3925 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_l3926 = alloca i64
  %_m3933 = alloca i64
  %_o3964 = alloca i64
  %_p3972 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %_matrix3865, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix3866
  store i64 %_n3863, i64* %_n3864
  store i64 0, i64* %_sum3867
  %_unop3868 = sub i64 0, 1
  store i64 %_unop3868, i64* %_multiplier3869
  %_n3870 = load i64, i64* %_n3864
  %_bop3871 = icmp eq i64 %_n3870, 1
  br i1 %_bop3871, label %_then4027, label %_else4026
_then4027:
  %_matrix3872 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix3866
  %_index_ptr3874 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_matrix3872, i32 0, i32 1, i32 0
  %_index3875 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3874
  %_index_ptr3877 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index3875, i32 0, i32 1, i32 0
  %_index3878 = load i64, i64* %_index_ptr3877
  store i64 %_index3878, i64* %_sum3867
  br label %_merge4025
_else4026:
  store i64 0, i64* %_k3879
  br label %_cond3885
_cond3885:
  %_k3880 = load i64, i64* %_k3879
  %_n3881 = load i64, i64* %_n3864
  %_bop3882 = icmp slt i64 %_k3880, %_n3881
  br i1 %_bop3882, label %_body3884, label %_post3883
_body3884:
  %_n3886 = load i64, i64* %_n3864
  %_bop3887 = sub i64 %_n3886, 1
  store i64 %_bop3887, i64* %_len3888
  %_len3889 = load i64, i64* %_len3888
  %_raw_array3890 = call i64* @oat_alloc_array(i64 %_len3889)
  %_array3891 = bitcast i64* %_raw_array3890 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_len3893 = load i64, i64* %_len3888
  store i64 %_len3893, i64* %_i3894
  br label %_cond3900
_cond3900:
  %_i3895 = load i64, i64* %_i3894
  %_len3896 = load i64, i64* %_len3888
  %_bop3897 = icmp slt i64 %_i3895, %_len3896
  br i1 %_bop3897, label %_body3899, label %_post3898
_body3899:
  %__tmp_array_sym38923901 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array3891
  %_i3902 = load i64, i64* %_i3894
  %_index_ptr3904 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym38923901, i32 0, i32 1, i64 %_i3902
  %_len3905 = load i64, i64* %_len3888
  %_raw_array3906 = call i64* @oat_alloc_array(i64 %_len3905)
  %_array3907 = bitcast i64* %_raw_array3906 to { i64, [0 x i64] }*
  %_len3909 = load i64, i64* %_len3888
  store i64 %_len3909, i64* %_j3910
  br label %_cond3916
_cond3916:
  %_j3911 = load i64, i64* %_j3910
  %_len3912 = load i64, i64* %_len3888
  %_bop3913 = icmp slt i64 %_j3911, %_len3912
  br i1 %_bop3913, label %_body3915, label %_post3914
_body3915:
  %__tmp_array_sym39083917 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array3907
  %_j3918 = load i64, i64* %_j3910
  %_index_ptr3920 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym39083917, i32 0, i32 1, i64 %_j3918
  store i64 1, i64* %_index_ptr3920
  %_j3921 = load i64, i64* %_j3910
  %_bop3922 = add i64 %_j3921, 1
  store i64 %_bop3922, i64* %_j3910
  br label %_cond3916
_post3914:
  store { i64, [0 x i64] }* %_array3907, { i64, [0 x i64] }** %_index_ptr3904
  %_i3923 = load i64, i64* %_i3894
  %_bop3924 = add i64 %_i3923, 1
  store i64 %_bop3924, i64* %_i3894
  br label %_cond3900
_post3898:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array3891, { i64, [0 x { i64, [0 x i64] }*] }** %_b3925
  store i64 0, i64* %_l3926
  br label %_cond3932
_cond3932:
  %_l3927 = load i64, i64* %_l3926
  %_k3928 = load i64, i64* %_k3879
  %_bop3929 = icmp slt i64 %_l3927, %_k3928
  br i1 %_bop3929, label %_body3931, label %_post3930
_body3931:
  store i64 0, i64* %_m3933
  br label %_cond3940
_cond3940:
  %_m3934 = load i64, i64* %_m3933
  %_n3935 = load i64, i64* %_n3864
  %_bop3936 = sub i64 %_n3935, 1
  %_bop3937 = icmp slt i64 %_m3934, %_bop3936
  br i1 %_bop3937, label %_body3939, label %_post3938
_body3939:
  %_b3941 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b3925
  %_m3942 = load i64, i64* %_m3933
  %_index_ptr3944 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_b3941, i32 0, i32 1, i64 %_m3942
  %_index3945 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3944
  %_l3946 = load i64, i64* %_l3926
  %_index_ptr3948 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index3945, i32 0, i32 1, i64 %_l3946
  %_matrix3949 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix3866
  %_m3950 = load i64, i64* %_m3933
  %_bop3951 = add i64 %_m3950, 1
  %_index_ptr3953 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_matrix3949, i32 0, i32 1, i64 %_bop3951
  %_index3954 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3953
  %_l3955 = load i64, i64* %_l3926
  %_index_ptr3957 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index3954, i32 0, i32 1, i64 %_l3955
  %_index3958 = load i64, i64* %_index_ptr3957
  store i64 %_index3958, i64* %_index_ptr3948
  %_m3959 = load i64, i64* %_m3933
  %_bop3960 = add i64 %_m3959, 1
  store i64 %_bop3960, i64* %_m3933
  br label %_cond3940
_post3938:
  %_l3961 = load i64, i64* %_l3926
  %_bop3962 = add i64 %_l3961, 1
  store i64 %_bop3962, i64* %_l3926
  br label %_cond3932
_post3930:
  %_k3963 = load i64, i64* %_k3879
  store i64 %_k3963, i64* %_o3964
  br label %_cond3971
_cond3971:
  %_o3965 = load i64, i64* %_o3964
  %_n3966 = load i64, i64* %_n3864
  %_bop3967 = sub i64 %_n3966, 1
  %_bop3968 = icmp slt i64 %_o3965, %_bop3967
  br i1 %_bop3968, label %_body3970, label %_post3969
_body3970:
  store i64 0, i64* %_p3972
  br label %_cond3979
_cond3979:
  %_p3973 = load i64, i64* %_p3972
  %_n3974 = load i64, i64* %_n3864
  %_bop3975 = sub i64 %_n3974, 1
  %_bop3976 = icmp slt i64 %_p3973, %_bop3975
  br i1 %_bop3976, label %_body3978, label %_post3977
_body3978:
  %_b3980 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b3925
  %_p3981 = load i64, i64* %_p3972
  %_index_ptr3983 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_b3980, i32 0, i32 1, i64 %_p3981
  %_index3984 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3983
  %_o3985 = load i64, i64* %_o3964
  %_index_ptr3987 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index3984, i32 0, i32 1, i64 %_o3985
  %_matrix3988 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix3866
  %_p3989 = load i64, i64* %_p3972
  %_bop3990 = add i64 %_p3989, 1
  %_index_ptr3992 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_matrix3988, i32 0, i32 1, i64 %_bop3990
  %_index3993 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3992
  %_o3994 = load i64, i64* %_o3964
  %_bop3995 = add i64 %_o3994, 1
  %_index_ptr3997 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index3993, i32 0, i32 1, i64 %_bop3995
  %_index3998 = load i64, i64* %_index_ptr3997
  store i64 %_index3998, i64* %_index_ptr3987
  %_p3999 = load i64, i64* %_p3972
  %_bop4000 = add i64 %_p3999, 1
  store i64 %_bop4000, i64* %_p3972
  br label %_cond3979
_post3977:
  %_o4001 = load i64, i64* %_o3964
  %_bop4002 = add i64 %_o4001, 1
  store i64 %_bop4002, i64* %_o3964
  br label %_cond3971
_post3969:
  %_multiplier4003 = load i64, i64* %_multiplier3869
  %_unop4004 = sub i64 0, 1
  %_bop4005 = mul i64 %_multiplier4003, %_unop4004
  store i64 %_bop4005, i64* %_multiplier3869
  %_sum4006 = load i64, i64* %_sum3867
  %_multiplier4007 = load i64, i64* %_multiplier3869
  %_matrix4008 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix3866
  %_index_ptr4010 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4008, i32 0, i32 1, i32 0
  %_index4011 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4010
  %_k4012 = load i64, i64* %_k3879
  %_index_ptr4014 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4011, i32 0, i32 1, i64 %_k4012
  %_index4015 = load i64, i64* %_index_ptr4014
  %_bop4016 = mul i64 %_multiplier4007, %_index4015
  %_n4017 = load i64, i64* %_n3864
  %_bop4018 = sub i64 %_n4017, 1
  %_b4019 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b3925
  %_result4020 = call i64 @compute_determinant({ i64, [0 x { i64, [0 x i64] }*] }* %_b4019, i64 %_bop4018)
  %_bop4021 = mul i64 %_bop4016, %_result4020
  %_bop4022 = add i64 %_sum4006, %_bop4021
  store i64 %_bop4022, i64* %_sum3867
  %_k4023 = load i64, i64* %_k3879
  %_bop4024 = add i64 %_k4023, 1
  store i64 %_bop4024, i64* %_k3879
  br label %_cond3885
_post3883:
  br label %_merge4025
_merge4025:
  %_sum4028 = load i64, i64* %_sum3867
  ret i64 %_sum4028
}

define i64 @program(i64 %_argc3846, { i64, [0 x i8*] }* %_argv3844) {
  %_argc3847 = alloca i64
  %_argv3845 = alloca { i64, [0 x i8*] }*
  %_matrix3860 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %_argc3846, i64* %_argc3847
  store { i64, [0 x i8*] }* %_argv3844, { i64, [0 x i8*] }** %_argv3845
  %_raw_array3848 = call i64* @oat_alloc_array(i64 2)
  %_array3849 = bitcast i64* %_raw_array3848 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array3850 = call i64* @oat_alloc_array(i64 2)
  %_array3851 = bitcast i64* %_raw_array3850 to { i64, [0 x i64] }*
  %_ind3852 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3851, i32 0, i32 1, i32 0
  store i64 20, i64* %_ind3852
  %_ind3853 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3851, i32 0, i32 1, i32 1
  store i64 2, i64* %_ind3853
  %_ind3854 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array3849, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array3851, { i64, [0 x i64] }** %_ind3854
  %_raw_array3855 = call i64* @oat_alloc_array(i64 2)
  %_array3856 = bitcast i64* %_raw_array3855 to { i64, [0 x i64] }*
  %_ind3857 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3856, i32 0, i32 1, i32 0
  store i64 3, i64* %_ind3857
  %_ind3858 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3856, i32 0, i32 1, i32 1
  store i64 5, i64* %_ind3858
  %_ind3859 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array3849, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array3856, { i64, [0 x i64] }** %_ind3859
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array3849, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix3860
  %_matrix3861 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix3860
  %_result3862 = call i64 @compute_determinant({ i64, [0 x { i64, [0 x i64] }*] }* %_matrix3861, i64 2)
  ret i64 %_result3862
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
