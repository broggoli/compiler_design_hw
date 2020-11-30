; generated from: oatprograms/bubble_sort.oat
target triple = "x86_64-unknown-linux"
define void @bubble_sort({ i64, [0 x i64] }* %_arr4167, i64 %_len4165) {
  %_arr4168 = alloca { i64, [0 x i64] }*
  %_len4166 = alloca i64
  %_swapped4169 = alloca i1
  %_i4174 = alloca i64
  %_temp4199 = alloca i64
  store { i64, [0 x i64] }* %_arr4167, { i64, [0 x i64] }** %_arr4168
  store i64 %_len4165, i64* %_len4166
  store i1 1, i1* %_swapped4169
  br label %_cond4173
_cond4173:
  %_swapped4170 = load i1, i1* %_swapped4169
  br i1 %_swapped4170, label %_body4172, label %_post4171
_body4172:
  store i1 0, i1* %_swapped4169
  store i64 0, i64* %_i4174
  br label %_cond4181
_cond4181:
  %_i4175 = load i64, i64* %_i4174
  %_len4176 = load i64, i64* %_len4166
  %_bop4177 = sub i64 %_len4176, 1
  %_bop4178 = icmp slt i64 %_i4175, %_bop4177
  br i1 %_bop4178, label %_body4180, label %_post4179
_body4180:
  %_arr4182 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4168
  %_i4183 = load i64, i64* %_i4174
  %_index_ptr4185 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4182, i32 0, i32 1, i64 %_i4183
  %_index4186 = load i64, i64* %_index_ptr4185
  %_arr4187 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4168
  %_i4188 = load i64, i64* %_i4174
  %_bop4189 = add i64 %_i4188, 1
  %_index_ptr4191 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4187, i32 0, i32 1, i64 %_bop4189
  %_index4192 = load i64, i64* %_index_ptr4191
  %_bop4193 = icmp sgt i64 %_index4186, %_index4192
  br i1 %_bop4193, label %_then4218, label %_else4217
_then4218:
  %_arr4194 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4168
  %_i4195 = load i64, i64* %_i4174
  %_index_ptr4197 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4194, i32 0, i32 1, i64 %_i4195
  %_index4198 = load i64, i64* %_index_ptr4197
  store i64 %_index4198, i64* %_temp4199
  %_arr4200 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4168
  %_i4201 = load i64, i64* %_i4174
  %_index_ptr4203 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4200, i32 0, i32 1, i64 %_i4201
  %_arr4204 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4168
  %_i4205 = load i64, i64* %_i4174
  %_bop4206 = add i64 %_i4205, 1
  %_index_ptr4208 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4204, i32 0, i32 1, i64 %_bop4206
  %_index4209 = load i64, i64* %_index_ptr4208
  store i64 %_index4209, i64* %_index_ptr4203
  %_arr4210 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4168
  %_i4211 = load i64, i64* %_i4174
  %_bop4212 = add i64 %_i4211, 1
  %_index_ptr4214 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4210, i32 0, i32 1, i64 %_bop4212
  %_temp4215 = load i64, i64* %_temp4199
  store i64 %_temp4215, i64* %_index_ptr4214
  store i1 1, i1* %_swapped4169
  br label %_merge4216
_else4217:
  br label %_merge4216
_merge4216:
  %_i4219 = load i64, i64* %_i4174
  %_bop4220 = add i64 %_i4219, 1
  store i64 %_bop4220, i64* %_i4174
  br label %_cond4181
_post4179:
  br label %_cond4173
_post4171:
  ret void
}

define i64 @program(i64 %_argc4097, { i64, [0 x i8*] }* %_argv4095) {
  %_argc4098 = alloca i64
  %_argv4096 = alloca { i64, [0 x i8*] }*
  %_i4102 = alloca i64
  %_j4115 = alloca i64
  %_arr4133 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_val4134 = alloca i64
  %_i4135 = alloca i64
  store i64 %_argc4097, i64* %_argc4098
  store { i64, [0 x i8*] }* %_argv4095, { i64, [0 x i8*] }** %_argv4096
  %_raw_array4099 = call i64* @oat_alloc_array(i64 10)
  %_array4100 = bitcast i64* %_raw_array4099 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 10, i64* %_i4102
  br label %_cond4107
_cond4107:
  %_i4103 = load i64, i64* %_i4102
  %_bop4104 = icmp slt i64 %_i4103, 10
  br i1 %_bop4104, label %_body4106, label %_post4105
_body4106:
  %__tmp_array_sym41014108 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array4100
  %_i4109 = load i64, i64* %_i4102
  %_index_ptr4111 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym41014108, i32 0, i32 1, i64 %_i4109
  %_raw_array4112 = call i64* @oat_alloc_array(i64 10)
  %_array4113 = bitcast i64* %_raw_array4112 to { i64, [0 x i64] }*
  store i64 10, i64* %_j4115
  br label %_cond4120
_cond4120:
  %_j4116 = load i64, i64* %_j4115
  %_bop4117 = icmp slt i64 %_j4116, 10
  br i1 %_bop4117, label %_body4119, label %_post4118
_body4119:
  %__tmp_array_sym41144121 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array4113
  %_j4122 = load i64, i64* %_j4115
  %_index_ptr4124 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym41144121, i32 0, i32 1, i64 %_j4122
  %_i4125 = load i64, i64* %_i4102
  %_bop4126 = mul i64 10, %_i4125
  %_j4127 = load i64, i64* %_j4115
  %_bop4128 = sub i64 %_bop4126, %_j4127
  store i64 %_bop4128, i64* %_index_ptr4124
  %_j4129 = load i64, i64* %_j4115
  %_bop4130 = add i64 %_j4129, 1
  store i64 %_bop4130, i64* %_j4115
  br label %_cond4120
_post4118:
  store { i64, [0 x i64] }* %_array4113, { i64, [0 x i64] }** %_index_ptr4111
  %_i4131 = load i64, i64* %_i4102
  %_bop4132 = add i64 %_i4131, 1
  store i64 %_bop4132, i64* %_i4102
  br label %_cond4107
_post4105:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4100, { i64, [0 x { i64, [0 x i64] }*] }** %_arr4133
  store i64 0, i64* %_val4134
  store i64 0, i64* %_i4135
  br label %_cond4140
_cond4140:
  %_i4136 = load i64, i64* %_i4135
  %_bop4137 = icmp slt i64 %_i4136, 10
  br i1 %_bop4137, label %_body4139, label %_post4138
_body4139:
  %_arr4141 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr4133
  %_i4142 = load i64, i64* %_i4135
  %_index_ptr4144 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr4141, i32 0, i32 1, i64 %_i4142
  %_index4145 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4144
  call void @bubble_sort({ i64, [0 x i64] }* %_index4145, i64 10)
  %_val4147 = load i64, i64* %_val4134
  %_arr4148 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr4133
  %_i4149 = load i64, i64* %_i4135
  %_index_ptr4151 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr4148, i32 0, i32 1, i64 %_i4149
  %_index4152 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4151
  %_i4153 = load i64, i64* %_i4135
  %_index_ptr4155 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4152, i32 0, i32 1, i64 %_i4153
  %_index4156 = load i64, i64* %_index_ptr4155
  %_bop4157 = add i64 %_val4147, %_index4156
  store i64 %_bop4157, i64* %_val4134
  %_i4158 = load i64, i64* %_i4135
  %_bop4159 = add i64 %_i4158, 1
  store i64 %_bop4159, i64* %_i4135
  br label %_cond4140
_post4138:
  %_val4160 = load i64, i64* %_val4134
  %_bop4161 = icmp eq i64 %_val4160, 405
  br i1 %_bop4161, label %_then4164, label %_else4163
_then4164:
  ret i64 1
_else4163:
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
