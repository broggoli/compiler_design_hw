; generated from: oatprograms/determinant_size2.oat
target triple = "x86_64-unknown-linux"
define i64 @compute_determinant({ i64, [0 x { i64, [0 x i64] }*] }* %_matrix4023, i64 %_n4021) {
  %_matrix4024 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_n4022 = alloca i64
  %_sum4025 = alloca i64
  %_multiplier4027 = alloca i64
  %_k4039 = alloca i64
  %_len4048 = alloca i64
  %_i4058 = alloca i64
  %_j4071 = alloca i64
  %_b4079 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_l4080 = alloca i64
  %_m4087 = alloca i64
  %_o4122 = alloca i64
  %_p4130 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4023, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix4024
  store i64 %_n4021, i64* %_n4022
  store i64 0, i64* %_sum4025
  %_unop4026 = sub i64 0, 1
  store i64 %_unop4026, i64* %_multiplier4027
  %_n4028 = load i64, i64* %_n4022
  %_bop4029 = icmp eq i64 %_n4028, 1
  br i1 %_bop4029, label %_then4191, label %_else4190
_then4191:
  %_matrix4030 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix4024
  %_cast4031 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4030 to i64*
  call void @oat_assert_array_length(i64* %_cast4031, i64 0)
  %_index_ptr4033 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4030, i32 0, i32 1, i32 0
  %_index4034 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4033
  %_cast4035 = bitcast { i64, [0 x i64] }* %_index4034 to i64*
  call void @oat_assert_array_length(i64* %_cast4035, i64 0)
  %_index_ptr4037 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4034, i32 0, i32 1, i32 0
  %_index4038 = load i64, i64* %_index_ptr4037
  store i64 %_index4038, i64* %_sum4025
  br label %_merge4189
_else4190:
  store i64 0, i64* %_k4039
  br label %_cond4045
_cond4045:
  %_k4040 = load i64, i64* %_k4039
  %_n4041 = load i64, i64* %_n4022
  %_bop4042 = icmp slt i64 %_k4040, %_n4041
  br i1 %_bop4042, label %_body4044, label %_post4043
_body4044:
  %_n4046 = load i64, i64* %_n4022
  %_bop4047 = sub i64 %_n4046, 1
  store i64 %_bop4047, i64* %_len4048
  %_len4049 = load i64, i64* %_len4048
  %_raw_array4050 = call i64* @oat_alloc_array(i64 %_len4049)
  %_array4051 = bitcast i64* %_raw_array4050 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i4058
  br label %_cond4054
_cond4054:
  %_i4059 = load i64, i64* %_i4058
  %_len4060 = load i64, i64* %_len4048
  %_bop4061 = icmp slt i64 %_i4059, %_len4060
  br i1 %_bop4061, label %_body4053, label %_post4052
_body4053:
  %_local_id4057 = load i64, i64* %_i4058
  %_index_ptr4056 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4051, i32 0, i32 1, i64 %_local_id4057
  %_len4062 = load i64, i64* %_len4048
  %_raw_array4063 = call i64* @oat_alloc_array(i64 %_len4062)
  %_array4064 = bitcast i64* %_raw_array4063 to { i64, [0 x i64] }*
  store i64 0, i64* %_j4071
  br label %_cond4067
_cond4067:
  %_j4072 = load i64, i64* %_j4071
  %_len4073 = load i64, i64* %_len4048
  %_bop4074 = icmp slt i64 %_j4072, %_len4073
  br i1 %_bop4074, label %_body4066, label %_post4065
_body4066:
  %_local_id4070 = load i64, i64* %_j4071
  %_index_ptr4069 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4064, i32 0, i32 1, i64 %_local_id4070
  store i64 1, i64* %_index_ptr4069
  %_bop4068 = add i64 %_local_id4070, 1
  store i64 %_bop4068, i64* %_j4071
  br label %_cond4067
_post4065:
  store { i64, [0 x i64] }* %_array4064, { i64, [0 x i64] }** %_index_ptr4056
  %_bop4055 = add i64 %_local_id4057, 1
  store i64 %_bop4055, i64* %_i4058
  br label %_cond4054
_post4052:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4051, { i64, [0 x { i64, [0 x i64] }*] }** %_b4079
  store i64 0, i64* %_l4080
  br label %_cond4086
_cond4086:
  %_l4081 = load i64, i64* %_l4080
  %_k4082 = load i64, i64* %_k4039
  %_bop4083 = icmp slt i64 %_l4081, %_k4082
  br i1 %_bop4083, label %_body4085, label %_post4084
_body4085:
  store i64 0, i64* %_m4087
  br label %_cond4094
_cond4094:
  %_m4088 = load i64, i64* %_m4087
  %_n4089 = load i64, i64* %_n4022
  %_bop4090 = sub i64 %_n4089, 1
  %_bop4091 = icmp slt i64 %_m4088, %_bop4090
  br i1 %_bop4091, label %_body4093, label %_post4092
_body4093:
  %_b4095 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b4079
  %_m4096 = load i64, i64* %_m4087
  %_cast4097 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_b4095 to i64*
  call void @oat_assert_array_length(i64* %_cast4097, i64 %_m4096)
  %_index_ptr4099 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_b4095, i32 0, i32 1, i64 %_m4096
  %_index4100 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4099
  %_l4101 = load i64, i64* %_l4080
  %_cast4102 = bitcast { i64, [0 x i64] }* %_index4100 to i64*
  call void @oat_assert_array_length(i64* %_cast4102, i64 %_l4101)
  %_index_ptr4104 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4100, i32 0, i32 1, i64 %_l4101
  %_matrix4105 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix4024
  %_m4106 = load i64, i64* %_m4087
  %_bop4107 = add i64 %_m4106, 1
  %_cast4108 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4105 to i64*
  call void @oat_assert_array_length(i64* %_cast4108, i64 %_bop4107)
  %_index_ptr4110 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4105, i32 0, i32 1, i64 %_bop4107
  %_index4111 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4110
  %_l4112 = load i64, i64* %_l4080
  %_cast4113 = bitcast { i64, [0 x i64] }* %_index4111 to i64*
  call void @oat_assert_array_length(i64* %_cast4113, i64 %_l4112)
  %_index_ptr4115 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4111, i32 0, i32 1, i64 %_l4112
  %_index4116 = load i64, i64* %_index_ptr4115
  store i64 %_index4116, i64* %_index_ptr4104
  %_m4117 = load i64, i64* %_m4087
  %_bop4118 = add i64 %_m4117, 1
  store i64 %_bop4118, i64* %_m4087
  br label %_cond4094
_post4092:
  %_l4119 = load i64, i64* %_l4080
  %_bop4120 = add i64 %_l4119, 1
  store i64 %_bop4120, i64* %_l4080
  br label %_cond4086
_post4084:
  %_k4121 = load i64, i64* %_k4039
  store i64 %_k4121, i64* %_o4122
  br label %_cond4129
_cond4129:
  %_o4123 = load i64, i64* %_o4122
  %_n4124 = load i64, i64* %_n4022
  %_bop4125 = sub i64 %_n4124, 1
  %_bop4126 = icmp slt i64 %_o4123, %_bop4125
  br i1 %_bop4126, label %_body4128, label %_post4127
_body4128:
  store i64 0, i64* %_p4130
  br label %_cond4137
_cond4137:
  %_p4131 = load i64, i64* %_p4130
  %_n4132 = load i64, i64* %_n4022
  %_bop4133 = sub i64 %_n4132, 1
  %_bop4134 = icmp slt i64 %_p4131, %_bop4133
  br i1 %_bop4134, label %_body4136, label %_post4135
_body4136:
  %_b4138 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b4079
  %_p4139 = load i64, i64* %_p4130
  %_cast4140 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_b4138 to i64*
  call void @oat_assert_array_length(i64* %_cast4140, i64 %_p4139)
  %_index_ptr4142 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_b4138, i32 0, i32 1, i64 %_p4139
  %_index4143 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4142
  %_o4144 = load i64, i64* %_o4122
  %_cast4145 = bitcast { i64, [0 x i64] }* %_index4143 to i64*
  call void @oat_assert_array_length(i64* %_cast4145, i64 %_o4144)
  %_index_ptr4147 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4143, i32 0, i32 1, i64 %_o4144
  %_matrix4148 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix4024
  %_p4149 = load i64, i64* %_p4130
  %_bop4150 = add i64 %_p4149, 1
  %_cast4151 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4148 to i64*
  call void @oat_assert_array_length(i64* %_cast4151, i64 %_bop4150)
  %_index_ptr4153 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4148, i32 0, i32 1, i64 %_bop4150
  %_index4154 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4153
  %_o4155 = load i64, i64* %_o4122
  %_bop4156 = add i64 %_o4155, 1
  %_cast4157 = bitcast { i64, [0 x i64] }* %_index4154 to i64*
  call void @oat_assert_array_length(i64* %_cast4157, i64 %_bop4156)
  %_index_ptr4159 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4154, i32 0, i32 1, i64 %_bop4156
  %_index4160 = load i64, i64* %_index_ptr4159
  store i64 %_index4160, i64* %_index_ptr4147
  %_p4161 = load i64, i64* %_p4130
  %_bop4162 = add i64 %_p4161, 1
  store i64 %_bop4162, i64* %_p4130
  br label %_cond4137
_post4135:
  %_o4163 = load i64, i64* %_o4122
  %_bop4164 = add i64 %_o4163, 1
  store i64 %_bop4164, i64* %_o4122
  br label %_cond4129
_post4127:
  %_multiplier4165 = load i64, i64* %_multiplier4027
  %_unop4166 = sub i64 0, 1
  %_bop4167 = mul i64 %_multiplier4165, %_unop4166
  store i64 %_bop4167, i64* %_multiplier4027
  %_sum4168 = load i64, i64* %_sum4025
  %_multiplier4169 = load i64, i64* %_multiplier4027
  %_matrix4170 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix4024
  %_cast4171 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4170 to i64*
  call void @oat_assert_array_length(i64* %_cast4171, i64 0)
  %_index_ptr4173 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_matrix4170, i32 0, i32 1, i32 0
  %_index4174 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4173
  %_k4175 = load i64, i64* %_k4039
  %_cast4176 = bitcast { i64, [0 x i64] }* %_index4174 to i64*
  call void @oat_assert_array_length(i64* %_cast4176, i64 %_k4175)
  %_index_ptr4178 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4174, i32 0, i32 1, i64 %_k4175
  %_index4179 = load i64, i64* %_index_ptr4178
  %_bop4180 = mul i64 %_multiplier4169, %_index4179
  %_n4181 = load i64, i64* %_n4022
  %_bop4182 = sub i64 %_n4181, 1
  %_b4183 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b4079
  %_result4184 = call i64 @compute_determinant({ i64, [0 x { i64, [0 x i64] }*] }* %_b4183, i64 %_bop4182)
  %_bop4185 = mul i64 %_bop4180, %_result4184
  %_bop4186 = add i64 %_sum4168, %_bop4185
  store i64 %_bop4186, i64* %_sum4025
  %_k4187 = load i64, i64* %_k4039
  %_bop4188 = add i64 %_k4187, 1
  store i64 %_bop4188, i64* %_k4039
  br label %_cond4045
_post4043:
  br label %_merge4189
_merge4189:
  %_sum4192 = load i64, i64* %_sum4025
  ret i64 %_sum4192
}

define i64 @program(i64 %_argc4004, { i64, [0 x i8*] }* %_argv4002) {
  %_argc4005 = alloca i64
  %_argv4003 = alloca { i64, [0 x i8*] }*
  %_matrix4018 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %_argc4004, i64* %_argc4005
  store { i64, [0 x i8*] }* %_argv4002, { i64, [0 x i8*] }** %_argv4003
  %_raw_array4006 = call i64* @oat_alloc_array(i64 2)
  %_array4007 = bitcast i64* %_raw_array4006 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4008 = call i64* @oat_alloc_array(i64 2)
  %_array4009 = bitcast i64* %_raw_array4008 to { i64, [0 x i64] }*
  %_ind4010 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4009, i32 0, i32 1, i32 0
  store i64 20, i64* %_ind4010
  %_ind4011 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4009, i32 0, i32 1, i32 1
  store i64 2, i64* %_ind4011
  %_ind4012 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4007, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4009, { i64, [0 x i64] }** %_ind4012
  %_raw_array4013 = call i64* @oat_alloc_array(i64 2)
  %_array4014 = bitcast i64* %_raw_array4013 to { i64, [0 x i64] }*
  %_ind4015 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4014, i32 0, i32 1, i32 0
  store i64 3, i64* %_ind4015
  %_ind4016 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4014, i32 0, i32 1, i32 1
  store i64 5, i64* %_ind4016
  %_ind4017 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4007, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4014, { i64, [0 x i64] }** %_ind4017
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4007, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix4018
  %_matrix4019 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix4018
  %_result4020 = call i64 @compute_determinant({ i64, [0 x { i64, [0 x i64] }*] }* %_matrix4019, i64 2)
  ret i64 %_result4020
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
