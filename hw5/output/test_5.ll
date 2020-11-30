; generated from: oatprograms/bubble_sort.oat
target triple = "x86_64-unknown-linux"
define void @bubble_sort({ i64, [0 x i64] }* %_arr4330, i64 %_len4328) {
  %_arr4331 = alloca { i64, [0 x i64] }*
  %_len4329 = alloca i64
  %_swapped4332 = alloca i1
  %_i4337 = alloca i64
  %_temp4365 = alloca i64
  store { i64, [0 x i64] }* %_arr4330, { i64, [0 x i64] }** %_arr4331
  store i64 %_len4328, i64* %_len4329
  store i1 1, i1* %_swapped4332
  br label %_cond4336
_cond4336:
  %_swapped4333 = load i1, i1* %_swapped4332
  br i1 %_swapped4333, label %_body4335, label %_post4334
_body4335:
  store i1 0, i1* %_swapped4332
  store i64 0, i64* %_i4337
  br label %_cond4344
_cond4344:
  %_i4338 = load i64, i64* %_i4337
  %_len4339 = load i64, i64* %_len4329
  %_bop4340 = sub i64 %_len4339, 1
  %_bop4341 = icmp slt i64 %_i4338, %_bop4340
  br i1 %_bop4341, label %_body4343, label %_post4342
_body4343:
  %_arr4345 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4331
  %_i4346 = load i64, i64* %_i4337
  %_cast4347 = bitcast { i64, [0 x i64] }* %_arr4345 to i64*
  call void @oat_assert_array_length(i64* %_cast4347, i64 %_i4346)
  %_index_ptr4349 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4345, i32 0, i32 1, i64 %_i4346
  %_index4350 = load i64, i64* %_index_ptr4349
  %_arr4351 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4331
  %_i4352 = load i64, i64* %_i4337
  %_bop4353 = add i64 %_i4352, 1
  %_cast4354 = bitcast { i64, [0 x i64] }* %_arr4351 to i64*
  call void @oat_assert_array_length(i64* %_cast4354, i64 %_bop4353)
  %_index_ptr4356 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4351, i32 0, i32 1, i64 %_bop4353
  %_index4357 = load i64, i64* %_index_ptr4356
  %_bop4358 = icmp sgt i64 %_index4350, %_index4357
  br i1 %_bop4358, label %_then4387, label %_else4386
_then4387:
  %_arr4359 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4331
  %_i4360 = load i64, i64* %_i4337
  %_cast4361 = bitcast { i64, [0 x i64] }* %_arr4359 to i64*
  call void @oat_assert_array_length(i64* %_cast4361, i64 %_i4360)
  %_index_ptr4363 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4359, i32 0, i32 1, i64 %_i4360
  %_index4364 = load i64, i64* %_index_ptr4363
  store i64 %_index4364, i64* %_temp4365
  %_arr4366 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4331
  %_i4367 = load i64, i64* %_i4337
  %_cast4368 = bitcast { i64, [0 x i64] }* %_arr4366 to i64*
  call void @oat_assert_array_length(i64* %_cast4368, i64 %_i4367)
  %_index_ptr4370 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4366, i32 0, i32 1, i64 %_i4367
  %_arr4371 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4331
  %_i4372 = load i64, i64* %_i4337
  %_bop4373 = add i64 %_i4372, 1
  %_cast4374 = bitcast { i64, [0 x i64] }* %_arr4371 to i64*
  call void @oat_assert_array_length(i64* %_cast4374, i64 %_bop4373)
  %_index_ptr4376 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4371, i32 0, i32 1, i64 %_bop4373
  %_index4377 = load i64, i64* %_index_ptr4376
  store i64 %_index4377, i64* %_index_ptr4370
  %_arr4378 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4331
  %_i4379 = load i64, i64* %_i4337
  %_bop4380 = add i64 %_i4379, 1
  %_cast4381 = bitcast { i64, [0 x i64] }* %_arr4378 to i64*
  call void @oat_assert_array_length(i64* %_cast4381, i64 %_bop4380)
  %_index_ptr4383 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr4378, i32 0, i32 1, i64 %_bop4380
  %_temp4384 = load i64, i64* %_temp4365
  store i64 %_temp4384, i64* %_index_ptr4383
  store i1 1, i1* %_swapped4332
  br label %_merge4385
_else4386:
  br label %_merge4385
_merge4385:
  %_i4388 = load i64, i64* %_i4337
  %_bop4389 = add i64 %_i4388, 1
  store i64 %_bop4389, i64* %_i4337
  br label %_cond4344
_post4342:
  br label %_cond4336
_post4334:
  ret void
}

define i64 @program(i64 %_argc4261, { i64, [0 x i8*] }* %_argv4259) {
  %_argc4262 = alloca i64
  %_argv4260 = alloca { i64, [0 x i8*] }*
  %_i4271 = alloca i64
  %_j4282 = alloca i64
  %_arr4293 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_val4294 = alloca i64
  %_i4295 = alloca i64
  store i64 %_argc4261, i64* %_argc4262
  store { i64, [0 x i8*] }* %_argv4259, { i64, [0 x i8*] }** %_argv4260
  %_raw_array4263 = call i64* @oat_alloc_array(i64 10)
  %_array4264 = bitcast i64* %_raw_array4263 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i4271
  br label %_cond4267
_cond4267:
  %_i4272 = load i64, i64* %_i4271
  %_bop4273 = icmp slt i64 %_i4272, 10
  br i1 %_bop4273, label %_body4266, label %_post4265
_body4266:
  %_local_id4270 = load i64, i64* %_i4271
  %_index_ptr4269 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4264, i32 0, i32 1, i64 %_local_id4270
  %_raw_array4274 = call i64* @oat_alloc_array(i64 10)
  %_array4275 = bitcast i64* %_raw_array4274 to { i64, [0 x i64] }*
  store i64 0, i64* %_j4282
  br label %_cond4278
_cond4278:
  %_j4283 = load i64, i64* %_j4282
  %_bop4284 = icmp slt i64 %_j4283, 10
  br i1 %_bop4284, label %_body4277, label %_post4276
_body4277:
  %_local_id4281 = load i64, i64* %_j4282
  %_index_ptr4280 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4275, i32 0, i32 1, i64 %_local_id4281
  %_i4285 = load i64, i64* %_i4271
  %_bop4286 = mul i64 10, %_i4285
  %_j4287 = load i64, i64* %_j4282
  %_bop4288 = sub i64 %_bop4286, %_j4287
  store i64 %_bop4288, i64* %_index_ptr4280
  %_bop4279 = add i64 %_local_id4281, 1
  store i64 %_bop4279, i64* %_j4282
  br label %_cond4278
_post4276:
  store { i64, [0 x i64] }* %_array4275, { i64, [0 x i64] }** %_index_ptr4269
  %_bop4268 = add i64 %_local_id4270, 1
  store i64 %_bop4268, i64* %_i4271
  br label %_cond4267
_post4265:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4264, { i64, [0 x { i64, [0 x i64] }*] }** %_arr4293
  store i64 0, i64* %_val4294
  store i64 0, i64* %_i4295
  br label %_cond4300
_cond4300:
  %_i4296 = load i64, i64* %_i4295
  %_bop4297 = icmp slt i64 %_i4296, 10
  br i1 %_bop4297, label %_body4299, label %_post4298
_body4299:
  %_arr4301 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr4293
  %_i4302 = load i64, i64* %_i4295
  %_cast4303 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr4301 to i64*
  call void @oat_assert_array_length(i64* %_cast4303, i64 %_i4302)
  %_index_ptr4305 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr4301, i32 0, i32 1, i64 %_i4302
  %_index4306 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4305
  call void @bubble_sort({ i64, [0 x i64] }* %_index4306, i64 10)
  %_val4308 = load i64, i64* %_val4294
  %_arr4309 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr4293
  %_i4310 = load i64, i64* %_i4295
  %_cast4311 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr4309 to i64*
  call void @oat_assert_array_length(i64* %_cast4311, i64 %_i4310)
  %_index_ptr4313 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr4309, i32 0, i32 1, i64 %_i4310
  %_index4314 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr4313
  %_i4315 = load i64, i64* %_i4295
  %_cast4316 = bitcast { i64, [0 x i64] }* %_index4314 to i64*
  call void @oat_assert_array_length(i64* %_cast4316, i64 %_i4315)
  %_index_ptr4318 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index4314, i32 0, i32 1, i64 %_i4315
  %_index4319 = load i64, i64* %_index_ptr4318
  %_bop4320 = add i64 %_val4308, %_index4319
  store i64 %_bop4320, i64* %_val4294
  %_i4321 = load i64, i64* %_i4295
  %_bop4322 = add i64 %_i4321, 1
  store i64 %_bop4322, i64* %_i4295
  br label %_cond4300
_post4298:
  %_val4323 = load i64, i64* %_val4294
  %_bop4324 = icmp eq i64 %_val4323, 405
  br i1 %_bop4324, label %_then4327, label %_else4326
_then4327:
  ret i64 1
_else4326:
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
