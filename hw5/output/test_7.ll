; generated from: oatprograms/conquest.oat
target triple = "x86_64-unknown-linux"
@meaning_of_life = global i64 42
@kesha_to_fling = global i1 1
@professor = global [11 x i8]* @_str5595
@_str5595 = global [11 x i8] c"Zdancewic!\00"
@global_arr = global { i64, [7 x i64] }* @_global_arr5594
@_global_arr5594 = global { i64, [7 x i64] } { i64 7, [7 x i64] [ i64 1, i64 1, i64 2, i64 3, i64 5, i64 8, i64 13 ] }
@null_arr = global { i64, [0 x i64] }* null
@ideal_341_midterm_score = global { i64, [1 x i64] }* @_global_arr5593
@_global_arr5593 = global { i64, [1 x i64] } { i64 1, [1 x i64] [ i64 100 ] }
@actual_341_midterm_score = global { i64, [1 x i64] }* @_global_arr5592
@_global_arr5592 = global { i64, [1 x i64] } { i64 1, [1 x i64] [ i64 0 ] }
@_str_arr5565 = global [16 x i8] c"Meaning of Life\00"
@_str_arr5142 = global [20 x i8] c"My name is Jeff...
\00"
@_str_arr5186 = global [38 x i8] c"Charizard is the BEST Pokemon ever!!!\00"

define i64 @four() {
  %_hakuna_matata5567 = alloca i8*
  %_what_is_the5569 = alloca i64
  %_what_rhymes_with_moore5589 = alloca i64
  %_str5566 = getelementptr [16 x i8], [16 x i8]* @_str_arr5565, i32 0, i32 0
  store i8* %_str5566, i8** %_hakuna_matata5567
  %_meaning_of_life5568 = load i64, i64* @meaning_of_life
  store i64 %_meaning_of_life5568, i64* %_what_is_the5569
  %_meaning_of_life5570 = load i64, i64* @meaning_of_life
  %_global_arr5571 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** @global_arr
  %_cast5572 = bitcast { i64, [7 x i64] }* %_global_arr5571 to i64*
  call void @oat_assert_array_length(i64* %_cast5572, i64 5)
  %_index_ptr5574 = getelementptr { i64, [7 x i64] }, { i64, [7 x i64] }* %_global_arr5571, i32 0, i32 1, i32 5
  %_index5575 = load i64, i64* %_index_ptr5574
  %_global_arr5576 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** @global_arr
  %_cast5577 = bitcast { i64, [7 x i64] }* %_global_arr5576 to i64*
  call void @oat_assert_array_length(i64* %_cast5577, i64 4)
  %_index_ptr5579 = getelementptr { i64, [7 x i64] }, { i64, [7 x i64] }* %_global_arr5576, i32 0, i32 1, i32 4
  %_index5580 = load i64, i64* %_index_ptr5579
  %_bop5581 = mul i64 %_index5575, %_index5580
  %_bop5582 = sub i64 %_meaning_of_life5570, %_bop5581
  %_global_arr5583 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** @global_arr
  %_cast5584 = bitcast { i64, [7 x i64] }* %_global_arr5583 to i64*
  call void @oat_assert_array_length(i64* %_cast5584, i64 2)
  %_index_ptr5586 = getelementptr { i64, [7 x i64] }, { i64, [7 x i64] }* %_global_arr5583, i32 0, i32 1, i32 2
  %_index5587 = load i64, i64* %_index_ptr5586
  %_bop5588 = add i64 %_bop5582, %_index5587
  store i64 %_bop5588, i64* %_what_rhymes_with_moore5589
  %_what_rhymes_with_moore5590 = load i64, i64* %_what_rhymes_with_moore5589
  %_bop5591 = add i64 0, %_what_rhymes_with_moore5590
  ret i64 %_bop5591
}

define { i64, [0 x i64] }* @asian_brother_of_foo_named_fui(i8* %_s5559, i1 %_b5557, i64 %_i5555) {
  %_s5560 = alloca i8*
  %_b5558 = alloca i1
  %_i5556 = alloca i64
  %_fui5562 = alloca { i64, [7 x i64] }*
  store i8* %_s5559, i8** %_s5560
  store i1 %_b5557, i1* %_b5558
  store i64 %_i5555, i64* %_i5556
  %_global_arr5561 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** @global_arr
  store { i64, [7 x i64] }* %_global_arr5561, { i64, [7 x i64] }** %_fui5562
  %_fui5563 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** %_fui5562
  %_cast5564 = bitcast { i64, [7 x i64] }* %_fui5563 to { i64, [0 x i64] }*
  ret { i64, [0 x i64] }* %_cast5564
}

define void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5323, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5321, i64 %_row5319, i64 %_col5317, i64 %_i5315, i64 %_j5313) {
  %_arr5324 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_visited5322 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_row5320 = alloca i64
  %_col5318 = alloca i64
  %_i5316 = alloca i64
  %_j5314 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %_arr5323, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  store { i64, [0 x { i64, [0 x i64] }*] }* %_visited5321, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  store i64 %_row5319, i64* %_row5320
  store i64 %_col5317, i64* %_col5318
  store i64 %_i5315, i64* %_i5316
  store i64 %_j5313, i64* %_j5314
  %_i5325 = load i64, i64* %_i5316
  %_bop5326 = sub i64 %_i5325, 1
  %_bop5327 = icmp sge i64 %_bop5326, 0
  br i1 %_bop5327, label %_then5381, label %_else5380
_then5381:
  %_visited5328 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_i5329 = load i64, i64* %_i5316
  %_bop5330 = sub i64 %_i5329, 1
  %_cast5331 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5328 to i64*
  call void @oat_assert_array_length(i64* %_cast5331, i64 %_bop5330)
  %_index_ptr5333 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5328, i32 0, i32 1, i64 %_bop5330
  %_index5334 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5333
  %_j5335 = load i64, i64* %_j5314
  %_cast5336 = bitcast { i64, [0 x i64] }* %_index5334 to i64*
  call void @oat_assert_array_length(i64* %_cast5336, i64 %_j5335)
  %_index_ptr5338 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5334, i32 0, i32 1, i64 %_j5335
  %_index5339 = load i64, i64* %_index_ptr5338
  %_bop5340 = icmp ne i64 %_index5339, 1
  br i1 %_bop5340, label %_then5378, label %_else5377
_then5378:
  %_visited5341 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_i5342 = load i64, i64* %_i5316
  %_bop5343 = sub i64 %_i5342, 1
  %_cast5344 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5341 to i64*
  call void @oat_assert_array_length(i64* %_cast5344, i64 %_bop5343)
  %_index_ptr5346 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5341, i32 0, i32 1, i64 %_bop5343
  %_index5347 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5346
  %_j5348 = load i64, i64* %_j5314
  %_cast5349 = bitcast { i64, [0 x i64] }* %_index5347 to i64*
  call void @oat_assert_array_length(i64* %_cast5349, i64 %_j5348)
  %_index_ptr5351 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5347, i32 0, i32 1, i64 %_j5348
  store i64 1, i64* %_index_ptr5351
  %_arr5352 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  %_i5353 = load i64, i64* %_i5316
  %_bop5354 = sub i64 %_i5353, 1
  %_cast5355 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr5352 to i64*
  call void @oat_assert_array_length(i64* %_cast5355, i64 %_bop5354)
  %_index_ptr5357 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5352, i32 0, i32 1, i64 %_bop5354
  %_index5358 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5357
  %_j5359 = load i64, i64* %_j5314
  %_cast5360 = bitcast { i64, [0 x i64] }* %_index5358 to i64*
  call void @oat_assert_array_length(i64* %_cast5360, i64 %_j5359)
  %_index_ptr5362 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5358, i32 0, i32 1, i64 %_j5359
  %_index5363 = load i64, i64* %_index_ptr5362
  %_bop5364 = icmp eq i64 %_index5363, 1
  br i1 %_bop5364, label %_then5375, label %_else5374
_then5375:
  %_j5365 = load i64, i64* %_j5314
  %_i5366 = load i64, i64* %_i5316
  %_bop5367 = sub i64 %_i5366, 1
  %_col5368 = load i64, i64* %_col5318
  %_row5369 = load i64, i64* %_row5320
  %_visited5370 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_arr5371 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5371, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5370, i64 %_row5369, i64 %_col5368, i64 %_bop5367, i64 %_j5365)
  br label %_merge5373
_else5374:
  br label %_merge5373
_merge5373:
  br label %_merge5376
_else5377:
  br label %_merge5376
_merge5376:
  br label %_merge5379
_else5380:
  br label %_merge5379
_merge5379:
  %_i5382 = load i64, i64* %_i5316
  %_bop5383 = add i64 %_i5382, 1
  %_row5384 = load i64, i64* %_row5320
  %_bop5385 = icmp slt i64 %_bop5383, %_row5384
  br i1 %_bop5385, label %_then5439, label %_else5438
_then5439:
  %_visited5386 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_i5387 = load i64, i64* %_i5316
  %_bop5388 = add i64 %_i5387, 1
  %_cast5389 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5386 to i64*
  call void @oat_assert_array_length(i64* %_cast5389, i64 %_bop5388)
  %_index_ptr5391 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5386, i32 0, i32 1, i64 %_bop5388
  %_index5392 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5391
  %_j5393 = load i64, i64* %_j5314
  %_cast5394 = bitcast { i64, [0 x i64] }* %_index5392 to i64*
  call void @oat_assert_array_length(i64* %_cast5394, i64 %_j5393)
  %_index_ptr5396 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5392, i32 0, i32 1, i64 %_j5393
  %_index5397 = load i64, i64* %_index_ptr5396
  %_bop5398 = icmp ne i64 %_index5397, 1
  br i1 %_bop5398, label %_then5436, label %_else5435
_then5436:
  %_visited5399 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_i5400 = load i64, i64* %_i5316
  %_bop5401 = add i64 %_i5400, 1
  %_cast5402 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5399 to i64*
  call void @oat_assert_array_length(i64* %_cast5402, i64 %_bop5401)
  %_index_ptr5404 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5399, i32 0, i32 1, i64 %_bop5401
  %_index5405 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5404
  %_j5406 = load i64, i64* %_j5314
  %_cast5407 = bitcast { i64, [0 x i64] }* %_index5405 to i64*
  call void @oat_assert_array_length(i64* %_cast5407, i64 %_j5406)
  %_index_ptr5409 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5405, i32 0, i32 1, i64 %_j5406
  store i64 1, i64* %_index_ptr5409
  %_arr5410 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  %_i5411 = load i64, i64* %_i5316
  %_bop5412 = add i64 %_i5411, 1
  %_cast5413 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr5410 to i64*
  call void @oat_assert_array_length(i64* %_cast5413, i64 %_bop5412)
  %_index_ptr5415 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5410, i32 0, i32 1, i64 %_bop5412
  %_index5416 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5415
  %_j5417 = load i64, i64* %_j5314
  %_cast5418 = bitcast { i64, [0 x i64] }* %_index5416 to i64*
  call void @oat_assert_array_length(i64* %_cast5418, i64 %_j5417)
  %_index_ptr5420 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5416, i32 0, i32 1, i64 %_j5417
  %_index5421 = load i64, i64* %_index_ptr5420
  %_bop5422 = icmp eq i64 %_index5421, 1
  br i1 %_bop5422, label %_then5433, label %_else5432
_then5433:
  %_j5423 = load i64, i64* %_j5314
  %_i5424 = load i64, i64* %_i5316
  %_bop5425 = add i64 %_i5424, 1
  %_col5426 = load i64, i64* %_col5318
  %_row5427 = load i64, i64* %_row5320
  %_visited5428 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_arr5429 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5429, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5428, i64 %_row5427, i64 %_col5426, i64 %_bop5425, i64 %_j5423)
  br label %_merge5431
_else5432:
  br label %_merge5431
_merge5431:
  br label %_merge5434
_else5435:
  br label %_merge5434
_merge5434:
  br label %_merge5437
_else5438:
  br label %_merge5437
_merge5437:
  %_j5440 = load i64, i64* %_j5314
  %_bop5441 = sub i64 %_j5440, 1
  %_bop5442 = icmp sge i64 %_bop5441, 0
  br i1 %_bop5442, label %_then5496, label %_else5495
_then5496:
  %_visited5443 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_i5444 = load i64, i64* %_i5316
  %_cast5445 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5443 to i64*
  call void @oat_assert_array_length(i64* %_cast5445, i64 %_i5444)
  %_index_ptr5447 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5443, i32 0, i32 1, i64 %_i5444
  %_index5448 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5447
  %_j5449 = load i64, i64* %_j5314
  %_bop5450 = sub i64 %_j5449, 1
  %_cast5451 = bitcast { i64, [0 x i64] }* %_index5448 to i64*
  call void @oat_assert_array_length(i64* %_cast5451, i64 %_bop5450)
  %_index_ptr5453 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5448, i32 0, i32 1, i64 %_bop5450
  %_index5454 = load i64, i64* %_index_ptr5453
  %_bop5455 = icmp ne i64 %_index5454, 1
  br i1 %_bop5455, label %_then5493, label %_else5492
_then5493:
  %_visited5456 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_i5457 = load i64, i64* %_i5316
  %_cast5458 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5456 to i64*
  call void @oat_assert_array_length(i64* %_cast5458, i64 %_i5457)
  %_index_ptr5460 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5456, i32 0, i32 1, i64 %_i5457
  %_index5461 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5460
  %_j5462 = load i64, i64* %_j5314
  %_bop5463 = sub i64 %_j5462, 1
  %_cast5464 = bitcast { i64, [0 x i64] }* %_index5461 to i64*
  call void @oat_assert_array_length(i64* %_cast5464, i64 %_bop5463)
  %_index_ptr5466 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5461, i32 0, i32 1, i64 %_bop5463
  store i64 1, i64* %_index_ptr5466
  %_arr5467 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  %_i5468 = load i64, i64* %_i5316
  %_cast5469 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr5467 to i64*
  call void @oat_assert_array_length(i64* %_cast5469, i64 %_i5468)
  %_index_ptr5471 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5467, i32 0, i32 1, i64 %_i5468
  %_index5472 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5471
  %_j5473 = load i64, i64* %_j5314
  %_bop5474 = sub i64 %_j5473, 1
  %_cast5475 = bitcast { i64, [0 x i64] }* %_index5472 to i64*
  call void @oat_assert_array_length(i64* %_cast5475, i64 %_bop5474)
  %_index_ptr5477 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5472, i32 0, i32 1, i64 %_bop5474
  %_index5478 = load i64, i64* %_index_ptr5477
  %_bop5479 = icmp eq i64 %_index5478, 1
  br i1 %_bop5479, label %_then5490, label %_else5489
_then5490:
  %_j5480 = load i64, i64* %_j5314
  %_bop5481 = sub i64 %_j5480, 1
  %_i5482 = load i64, i64* %_i5316
  %_col5483 = load i64, i64* %_col5318
  %_row5484 = load i64, i64* %_row5320
  %_visited5485 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_arr5486 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5486, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5485, i64 %_row5484, i64 %_col5483, i64 %_i5482, i64 %_bop5481)
  br label %_merge5488
_else5489:
  br label %_merge5488
_merge5488:
  br label %_merge5491
_else5492:
  br label %_merge5491
_merge5491:
  br label %_merge5494
_else5495:
  br label %_merge5494
_merge5494:
  %_j5497 = load i64, i64* %_j5314
  %_bop5498 = add i64 %_j5497, 1
  %_col5499 = load i64, i64* %_col5318
  %_bop5500 = icmp slt i64 %_bop5498, %_col5499
  br i1 %_bop5500, label %_then5554, label %_else5553
_then5554:
  %_visited5501 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_i5502 = load i64, i64* %_i5316
  %_cast5503 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5501 to i64*
  call void @oat_assert_array_length(i64* %_cast5503, i64 %_i5502)
  %_index_ptr5505 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5501, i32 0, i32 1, i64 %_i5502
  %_index5506 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5505
  %_j5507 = load i64, i64* %_j5314
  %_bop5508 = add i64 %_j5507, 1
  %_cast5509 = bitcast { i64, [0 x i64] }* %_index5506 to i64*
  call void @oat_assert_array_length(i64* %_cast5509, i64 %_bop5508)
  %_index_ptr5511 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5506, i32 0, i32 1, i64 %_bop5508
  %_index5512 = load i64, i64* %_index_ptr5511
  %_bop5513 = icmp ne i64 %_index5512, 1
  br i1 %_bop5513, label %_then5551, label %_else5550
_then5551:
  %_visited5514 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_i5515 = load i64, i64* %_i5316
  %_cast5516 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5514 to i64*
  call void @oat_assert_array_length(i64* %_cast5516, i64 %_i5515)
  %_index_ptr5518 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5514, i32 0, i32 1, i64 %_i5515
  %_index5519 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5518
  %_j5520 = load i64, i64* %_j5314
  %_bop5521 = add i64 %_j5520, 1
  %_cast5522 = bitcast { i64, [0 x i64] }* %_index5519 to i64*
  call void @oat_assert_array_length(i64* %_cast5522, i64 %_bop5521)
  %_index_ptr5524 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5519, i32 0, i32 1, i64 %_bop5521
  store i64 1, i64* %_index_ptr5524
  %_arr5525 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  %_i5526 = load i64, i64* %_i5316
  %_cast5527 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr5525 to i64*
  call void @oat_assert_array_length(i64* %_cast5527, i64 %_i5526)
  %_index_ptr5529 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5525, i32 0, i32 1, i64 %_i5526
  %_index5530 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5529
  %_j5531 = load i64, i64* %_j5314
  %_bop5532 = add i64 %_j5531, 1
  %_cast5533 = bitcast { i64, [0 x i64] }* %_index5530 to i64*
  call void @oat_assert_array_length(i64* %_cast5533, i64 %_bop5532)
  %_index_ptr5535 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5530, i32 0, i32 1, i64 %_bop5532
  %_index5536 = load i64, i64* %_index_ptr5535
  %_bop5537 = icmp eq i64 %_index5536, 1
  br i1 %_bop5537, label %_then5548, label %_else5547
_then5548:
  %_j5538 = load i64, i64* %_j5314
  %_bop5539 = add i64 %_j5538, 1
  %_i5540 = load i64, i64* %_i5316
  %_col5541 = load i64, i64* %_col5318
  %_row5542 = load i64, i64* %_row5320
  %_visited5543 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5322
  %_arr5544 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5324
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5544, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5543, i64 %_row5542, i64 %_col5541, i64 %_i5540, i64 %_bop5539)
  br label %_merge5546
_else5547:
  br label %_merge5546
_merge5546:
  br label %_merge5549
_else5550:
  br label %_merge5549
_merge5549:
  br label %_merge5552
_else5553:
  br label %_merge5552
_merge5552:
  ret void
}

define i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5211, i64 %_row5209, i64 %_col5207) {
  %_arr5212 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_row5210 = alloca i64
  %_col5208 = alloca i64
  %_i5222 = alloca i64
  %_j5235 = alloca i64
  %_visited5243 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_counter5244 = alloca i64
  %_i5245 = alloca i64
  %_j5252 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %_arr5211, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5212
  store i64 %_row5209, i64* %_row5210
  store i64 %_col5207, i64* %_col5208
  %_row5213 = load i64, i64* %_row5210
  %_raw_array5214 = call i64* @oat_alloc_array(i64 %_row5213)
  %_array5215 = bitcast i64* %_raw_array5214 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i5222
  br label %_cond5218
_cond5218:
  %_i5223 = load i64, i64* %_i5222
  %_row5224 = load i64, i64* %_row5210
  %_bop5225 = icmp slt i64 %_i5223, %_row5224
  br i1 %_bop5225, label %_body5217, label %_post5216
_body5217:
  %_local_id5221 = load i64, i64* %_i5222
  %_index_ptr5220 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5215, i32 0, i32 1, i64 %_local_id5221
  %_col5226 = load i64, i64* %_col5208
  %_raw_array5227 = call i64* @oat_alloc_array(i64 %_col5226)
  %_array5228 = bitcast i64* %_raw_array5227 to { i64, [0 x i64] }*
  store i64 0, i64* %_j5235
  br label %_cond5231
_cond5231:
  %_j5236 = load i64, i64* %_j5235
  %_col5237 = load i64, i64* %_col5208
  %_bop5238 = icmp slt i64 %_j5236, %_col5237
  br i1 %_bop5238, label %_body5230, label %_post5229
_body5230:
  %_local_id5234 = load i64, i64* %_j5235
  %_index_ptr5233 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5228, i32 0, i32 1, i64 %_local_id5234
  store i64 0, i64* %_index_ptr5233
  %_bop5232 = add i64 %_local_id5234, 1
  store i64 %_bop5232, i64* %_j5235
  br label %_cond5231
_post5229:
  store { i64, [0 x i64] }* %_array5228, { i64, [0 x i64] }** %_index_ptr5220
  %_bop5219 = add i64 %_local_id5221, 1
  store i64 %_bop5219, i64* %_i5222
  br label %_cond5218
_post5216:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5215, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5243
  store i64 0, i64* %_counter5244
  store i64 0, i64* %_i5245
  br label %_cond5251
_cond5251:
  %_i5246 = load i64, i64* %_i5245
  %_row5247 = load i64, i64* %_row5210
  %_bop5248 = icmp slt i64 %_i5246, %_row5247
  br i1 %_bop5248, label %_body5250, label %_post5249
_body5250:
  store i64 0, i64* %_j5252
  br label %_cond5258
_cond5258:
  %_j5253 = load i64, i64* %_j5252
  %_col5254 = load i64, i64* %_col5208
  %_bop5255 = icmp slt i64 %_j5253, %_col5254
  br i1 %_bop5255, label %_body5257, label %_post5256
_body5257:
  %_visited5259 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5243
  %_i5260 = load i64, i64* %_i5245
  %_cast5261 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5259 to i64*
  call void @oat_assert_array_length(i64* %_cast5261, i64 %_i5260)
  %_index_ptr5263 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5259, i32 0, i32 1, i64 %_i5260
  %_index5264 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5263
  %_j5265 = load i64, i64* %_j5252
  %_cast5266 = bitcast { i64, [0 x i64] }* %_index5264 to i64*
  call void @oat_assert_array_length(i64* %_cast5266, i64 %_j5265)
  %_index_ptr5268 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5264, i32 0, i32 1, i64 %_j5265
  %_index5269 = load i64, i64* %_index_ptr5268
  %_bop5270 = icmp eq i64 %_index5269, 0
  br i1 %_bop5270, label %_then5307, label %_else5306
_then5307:
  %_visited5271 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5243
  %_i5272 = load i64, i64* %_i5245
  %_cast5273 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_visited5271 to i64*
  call void @oat_assert_array_length(i64* %_cast5273, i64 %_i5272)
  %_index_ptr5275 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5271, i32 0, i32 1, i64 %_i5272
  %_index5276 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5275
  %_j5277 = load i64, i64* %_j5252
  %_cast5278 = bitcast { i64, [0 x i64] }* %_index5276 to i64*
  call void @oat_assert_array_length(i64* %_cast5278, i64 %_j5277)
  %_index_ptr5280 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5276, i32 0, i32 1, i64 %_j5277
  store i64 1, i64* %_index_ptr5280
  %_arr5281 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5212
  %_i5282 = load i64, i64* %_i5245
  %_cast5283 = bitcast { i64, [0 x { i64, [0 x i64] }*] }* %_arr5281 to i64*
  call void @oat_assert_array_length(i64* %_cast5283, i64 %_i5282)
  %_index_ptr5285 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5281, i32 0, i32 1, i64 %_i5282
  %_index5286 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5285
  %_j5287 = load i64, i64* %_j5252
  %_cast5288 = bitcast { i64, [0 x i64] }* %_index5286 to i64*
  call void @oat_assert_array_length(i64* %_cast5288, i64 %_j5287)
  %_index_ptr5290 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5286, i32 0, i32 1, i64 %_j5287
  %_index5291 = load i64, i64* %_index_ptr5290
  %_bop5292 = icmp eq i64 %_index5291, 1
  br i1 %_bop5292, label %_then5304, label %_else5303
_then5304:
  %_counter5293 = load i64, i64* %_counter5244
  %_bop5294 = add i64 %_counter5293, 1
  store i64 %_bop5294, i64* %_counter5244
  %_j5295 = load i64, i64* %_j5252
  %_i5296 = load i64, i64* %_i5245
  %_col5297 = load i64, i64* %_col5208
  %_row5298 = load i64, i64* %_row5210
  %_visited5299 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5243
  %_arr5300 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5212
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5300, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5299, i64 %_row5298, i64 %_col5297, i64 %_i5296, i64 %_j5295)
  br label %_merge5302
_else5303:
  br label %_merge5302
_merge5302:
  br label %_merge5305
_else5306:
  br label %_merge5305
_merge5305:
  %_j5308 = load i64, i64* %_j5252
  %_bop5309 = add i64 %_j5308, 1
  store i64 %_bop5309, i64* %_j5252
  br label %_cond5258
_post5256:
  %_i5310 = load i64, i64* %_i5245
  %_bop5311 = add i64 %_i5310, 1
  store i64 %_bop5311, i64* %_i5245
  br label %_cond5251
_post5249:
  %_counter5312 = load i64, i64* %_counter5244
  ret i64 %_counter5312
}

define i64 @program(i64 %_argc4946, { i64, [0 x i8*] }* %_argv4944) {
  %_argc4947 = alloca i64
  %_argv4945 = alloca { i64, [0 x i8*] }*
  %_territory_a4978 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_territory_b5005 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_territory_c5026 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i5036 = alloca i64
  %_j5048 = alloca i64
  %_none_conquered5060 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i5069 = alloca i64
  %_j5080 = alloca i64
  %_all_conquered5090 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_island5096 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i5105 = alloca i64
  %_j5116 = alloca i64
  %_emptyland5136 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_temp5139 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a5147 = alloca i64
  %_b5150 = alloca i64
  %_c5153 = alloca i64
  %_none5156 = alloca i64
  %_all5159 = alloca i64
  %_i5162 = alloca i64
  %_e5165 = alloca i64
  %_sum5205 = alloca i64
  store i64 %_argc4946, i64* %_argc4947
  store { i64, [0 x i8*] }* %_argv4944, { i64, [0 x i8*] }** %_argv4945
  %_raw_array4948 = call i64* @oat_alloc_array(i64 4)
  %_array4949 = bitcast i64* %_raw_array4948 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4950 = call i64* @oat_alloc_array(i64 4)
  %_array4951 = bitcast i64* %_raw_array4950 to { i64, [0 x i64] }*
  %_ind4952 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4951, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4952
  %_ind4953 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4951, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind4953
  %_ind4954 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4951, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4954
  %_ind4955 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4951, i32 0, i32 1, i32 3
  store i64 0, i64* %_ind4955
  %_ind4956 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4949, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4951, { i64, [0 x i64] }** %_ind4956
  %_raw_array4957 = call i64* @oat_alloc_array(i64 4)
  %_array4958 = bitcast i64* %_raw_array4957 to { i64, [0 x i64] }*
  %_ind4959 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4958, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4959
  %_ind4960 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4958, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4960
  %_ind4961 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4958, i32 0, i32 1, i32 2
  store i64 0, i64* %_ind4961
  %_ind4962 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4958, i32 0, i32 1, i32 3
  store i64 1, i64* %_ind4962
  %_ind4963 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4949, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4958, { i64, [0 x i64] }** %_ind4963
  %_raw_array4964 = call i64* @oat_alloc_array(i64 4)
  %_array4965 = bitcast i64* %_raw_array4964 to { i64, [0 x i64] }*
  %_ind4966 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4965, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4966
  %_ind4967 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4965, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind4967
  %_ind4968 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4965, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4968
  %_ind4969 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4965, i32 0, i32 1, i32 3
  store i64 1, i64* %_ind4969
  %_ind4970 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4949, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array4965, { i64, [0 x i64] }** %_ind4970
  %_raw_array4971 = call i64* @oat_alloc_array(i64 4)
  %_array4972 = bitcast i64* %_raw_array4971 to { i64, [0 x i64] }*
  %_ind4973 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4972, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind4973
  %_ind4974 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4972, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4974
  %_ind4975 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4972, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4975
  %_ind4976 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4972, i32 0, i32 1, i32 3
  store i64 0, i64* %_ind4976
  %_ind4977 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4949, i32 0, i32 1, i32 3
  store { i64, [0 x i64] }* %_array4972, { i64, [0 x i64] }** %_ind4977
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4949, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_a4978
  %_raw_array4979 = call i64* @oat_alloc_array(i64 3)
  %_array4980 = bitcast i64* %_raw_array4979 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4981 = call i64* @oat_alloc_array(i64 5)
  %_array4982 = bitcast i64* %_raw_array4981 to { i64, [0 x i64] }*
  %_ind4983 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4982, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind4983
  %_ind4984 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4982, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind4984
  %_ind4985 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4982, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4985
  %_ind4986 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4982, i32 0, i32 1, i32 3
  store i64 0, i64* %_ind4986
  %_ind4987 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4982, i32 0, i32 1, i32 4
  store i64 1, i64* %_ind4987
  %_ind4988 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4980, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4982, { i64, [0 x i64] }** %_ind4988
  %_raw_array4989 = call i64* @oat_alloc_array(i64 5)
  %_array4990 = bitcast i64* %_raw_array4989 to { i64, [0 x i64] }*
  %_ind4991 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4990, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind4991
  %_ind4992 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4990, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4992
  %_ind4993 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4990, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4993
  %_ind4994 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4990, i32 0, i32 1, i32 3
  store i64 0, i64* %_ind4994
  %_ind4995 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4990, i32 0, i32 1, i32 4
  store i64 1, i64* %_ind4995
  %_ind4996 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4980, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4990, { i64, [0 x i64] }** %_ind4996
  %_raw_array4997 = call i64* @oat_alloc_array(i64 5)
  %_array4998 = bitcast i64* %_raw_array4997 to { i64, [0 x i64] }*
  %_ind4999 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4998, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4999
  %_ind5000 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4998, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind5000
  %_ind5001 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4998, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind5001
  %_ind5002 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4998, i32 0, i32 1, i32 3
  store i64 1, i64* %_ind5002
  %_ind5003 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4998, i32 0, i32 1, i32 4
  store i64 1, i64* %_ind5003
  %_ind5004 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4980, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array4998, { i64, [0 x i64] }** %_ind5004
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4980, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_b5005
  %_raw_array5006 = call i64* @oat_alloc_array(i64 3)
  %_array5007 = bitcast i64* %_raw_array5006 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array5008 = call i64* @oat_alloc_array(i64 3)
  %_array5009 = bitcast i64* %_raw_array5008 to { i64, [0 x i64] }*
  %_ind5010 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5009, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind5010
  %_ind5011 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5009, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind5011
  %_ind5012 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5009, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind5012
  %_ind5013 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5007, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array5009, { i64, [0 x i64] }** %_ind5013
  %_raw_array5014 = call i64* @oat_alloc_array(i64 3)
  %_array5015 = bitcast i64* %_raw_array5014 to { i64, [0 x i64] }*
  %_ind5016 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5015, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind5016
  %_ind5017 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5015, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind5017
  %_ind5018 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5015, i32 0, i32 1, i32 2
  store i64 0, i64* %_ind5018
  %_ind5019 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5007, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array5015, { i64, [0 x i64] }** %_ind5019
  %_raw_array5020 = call i64* @oat_alloc_array(i64 3)
  %_array5021 = bitcast i64* %_raw_array5020 to { i64, [0 x i64] }*
  %_ind5022 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5021, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind5022
  %_ind5023 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5021, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind5023
  %_ind5024 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5021, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind5024
  %_ind5025 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5007, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array5021, { i64, [0 x i64] }** %_ind5025
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5007, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_c5026
  %_result5027 = call i64 @four()
  %_raw_array5028 = call i64* @oat_alloc_array(i64 %_result5027)
  %_array5029 = bitcast i64* %_raw_array5028 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i5036
  br label %_cond5032
_cond5032:
  %_i5037 = load i64, i64* %_i5036
  %_result5038 = call i64 @four()
  %_bop5039 = icmp slt i64 %_i5037, %_result5038
  br i1 %_bop5039, label %_body5031, label %_post5030
_body5031:
  %_local_id5035 = load i64, i64* %_i5036
  %_index_ptr5034 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5029, i32 0, i32 1, i64 %_local_id5035
  %_raw_array5040 = call i64* @oat_alloc_array(i64 2)
  %_array5041 = bitcast i64* %_raw_array5040 to { i64, [0 x i64] }*
  store i64 0, i64* %_j5048
  br label %_cond5044
_cond5044:
  %_j5049 = load i64, i64* %_j5048
  %_bop5050 = icmp slt i64 %_j5049, 2
  br i1 %_bop5050, label %_body5043, label %_post5042
_body5043:
  %_local_id5047 = load i64, i64* %_j5048
  %_index_ptr5046 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5041, i32 0, i32 1, i64 %_local_id5047
  %_actual_341_midterm_score5051 = load { i64, [1 x i64] }*, { i64, [1 x i64] }** @actual_341_midterm_score
  %_cast5052 = bitcast { i64, [1 x i64] }* %_actual_341_midterm_score5051 to i64*
  call void @oat_assert_array_length(i64* %_cast5052, i64 0)
  %_index_ptr5054 = getelementptr { i64, [1 x i64] }, { i64, [1 x i64] }* %_actual_341_midterm_score5051, i32 0, i32 1, i32 0
  %_index5055 = load i64, i64* %_index_ptr5054
  store i64 %_index5055, i64* %_index_ptr5046
  %_bop5045 = add i64 %_local_id5047, 1
  store i64 %_bop5045, i64* %_j5048
  br label %_cond5044
_post5042:
  store { i64, [0 x i64] }* %_array5041, { i64, [0 x i64] }** %_index_ptr5034
  %_bop5033 = add i64 %_local_id5035, 1
  store i64 %_bop5033, i64* %_i5036
  br label %_cond5032
_post5030:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5029, { i64, [0 x { i64, [0 x i64] }*] }** %_none_conquered5060
  %_raw_array5061 = call i64* @oat_alloc_array(i64 6)
  %_array5062 = bitcast i64* %_raw_array5061 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i5069
  br label %_cond5065
_cond5065:
  %_i5070 = load i64, i64* %_i5069
  %_bop5071 = icmp slt i64 %_i5070, 6
  br i1 %_bop5071, label %_body5064, label %_post5063
_body5064:
  %_local_id5068 = load i64, i64* %_i5069
  %_index_ptr5067 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5062, i32 0, i32 1, i64 %_local_id5068
  %_raw_array5072 = call i64* @oat_alloc_array(i64 6)
  %_array5073 = bitcast i64* %_raw_array5072 to { i64, [0 x i64] }*
  store i64 0, i64* %_j5080
  br label %_cond5076
_cond5076:
  %_j5081 = load i64, i64* %_j5080
  %_bop5082 = icmp slt i64 %_j5081, 6
  br i1 %_bop5082, label %_body5075, label %_post5074
_body5075:
  %_local_id5079 = load i64, i64* %_j5080
  %_index_ptr5078 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5073, i32 0, i32 1, i64 %_local_id5079
  %_i5083 = load i64, i64* %_i5069
  %_bop5084 = mul i64 %_i5083, 0
  %_bop5085 = add i64 %_bop5084, 1
  store i64 %_bop5085, i64* %_index_ptr5078
  %_bop5077 = add i64 %_local_id5079, 1
  store i64 %_bop5077, i64* %_j5080
  br label %_cond5076
_post5074:
  store { i64, [0 x i64] }* %_array5073, { i64, [0 x i64] }** %_index_ptr5067
  %_bop5066 = add i64 %_local_id5068, 1
  store i64 %_bop5066, i64* %_i5069
  br label %_cond5065
_post5063:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5062, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered5090
  %_raw_array5091 = call i64* @oat_alloc_array(i64 1)
  %_array5092 = bitcast i64* %_raw_array5091 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array5093 = call i64* @oat_alloc_array(i64 0)
  %_array5094 = bitcast i64* %_raw_array5093 to { i64, [0 x i64] }*
  %_ind5095 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5092, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array5094, { i64, [0 x i64] }** %_ind5095
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5092, { i64, [0 x { i64, [0 x i64] }*] }** %_island5096
  %_raw_array5097 = call i64* @oat_alloc_array(i64 1)
  %_array5098 = bitcast i64* %_raw_array5097 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 0, i64* %_i5105
  br label %_cond5101
_cond5101:
  %_i5106 = load i64, i64* %_i5105
  %_bop5107 = icmp slt i64 %_i5106, 1
  br i1 %_bop5107, label %_body5100, label %_post5099
_body5100:
  %_local_id5104 = load i64, i64* %_i5105
  %_index_ptr5103 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5098, i32 0, i32 1, i64 %_local_id5104
  %_raw_array5108 = call i64* @oat_alloc_array(i64 1)
  %_array5109 = bitcast i64* %_raw_array5108 to { i64, [0 x i64] }*
  store i64 0, i64* %_j5116
  br label %_cond5112
_cond5112:
  %_j5117 = load i64, i64* %_j5116
  %_bop5118 = icmp slt i64 %_j5117, 1
  br i1 %_bop5118, label %_body5111, label %_post5110
_body5111:
  %_local_id5115 = load i64, i64* %_j5116
  %_index_ptr5114 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5109, i32 0, i32 1, i64 %_local_id5115
  %_ideal_341_midterm_score5119 = load { i64, [1 x i64] }*, { i64, [1 x i64] }** @ideal_341_midterm_score
  %_cast5120 = bitcast { i64, [1 x i64] }* %_ideal_341_midterm_score5119 to i64*
  call void @oat_assert_array_length(i64* %_cast5120, i64 0)
  %_index_ptr5122 = getelementptr { i64, [1 x i64] }, { i64, [1 x i64] }* %_ideal_341_midterm_score5119, i32 0, i32 1, i32 0
  %_index5123 = load i64, i64* %_index_ptr5122
  %_kesha_to_fling5124 = load i1, i1* @kesha_to_fling
  %_professor5125 = load [11 x i8]*, [11 x i8]** @professor
  %_cast5126 = bitcast [11 x i8]* %_professor5125 to i8*
  %_result5127 = call { i64, [0 x i64] }* @asian_brother_of_foo_named_fui(i8* %_cast5126, i1 %_kesha_to_fling5124, i64 %_index5123)
  %_cast5128 = bitcast { i64, [0 x i64] }* %_result5127 to i64*
  call void @oat_assert_array_length(i64* %_cast5128, i64 1)
  %_index_ptr5130 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_result5127, i32 0, i32 1, i32 1
  %_index5131 = load i64, i64* %_index_ptr5130
  store i64 %_index5131, i64* %_index_ptr5114
  %_bop5113 = add i64 %_local_id5115, 1
  store i64 %_bop5113, i64* %_j5116
  br label %_cond5112
_post5110:
  store { i64, [0 x i64] }* %_array5109, { i64, [0 x i64] }** %_index_ptr5103
  %_bop5102 = add i64 %_local_id5104, 1
  store i64 %_bop5102, i64* %_i5105
  br label %_cond5101
_post5099:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5098, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland5136
  %_all_conquered5137 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered5090
  store { i64, [0 x { i64, [0 x i64] }*] }* %_all_conquered5137, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered5090
  %_island5138 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_island5096
  store { i64, [0 x { i64, [0 x i64] }*] }* %_island5138, { i64, [0 x { i64, [0 x i64] }*] }** %_temp5139
  %_emptyland5140 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland5136
  store { i64, [0 x { i64, [0 x i64] }*] }* %_emptyland5140, { i64, [0 x { i64, [0 x i64] }*] }** %_island5096
  %_temp5141 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_temp5139
  store { i64, [0 x { i64, [0 x i64] }*] }* %_temp5141, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland5136
  %_str5143 = getelementptr [20 x i8], [20 x i8]* @_str_arr5142, i32 0, i32 0
  call void @print_string(i8* %_str5143)
  %_territory_a5145 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_a4978
  %_result5146 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_territory_a5145, i64 4, i64 4)
  store i64 %_result5146, i64* %_a5147
  %_territory_b5148 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_b5005
  %_result5149 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_territory_b5148, i64 3, i64 5)
  store i64 %_result5149, i64* %_b5150
  %_territory_c5151 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_c5026
  %_result5152 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_territory_c5151, i64 3, i64 3)
  store i64 %_result5152, i64* %_c5153
  %_none_conquered5154 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_none_conquered5060
  %_result5155 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_none_conquered5154, i64 4, i64 2)
  store i64 %_result5155, i64* %_none5156
  %_all_conquered5157 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered5090
  %_result5158 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_all_conquered5157, i64 6, i64 6)
  store i64 %_result5158, i64* %_all5159
  %_island5160 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_island5096
  %_result5161 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_island5160, i64 1, i64 1)
  store i64 %_result5161, i64* %_i5162
  %_emptyland5163 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland5136
  %_result5164 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_emptyland5163, i64 0, i64 0)
  store i64 %_result5164, i64* %_e5165
  %_a5166 = load i64, i64* %_a5147
  %_bop5167 = icmp eq i64 %_a5166, 3
  %_b5168 = load i64, i64* %_b5150
  %_bop5169 = icmp eq i64 %_b5168, 1
  %_bop5170 = and i1 %_bop5167, %_bop5169
  %_c5171 = load i64, i64* %_c5153
  %_bop5172 = icmp eq i64 %_c5171, 5
  %_bop5173 = and i1 %_bop5170, %_bop5172
  %_none5174 = load i64, i64* %_none5156
  %_bop5175 = icmp eq i64 %_none5174, 0
  %_bop5176 = and i1 %_bop5173, %_bop5175
  %_all5177 = load i64, i64* %_all5159
  %_bop5178 = icmp eq i64 %_all5177, 1
  %_bop5179 = and i1 %_bop5176, %_bop5178
  %_i5180 = load i64, i64* %_i5162
  %_bop5181 = icmp eq i64 %_i5180, 1
  %_bop5182 = and i1 %_bop5179, %_bop5181
  %_e5183 = load i64, i64* %_e5165
  %_bop5184 = icmp eq i64 %_e5183, 0
  %_bop5185 = and i1 %_bop5182, %_bop5184
  br i1 %_bop5185, label %_then5191, label %_else5190
_then5191:
  %_str5187 = getelementptr [38 x i8], [38 x i8]* @_str_arr5186, i32 0, i32 0
  call void @print_string(i8* %_str5187)
  br label %_merge5189
_else5190:
  br label %_merge5189
_merge5189:
  %_a5192 = load i64, i64* %_a5147
  %_b5193 = load i64, i64* %_b5150
  %_bop5194 = add i64 %_a5192, %_b5193
  %_c5195 = load i64, i64* %_c5153
  %_bop5196 = add i64 %_bop5194, %_c5195
  %_none5197 = load i64, i64* %_none5156
  %_bop5198 = add i64 %_bop5196, %_none5197
  %_all5199 = load i64, i64* %_all5159
  %_bop5200 = add i64 %_bop5198, %_all5199
  %_i5201 = load i64, i64* %_i5162
  %_bop5202 = add i64 %_bop5200, %_i5201
  %_e5203 = load i64, i64* %_e5165
  %_bop5204 = add i64 %_bop5202, %_e5203
  store i64 %_bop5204, i64* %_sum5205
  %_sum5206 = load i64, i64* %_sum5205
  ret i64 %_sum5206
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
