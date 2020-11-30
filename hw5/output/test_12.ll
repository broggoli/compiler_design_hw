; generated from: oatprograms/binary_search.oat
target triple = "x86_64-unknown-linux"
@_str_arr3304 = global [9 x i8] c"Correct!\00"

define i64 @euclid_division(i64 %_numerator3363, i64 %_denominator3361) {
  %_numerator3364 = alloca i64
  %_denominator3362 = alloca i64
  %_quotient3375 = alloca i64
  %_remainder3377 = alloca i64
  store i64 %_numerator3363, i64* %_numerator3364
  store i64 %_denominator3361, i64* %_denominator3362
  %_denominator3365 = load i64, i64* %_denominator3362
  %_bop3366 = icmp slt i64 %_denominator3365, 0
  br i1 %_bop3366, label %_then3374, label %_else3373
_then3374:
  %_denominator3367 = load i64, i64* %_denominator3362
  %_unop3368 = sub i64 0, %_denominator3367
  %_numerator3369 = load i64, i64* %_numerator3364
  %_result3370 = call i64 @euclid_division(i64 %_numerator3369, i64 %_unop3368)
  %_unop3371 = sub i64 0, %_result3370
  ret i64 %_unop3371
_else3373:
  br label %_merge3372
_merge3372:
  store i64 0, i64* %_quotient3375
  %_numerator3376 = load i64, i64* %_numerator3364
  store i64 %_numerator3376, i64* %_remainder3377
  %_numerator3378 = load i64, i64* %_numerator3364
  %_bop3379 = icmp slt i64 %_numerator3378, 0
  br i1 %_bop3379, label %_then3405, label %_else3404
_then3405:
  %_numerator3380 = load i64, i64* %_numerator3364
  %_unop3381 = sub i64 0, %_numerator3380
  store i64 %_unop3381, i64* %_remainder3377
  br label %_cond3387
_cond3387:
  %_remainder3382 = load i64, i64* %_remainder3377
  %_denominator3383 = load i64, i64* %_denominator3362
  %_bop3384 = icmp sge i64 %_remainder3382, %_denominator3383
  br i1 %_bop3384, label %_body3386, label %_post3385
_body3386:
  %_quotient3388 = load i64, i64* %_quotient3375
  %_bop3389 = add i64 %_quotient3388, 1
  store i64 %_bop3389, i64* %_quotient3375
  %_remainder3390 = load i64, i64* %_remainder3377
  %_denominator3391 = load i64, i64* %_denominator3362
  %_bop3392 = sub i64 %_remainder3390, %_denominator3391
  store i64 %_bop3392, i64* %_remainder3377
  br label %_cond3387
_post3385:
  %_remainder3393 = load i64, i64* %_remainder3377
  %_bop3394 = icmp eq i64 %_remainder3393, 0
  br i1 %_bop3394, label %_then3402, label %_else3401
_then3402:
  %_quotient3395 = load i64, i64* %_quotient3375
  %_unop3396 = sub i64 0, %_quotient3395
  ret i64 %_unop3396
_else3401:
  %_quotient3397 = load i64, i64* %_quotient3375
  %_unop3398 = sub i64 0, %_quotient3397
  %_bop3399 = sub i64 %_unop3398, 1
  ret i64 %_bop3399
_merge3400:
  br label %_merge3403
_else3404:
  br label %_merge3403
_merge3403:
  br label %_cond3411
_cond3411:
  %_remainder3406 = load i64, i64* %_remainder3377
  %_denominator3407 = load i64, i64* %_denominator3362
  %_bop3408 = icmp sge i64 %_remainder3406, %_denominator3407
  br i1 %_bop3408, label %_body3410, label %_post3409
_body3410:
  %_quotient3412 = load i64, i64* %_quotient3375
  %_bop3413 = add i64 %_quotient3412, 1
  store i64 %_bop3413, i64* %_quotient3375
  %_remainder3414 = load i64, i64* %_remainder3377
  %_denominator3415 = load i64, i64* %_denominator3362
  %_bop3416 = sub i64 %_remainder3414, %_denominator3415
  store i64 %_bop3416, i64* %_remainder3377
  br label %_cond3411
_post3409:
  %_quotient3417 = load i64, i64* %_quotient3375
  ret i64 %_quotient3417
}

define i1 @binary_search({ i64, [0 x i64] }* %_input3316, i64 %_key3314, i64 %_min3312, i64 %_max3310) {
  %_input3317 = alloca { i64, [0 x i64] }*
  %_key3315 = alloca i64
  %_min3313 = alloca i64
  %_max3311 = alloca i64
  %_midpt3328 = alloca i64
  store { i64, [0 x i64] }* %_input3316, { i64, [0 x i64] }** %_input3317
  store i64 %_key3314, i64* %_key3315
  store i64 %_min3312, i64* %_min3313
  store i64 %_max3310, i64* %_max3311
  %_max3318 = load i64, i64* %_max3311
  %_min3319 = load i64, i64* %_min3313
  %_bop3320 = icmp slt i64 %_max3318, %_min3319
  br i1 %_bop3320, label %_then3323, label %_else3322
_then3323:
  ret i1 0
_else3322:
  br label %_merge3321
_merge3321:
  %_max3324 = load i64, i64* %_max3311
  %_min3325 = load i64, i64* %_min3313
  %_bop3326 = add i64 %_max3324, %_min3325
  %_result3327 = call i64 @euclid_division(i64 %_bop3326, i64 2)
  store i64 %_result3327, i64* %_midpt3328
  %_input3329 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_input3317
  %_midpt3330 = load i64, i64* %_midpt3328
  %_index_ptr3332 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_input3329, i32 0, i32 1, i64 %_midpt3330
  %_index3333 = load i64, i64* %_index_ptr3332
  %_key3334 = load i64, i64* %_key3315
  %_bop3335 = icmp sgt i64 %_index3333, %_key3334
  br i1 %_bop3335, label %_then3344, label %_else3343
_then3344:
  %_midpt3336 = load i64, i64* %_midpt3328
  %_bop3337 = sub i64 %_midpt3336, 1
  %_min3338 = load i64, i64* %_min3313
  %_key3339 = load i64, i64* %_key3315
  %_input3340 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_input3317
  %_result3341 = call i1 @binary_search({ i64, [0 x i64] }* %_input3340, i64 %_key3339, i64 %_min3338, i64 %_bop3337)
  ret i1 %_result3341
_else3343:
  br label %_merge3342
_merge3342:
  %_input3345 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_input3317
  %_midpt3346 = load i64, i64* %_midpt3328
  %_index_ptr3348 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_input3345, i32 0, i32 1, i64 %_midpt3346
  %_index3349 = load i64, i64* %_index_ptr3348
  %_key3350 = load i64, i64* %_key3315
  %_bop3351 = icmp slt i64 %_index3349, %_key3350
  br i1 %_bop3351, label %_then3360, label %_else3359
_then3360:
  %_max3352 = load i64, i64* %_max3311
  %_midpt3353 = load i64, i64* %_midpt3328
  %_bop3354 = add i64 %_midpt3353, 1
  %_key3355 = load i64, i64* %_key3315
  %_input3356 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_input3317
  %_result3357 = call i1 @binary_search({ i64, [0 x i64] }* %_input3356, i64 %_key3355, i64 %_bop3354, i64 %_max3352)
  ret i1 %_result3357
_else3359:
  ret i1 1
}

define i64 @program(i64 %_argc3257, { i64, [0 x i8*] }* %_argv3255) {
  %_argc3258 = alloca i64
  %_argv3256 = alloca { i64, [0 x i8*] }*
  %_i3262 = alloca i64
  %_test_array3274 = alloca { i64, [0 x i64] }*
  %_i3275 = alloca i64
  %_even3292 = alloca i1
  %_odd3295 = alloca i1
  store i64 %_argc3257, i64* %_argc3258
  store { i64, [0 x i8*] }* %_argv3255, { i64, [0 x i8*] }** %_argv3256
  %_raw_array3259 = call i64* @oat_alloc_array(i64 100)
  %_array3260 = bitcast i64* %_raw_array3259 to { i64, [0 x i64] }*
  store i64 100, i64* %_i3262
  br label %_cond3267
_cond3267:
  %_i3263 = load i64, i64* %_i3262
  %_bop3264 = icmp slt i64 %_i3263, 100
  br i1 %_bop3264, label %_body3266, label %_post3265
_body3266:
  %__tmp_array_sym32613268 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array3260
  %_i3269 = load i64, i64* %_i3262
  %_index_ptr3271 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym32613268, i32 0, i32 1, i64 %_i3269
  store i64 0, i64* %_index_ptr3271
  %_i3272 = load i64, i64* %_i3262
  %_bop3273 = add i64 %_i3272, 1
  store i64 %_bop3273, i64* %_i3262
  br label %_cond3267
_post3265:
  store { i64, [0 x i64] }* %_array3260, { i64, [0 x i64] }** %_test_array3274
  store i64 0, i64* %_i3275
  br label %_cond3280
_cond3280:
  %_i3276 = load i64, i64* %_i3275
  %_bop3277 = icmp slt i64 %_i3276, 100
  br i1 %_bop3277, label %_body3279, label %_post3278
_body3279:
  %_test_array3281 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array3274
  %_i3282 = load i64, i64* %_i3275
  %_index_ptr3284 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_test_array3281, i32 0, i32 1, i64 %_i3282
  %_i3285 = load i64, i64* %_i3275
  %_bop3286 = mul i64 2, %_i3285
  %_bop3287 = add i64 %_bop3286, 1
  store i64 %_bop3287, i64* %_index_ptr3284
  %_i3288 = load i64, i64* %_i3275
  %_bop3289 = add i64 %_i3288, 1
  store i64 %_bop3289, i64* %_i3275
  br label %_cond3280
_post3278:
  %_test_array3290 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array3274
  %_result3291 = call i1 @binary_search({ i64, [0 x i64] }* %_test_array3290, i64 80, i64 0, i64 99)
  store i1 %_result3291, i1* %_even3292
  %_test_array3293 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array3274
  %_result3294 = call i1 @binary_search({ i64, [0 x i64] }* %_test_array3293, i64 81, i64 0, i64 99)
  store i1 %_result3294, i1* %_odd3295
  %_even3296 = load i1, i1* %_even3292
  %_odd3297 = load i1, i1* %_odd3295
  %_bop3298 = and i1 %_even3296, %_odd3297
  %_unop3299 = icmp eq i1 %_bop3298, 0
  %_even3300 = load i1, i1* %_even3292
  %_odd3301 = load i1, i1* %_odd3295
  %_bop3302 = or i1 %_even3300, %_odd3301
  %_bop3303 = and i1 %_unop3299, %_bop3302
  br i1 %_bop3303, label %_then3309, label %_else3308
_then3309:
  %_str3305 = getelementptr [9 x i8], [9 x i8]* @_str_arr3304, i32 0, i32 0
  call void @print_string(i8* %_str3305)
  br label %_merge3307
_else3308:
  br label %_merge3307
_merge3307:
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
