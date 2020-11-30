; generated from: oatprograms/conquest.oat
target triple = "x86_64-unknown-linux"
@meaning_of_life = global i64 42
@kesha_to_fling = global i1 1
@professor = global [11 x i8]* @_str5385
@_str5385 = global [11 x i8] c"Zdancewic!\00"
@global_arr = global { i64, [7 x i64] }* @_global_arr5384
@_global_arr5384 = global { i64, [7 x i64] } { i64 7, [7 x i64] [ i64 1, i64 1, i64 2, i64 3, i64 5, i64 8, i64 13 ] }
@null_arr = global { i64, [0 x i64] }* null
@ideal_341_midterm_score = global { i64, [1 x i64] }* @_global_arr5383
@_global_arr5383 = global { i64, [1 x i64] } { i64 1, [1 x i64] [ i64 100 ] }
@actual_341_midterm_score = global { i64, [1 x i64] }* @_global_arr5382
@_global_arr5382 = global { i64, [1 x i64] } { i64 1, [1 x i64] [ i64 0 ] }
@_str_arr5358 = global [16 x i8] c"Meaning of Life\00"
@_str_arr4959 = global [20 x i8] c"My name is Jeff...
\00"
@_str_arr5003 = global [38 x i8] c"Charizard is the BEST Pokemon ever!!!\00"

define i64 @four() {
  %_hakuna_matata5360 = alloca i8*
  %_what_is_the5362 = alloca i64
  %_what_rhymes_with_moore5379 = alloca i64
  %_str5359 = getelementptr [16 x i8], [16 x i8]* @_str_arr5358, i32 0, i32 0
  store i8* %_str5359, i8** %_hakuna_matata5360
  %_meaning_of_life5361 = load i64, i64* @meaning_of_life
  store i64 %_meaning_of_life5361, i64* %_what_is_the5362
  %_meaning_of_life5363 = load i64, i64* @meaning_of_life
  %_global_arr5364 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** @global_arr
  %_index_ptr5366 = getelementptr { i64, [7 x i64] }, { i64, [7 x i64] }* %_global_arr5364, i32 0, i32 1, i32 5
  %_index5367 = load i64, i64* %_index_ptr5366
  %_global_arr5368 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** @global_arr
  %_index_ptr5370 = getelementptr { i64, [7 x i64] }, { i64, [7 x i64] }* %_global_arr5368, i32 0, i32 1, i32 4
  %_index5371 = load i64, i64* %_index_ptr5370
  %_bop5372 = mul i64 %_index5367, %_index5371
  %_bop5373 = sub i64 %_meaning_of_life5363, %_bop5372
  %_global_arr5374 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** @global_arr
  %_index_ptr5376 = getelementptr { i64, [7 x i64] }, { i64, [7 x i64] }* %_global_arr5374, i32 0, i32 1, i32 2
  %_index5377 = load i64, i64* %_index_ptr5376
  %_bop5378 = add i64 %_bop5373, %_index5377
  store i64 %_bop5378, i64* %_what_rhymes_with_moore5379
  %_what_rhymes_with_moore5380 = load i64, i64* %_what_rhymes_with_moore5379
  %_bop5381 = add i64 0, %_what_rhymes_with_moore5380
  ret i64 %_bop5381
}

define { i64, [0 x i64] }* @asian_brother_of_foo_named_fui(i8* %_s5352, i1 %_b5350, i64 %_i5348) {
  %_s5353 = alloca i8*
  %_b5351 = alloca i1
  %_i5349 = alloca i64
  %_fui5355 = alloca { i64, [7 x i64] }*
  store i8* %_s5352, i8** %_s5353
  store i1 %_b5350, i1* %_b5351
  store i64 %_i5348, i64* %_i5349
  %_global_arr5354 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** @global_arr
  store { i64, [7 x i64] }* %_global_arr5354, { i64, [7 x i64] }** %_fui5355
  %_fui5356 = load { i64, [7 x i64] }*, { i64, [7 x i64] }** %_fui5355
  %_cast5357 = bitcast { i64, [7 x i64] }* %_fui5356 to { i64, [0 x i64] }*
  ret { i64, [0 x i64] }* %_cast5357
}

define void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5140, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5138, i64 %_row5136, i64 %_col5134, i64 %_i5132, i64 %_j5130) {
  %_arr5141 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_visited5139 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_row5137 = alloca i64
  %_col5135 = alloca i64
  %_i5133 = alloca i64
  %_j5131 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %_arr5140, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  store { i64, [0 x { i64, [0 x i64] }*] }* %_visited5138, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  store i64 %_row5136, i64* %_row5137
  store i64 %_col5134, i64* %_col5135
  store i64 %_i5132, i64* %_i5133
  store i64 %_j5130, i64* %_j5131
  %_i5142 = load i64, i64* %_i5133
  %_bop5143 = sub i64 %_i5142, 1
  %_bop5144 = icmp sge i64 %_bop5143, 0
  br i1 %_bop5144, label %_then5192, label %_else5191
_then5192:
  %_visited5145 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_i5146 = load i64, i64* %_i5133
  %_bop5147 = sub i64 %_i5146, 1
  %_index_ptr5149 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5145, i32 0, i32 1, i64 %_bop5147
  %_index5150 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5149
  %_j5151 = load i64, i64* %_j5131
  %_index_ptr5153 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5150, i32 0, i32 1, i64 %_j5151
  %_index5154 = load i64, i64* %_index_ptr5153
  %_bop5155 = icmp ne i64 %_index5154, 1
  br i1 %_bop5155, label %_then5189, label %_else5188
_then5189:
  %_visited5156 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_i5157 = load i64, i64* %_i5133
  %_bop5158 = sub i64 %_i5157, 1
  %_index_ptr5160 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5156, i32 0, i32 1, i64 %_bop5158
  %_index5161 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5160
  %_j5162 = load i64, i64* %_j5131
  %_index_ptr5164 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5161, i32 0, i32 1, i64 %_j5162
  store i64 1, i64* %_index_ptr5164
  %_arr5165 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  %_i5166 = load i64, i64* %_i5133
  %_bop5167 = sub i64 %_i5166, 1
  %_index_ptr5169 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5165, i32 0, i32 1, i64 %_bop5167
  %_index5170 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5169
  %_j5171 = load i64, i64* %_j5131
  %_index_ptr5173 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5170, i32 0, i32 1, i64 %_j5171
  %_index5174 = load i64, i64* %_index_ptr5173
  %_bop5175 = icmp eq i64 %_index5174, 1
  br i1 %_bop5175, label %_then5186, label %_else5185
_then5186:
  %_j5176 = load i64, i64* %_j5131
  %_i5177 = load i64, i64* %_i5133
  %_bop5178 = sub i64 %_i5177, 1
  %_col5179 = load i64, i64* %_col5135
  %_row5180 = load i64, i64* %_row5137
  %_visited5181 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_arr5182 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5182, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5181, i64 %_row5180, i64 %_col5179, i64 %_bop5178, i64 %_j5176)
  br label %_merge5184
_else5185:
  br label %_merge5184
_merge5184:
  br label %_merge5187
_else5188:
  br label %_merge5187
_merge5187:
  br label %_merge5190
_else5191:
  br label %_merge5190
_merge5190:
  %_i5193 = load i64, i64* %_i5133
  %_bop5194 = add i64 %_i5193, 1
  %_row5195 = load i64, i64* %_row5137
  %_bop5196 = icmp slt i64 %_bop5194, %_row5195
  br i1 %_bop5196, label %_then5244, label %_else5243
_then5244:
  %_visited5197 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_i5198 = load i64, i64* %_i5133
  %_bop5199 = add i64 %_i5198, 1
  %_index_ptr5201 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5197, i32 0, i32 1, i64 %_bop5199
  %_index5202 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5201
  %_j5203 = load i64, i64* %_j5131
  %_index_ptr5205 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5202, i32 0, i32 1, i64 %_j5203
  %_index5206 = load i64, i64* %_index_ptr5205
  %_bop5207 = icmp ne i64 %_index5206, 1
  br i1 %_bop5207, label %_then5241, label %_else5240
_then5241:
  %_visited5208 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_i5209 = load i64, i64* %_i5133
  %_bop5210 = add i64 %_i5209, 1
  %_index_ptr5212 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5208, i32 0, i32 1, i64 %_bop5210
  %_index5213 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5212
  %_j5214 = load i64, i64* %_j5131
  %_index_ptr5216 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5213, i32 0, i32 1, i64 %_j5214
  store i64 1, i64* %_index_ptr5216
  %_arr5217 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  %_i5218 = load i64, i64* %_i5133
  %_bop5219 = add i64 %_i5218, 1
  %_index_ptr5221 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5217, i32 0, i32 1, i64 %_bop5219
  %_index5222 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5221
  %_j5223 = load i64, i64* %_j5131
  %_index_ptr5225 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5222, i32 0, i32 1, i64 %_j5223
  %_index5226 = load i64, i64* %_index_ptr5225
  %_bop5227 = icmp eq i64 %_index5226, 1
  br i1 %_bop5227, label %_then5238, label %_else5237
_then5238:
  %_j5228 = load i64, i64* %_j5131
  %_i5229 = load i64, i64* %_i5133
  %_bop5230 = add i64 %_i5229, 1
  %_col5231 = load i64, i64* %_col5135
  %_row5232 = load i64, i64* %_row5137
  %_visited5233 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_arr5234 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5234, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5233, i64 %_row5232, i64 %_col5231, i64 %_bop5230, i64 %_j5228)
  br label %_merge5236
_else5237:
  br label %_merge5236
_merge5236:
  br label %_merge5239
_else5240:
  br label %_merge5239
_merge5239:
  br label %_merge5242
_else5243:
  br label %_merge5242
_merge5242:
  %_j5245 = load i64, i64* %_j5131
  %_bop5246 = sub i64 %_j5245, 1
  %_bop5247 = icmp sge i64 %_bop5246, 0
  br i1 %_bop5247, label %_then5295, label %_else5294
_then5295:
  %_visited5248 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_i5249 = load i64, i64* %_i5133
  %_index_ptr5251 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5248, i32 0, i32 1, i64 %_i5249
  %_index5252 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5251
  %_j5253 = load i64, i64* %_j5131
  %_bop5254 = sub i64 %_j5253, 1
  %_index_ptr5256 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5252, i32 0, i32 1, i64 %_bop5254
  %_index5257 = load i64, i64* %_index_ptr5256
  %_bop5258 = icmp ne i64 %_index5257, 1
  br i1 %_bop5258, label %_then5292, label %_else5291
_then5292:
  %_visited5259 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_i5260 = load i64, i64* %_i5133
  %_index_ptr5262 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5259, i32 0, i32 1, i64 %_i5260
  %_index5263 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5262
  %_j5264 = load i64, i64* %_j5131
  %_bop5265 = sub i64 %_j5264, 1
  %_index_ptr5267 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5263, i32 0, i32 1, i64 %_bop5265
  store i64 1, i64* %_index_ptr5267
  %_arr5268 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  %_i5269 = load i64, i64* %_i5133
  %_index_ptr5271 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5268, i32 0, i32 1, i64 %_i5269
  %_index5272 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5271
  %_j5273 = load i64, i64* %_j5131
  %_bop5274 = sub i64 %_j5273, 1
  %_index_ptr5276 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5272, i32 0, i32 1, i64 %_bop5274
  %_index5277 = load i64, i64* %_index_ptr5276
  %_bop5278 = icmp eq i64 %_index5277, 1
  br i1 %_bop5278, label %_then5289, label %_else5288
_then5289:
  %_j5279 = load i64, i64* %_j5131
  %_bop5280 = sub i64 %_j5279, 1
  %_i5281 = load i64, i64* %_i5133
  %_col5282 = load i64, i64* %_col5135
  %_row5283 = load i64, i64* %_row5137
  %_visited5284 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_arr5285 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5285, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5284, i64 %_row5283, i64 %_col5282, i64 %_i5281, i64 %_bop5280)
  br label %_merge5287
_else5288:
  br label %_merge5287
_merge5287:
  br label %_merge5290
_else5291:
  br label %_merge5290
_merge5290:
  br label %_merge5293
_else5294:
  br label %_merge5293
_merge5293:
  %_j5296 = load i64, i64* %_j5131
  %_bop5297 = add i64 %_j5296, 1
  %_col5298 = load i64, i64* %_col5135
  %_bop5299 = icmp slt i64 %_bop5297, %_col5298
  br i1 %_bop5299, label %_then5347, label %_else5346
_then5347:
  %_visited5300 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_i5301 = load i64, i64* %_i5133
  %_index_ptr5303 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5300, i32 0, i32 1, i64 %_i5301
  %_index5304 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5303
  %_j5305 = load i64, i64* %_j5131
  %_bop5306 = add i64 %_j5305, 1
  %_index_ptr5308 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5304, i32 0, i32 1, i64 %_bop5306
  %_index5309 = load i64, i64* %_index_ptr5308
  %_bop5310 = icmp ne i64 %_index5309, 1
  br i1 %_bop5310, label %_then5344, label %_else5343
_then5344:
  %_visited5311 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_i5312 = load i64, i64* %_i5133
  %_index_ptr5314 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5311, i32 0, i32 1, i64 %_i5312
  %_index5315 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5314
  %_j5316 = load i64, i64* %_j5131
  %_bop5317 = add i64 %_j5316, 1
  %_index_ptr5319 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5315, i32 0, i32 1, i64 %_bop5317
  store i64 1, i64* %_index_ptr5319
  %_arr5320 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  %_i5321 = load i64, i64* %_i5133
  %_index_ptr5323 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5320, i32 0, i32 1, i64 %_i5321
  %_index5324 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5323
  %_j5325 = load i64, i64* %_j5131
  %_bop5326 = add i64 %_j5325, 1
  %_index_ptr5328 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5324, i32 0, i32 1, i64 %_bop5326
  %_index5329 = load i64, i64* %_index_ptr5328
  %_bop5330 = icmp eq i64 %_index5329, 1
  br i1 %_bop5330, label %_then5341, label %_else5340
_then5341:
  %_j5331 = load i64, i64* %_j5131
  %_bop5332 = add i64 %_j5331, 1
  %_i5333 = load i64, i64* %_i5133
  %_col5334 = load i64, i64* %_col5135
  %_row5335 = load i64, i64* %_row5137
  %_visited5336 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5139
  %_arr5337 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5141
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5337, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5336, i64 %_row5335, i64 %_col5334, i64 %_i5333, i64 %_bop5332)
  br label %_merge5339
_else5340:
  br label %_merge5339
_merge5339:
  br label %_merge5342
_else5343:
  br label %_merge5342
_merge5342:
  br label %_merge5345
_else5346:
  br label %_merge5345
_merge5345:
  ret void
}

define i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5028, i64 %_row5026, i64 %_col5024) {
  %_arr5029 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_row5027 = alloca i64
  %_col5025 = alloca i64
  %_i5035 = alloca i64
  %_j5051 = alloca i64
  %_visited5066 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_counter5067 = alloca i64
  %_i5068 = alloca i64
  %_j5075 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %_arr5028, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5029
  store i64 %_row5026, i64* %_row5027
  store i64 %_col5024, i64* %_col5025
  %_row5030 = load i64, i64* %_row5027
  %_raw_array5031 = call i64* @oat_alloc_array(i64 %_row5030)
  %_array5032 = bitcast i64* %_raw_array5031 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_row5034 = load i64, i64* %_row5027
  store i64 %_row5034, i64* %_i5035
  br label %_cond5041
_cond5041:
  %_i5036 = load i64, i64* %_i5035
  %_row5037 = load i64, i64* %_row5027
  %_bop5038 = icmp slt i64 %_i5036, %_row5037
  br i1 %_bop5038, label %_body5040, label %_post5039
_body5040:
  %__tmp_array_sym50335042 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array5032
  %_i5043 = load i64, i64* %_i5035
  %_index_ptr5045 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym50335042, i32 0, i32 1, i64 %_i5043
  %_col5046 = load i64, i64* %_col5025
  %_raw_array5047 = call i64* @oat_alloc_array(i64 %_col5046)
  %_array5048 = bitcast i64* %_raw_array5047 to { i64, [0 x i64] }*
  %_col5050 = load i64, i64* %_col5025
  store i64 %_col5050, i64* %_j5051
  br label %_cond5057
_cond5057:
  %_j5052 = load i64, i64* %_j5051
  %_col5053 = load i64, i64* %_col5025
  %_bop5054 = icmp slt i64 %_j5052, %_col5053
  br i1 %_bop5054, label %_body5056, label %_post5055
_body5056:
  %__tmp_array_sym50495058 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5048
  %_j5059 = load i64, i64* %_j5051
  %_index_ptr5061 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym50495058, i32 0, i32 1, i64 %_j5059
  store i64 0, i64* %_index_ptr5061
  %_j5062 = load i64, i64* %_j5051
  %_bop5063 = add i64 %_j5062, 1
  store i64 %_bop5063, i64* %_j5051
  br label %_cond5057
_post5055:
  store { i64, [0 x i64] }* %_array5048, { i64, [0 x i64] }** %_index_ptr5045
  %_i5064 = load i64, i64* %_i5035
  %_bop5065 = add i64 %_i5064, 1
  store i64 %_bop5065, i64* %_i5035
  br label %_cond5041
_post5039:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5032, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5066
  store i64 0, i64* %_counter5067
  store i64 0, i64* %_i5068
  br label %_cond5074
_cond5074:
  %_i5069 = load i64, i64* %_i5068
  %_row5070 = load i64, i64* %_row5027
  %_bop5071 = icmp slt i64 %_i5069, %_row5070
  br i1 %_bop5071, label %_body5073, label %_post5072
_body5073:
  store i64 0, i64* %_j5075
  br label %_cond5081
_cond5081:
  %_j5076 = load i64, i64* %_j5075
  %_col5077 = load i64, i64* %_col5025
  %_bop5078 = icmp slt i64 %_j5076, %_col5077
  br i1 %_bop5078, label %_body5080, label %_post5079
_body5080:
  %_visited5082 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5066
  %_i5083 = load i64, i64* %_i5068
  %_index_ptr5085 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5082, i32 0, i32 1, i64 %_i5083
  %_index5086 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5085
  %_j5087 = load i64, i64* %_j5075
  %_index_ptr5089 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5086, i32 0, i32 1, i64 %_j5087
  %_index5090 = load i64, i64* %_index_ptr5089
  %_bop5091 = icmp eq i64 %_index5090, 0
  br i1 %_bop5091, label %_then5124, label %_else5123
_then5124:
  %_visited5092 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5066
  %_i5093 = load i64, i64* %_i5068
  %_index_ptr5095 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5092, i32 0, i32 1, i64 %_i5093
  %_index5096 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5095
  %_j5097 = load i64, i64* %_j5075
  %_index_ptr5099 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5096, i32 0, i32 1, i64 %_j5097
  store i64 1, i64* %_index_ptr5099
  %_arr5100 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5029
  %_i5101 = load i64, i64* %_i5068
  %_index_ptr5103 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_arr5100, i32 0, i32 1, i64 %_i5101
  %_index5104 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5103
  %_j5105 = load i64, i64* %_j5075
  %_index_ptr5107 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index5104, i32 0, i32 1, i64 %_j5105
  %_index5108 = load i64, i64* %_index_ptr5107
  %_bop5109 = icmp eq i64 %_index5108, 1
  br i1 %_bop5109, label %_then5121, label %_else5120
_then5121:
  %_counter5110 = load i64, i64* %_counter5067
  %_bop5111 = add i64 %_counter5110, 1
  store i64 %_bop5111, i64* %_counter5067
  %_j5112 = load i64, i64* %_j5075
  %_i5113 = load i64, i64* %_i5068
  %_col5114 = load i64, i64* %_col5025
  %_row5115 = load i64, i64* %_row5027
  %_visited5116 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited5066
  %_arr5117 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5029
  call void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %_arr5117, { i64, [0 x { i64, [0 x i64] }*] }* %_visited5116, i64 %_row5115, i64 %_col5114, i64 %_i5113, i64 %_j5112)
  br label %_merge5119
_else5120:
  br label %_merge5119
_merge5119:
  br label %_merge5122
_else5123:
  br label %_merge5122
_merge5122:
  %_j5125 = load i64, i64* %_j5075
  %_bop5126 = add i64 %_j5125, 1
  store i64 %_bop5126, i64* %_j5075
  br label %_cond5081
_post5079:
  %_i5127 = load i64, i64* %_i5068
  %_bop5128 = add i64 %_i5127, 1
  store i64 %_bop5128, i64* %_i5068
  br label %_cond5074
_post5072:
  %_counter5129 = load i64, i64* %_counter5067
  ret i64 %_counter5129
}

define i64 @program(i64 %_argc4753, { i64, [0 x i8*] }* %_argv4751) {
  %_argc4754 = alloca i64
  %_argv4752 = alloca { i64, [0 x i8*] }*
  %_territory_a4785 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_territory_b4812 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_territory_c4833 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i4839 = alloca i64
  %_j4853 = alloca i64
  %_none_conquered4871 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i4875 = alloca i64
  %_j4888 = alloca i64
  %_all_conquered4905 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_island4911 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i4915 = alloca i64
  %_j4928 = alloca i64
  %_emptyland4953 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_temp4956 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a4964 = alloca i64
  %_b4967 = alloca i64
  %_c4970 = alloca i64
  %_none4973 = alloca i64
  %_all4976 = alloca i64
  %_i4979 = alloca i64
  %_e4982 = alloca i64
  %_sum5022 = alloca i64
  store i64 %_argc4753, i64* %_argc4754
  store { i64, [0 x i8*] }* %_argv4751, { i64, [0 x i8*] }** %_argv4752
  %_raw_array4755 = call i64* @oat_alloc_array(i64 4)
  %_array4756 = bitcast i64* %_raw_array4755 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4757 = call i64* @oat_alloc_array(i64 4)
  %_array4758 = bitcast i64* %_raw_array4757 to { i64, [0 x i64] }*
  %_ind4759 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4758, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4759
  %_ind4760 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4758, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind4760
  %_ind4761 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4758, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4761
  %_ind4762 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4758, i32 0, i32 1, i32 3
  store i64 0, i64* %_ind4762
  %_ind4763 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4756, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4758, { i64, [0 x i64] }** %_ind4763
  %_raw_array4764 = call i64* @oat_alloc_array(i64 4)
  %_array4765 = bitcast i64* %_raw_array4764 to { i64, [0 x i64] }*
  %_ind4766 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4765, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4766
  %_ind4767 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4765, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4767
  %_ind4768 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4765, i32 0, i32 1, i32 2
  store i64 0, i64* %_ind4768
  %_ind4769 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4765, i32 0, i32 1, i32 3
  store i64 1, i64* %_ind4769
  %_ind4770 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4756, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4765, { i64, [0 x i64] }** %_ind4770
  %_raw_array4771 = call i64* @oat_alloc_array(i64 4)
  %_array4772 = bitcast i64* %_raw_array4771 to { i64, [0 x i64] }*
  %_ind4773 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4772, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4773
  %_ind4774 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4772, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind4774
  %_ind4775 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4772, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4775
  %_ind4776 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4772, i32 0, i32 1, i32 3
  store i64 1, i64* %_ind4776
  %_ind4777 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4756, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array4772, { i64, [0 x i64] }** %_ind4777
  %_raw_array4778 = call i64* @oat_alloc_array(i64 4)
  %_array4779 = bitcast i64* %_raw_array4778 to { i64, [0 x i64] }*
  %_ind4780 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4779, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind4780
  %_ind4781 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4779, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4781
  %_ind4782 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4779, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4782
  %_ind4783 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4779, i32 0, i32 1, i32 3
  store i64 0, i64* %_ind4783
  %_ind4784 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4756, i32 0, i32 1, i32 3
  store { i64, [0 x i64] }* %_array4779, { i64, [0 x i64] }** %_ind4784
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4756, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_a4785
  %_raw_array4786 = call i64* @oat_alloc_array(i64 3)
  %_array4787 = bitcast i64* %_raw_array4786 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4788 = call i64* @oat_alloc_array(i64 5)
  %_array4789 = bitcast i64* %_raw_array4788 to { i64, [0 x i64] }*
  %_ind4790 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4789, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind4790
  %_ind4791 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4789, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind4791
  %_ind4792 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4789, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4792
  %_ind4793 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4789, i32 0, i32 1, i32 3
  store i64 0, i64* %_ind4793
  %_ind4794 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4789, i32 0, i32 1, i32 4
  store i64 1, i64* %_ind4794
  %_ind4795 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4787, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4789, { i64, [0 x i64] }** %_ind4795
  %_raw_array4796 = call i64* @oat_alloc_array(i64 5)
  %_array4797 = bitcast i64* %_raw_array4796 to { i64, [0 x i64] }*
  %_ind4798 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4797, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind4798
  %_ind4799 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4797, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4799
  %_ind4800 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4797, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4800
  %_ind4801 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4797, i32 0, i32 1, i32 3
  store i64 0, i64* %_ind4801
  %_ind4802 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4797, i32 0, i32 1, i32 4
  store i64 1, i64* %_ind4802
  %_ind4803 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4787, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4797, { i64, [0 x i64] }** %_ind4803
  %_raw_array4804 = call i64* @oat_alloc_array(i64 5)
  %_array4805 = bitcast i64* %_raw_array4804 to { i64, [0 x i64] }*
  %_ind4806 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4805, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4806
  %_ind4807 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4805, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4807
  %_ind4808 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4805, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4808
  %_ind4809 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4805, i32 0, i32 1, i32 3
  store i64 1, i64* %_ind4809
  %_ind4810 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4805, i32 0, i32 1, i32 4
  store i64 1, i64* %_ind4810
  %_ind4811 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4787, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array4805, { i64, [0 x i64] }** %_ind4811
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4787, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_b4812
  %_raw_array4813 = call i64* @oat_alloc_array(i64 3)
  %_array4814 = bitcast i64* %_raw_array4813 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4815 = call i64* @oat_alloc_array(i64 3)
  %_array4816 = bitcast i64* %_raw_array4815 to { i64, [0 x i64] }*
  %_ind4817 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4816, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4817
  %_ind4818 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4816, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind4818
  %_ind4819 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4816, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4819
  %_ind4820 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4814, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4816, { i64, [0 x i64] }** %_ind4820
  %_raw_array4821 = call i64* @oat_alloc_array(i64 3)
  %_array4822 = bitcast i64* %_raw_array4821 to { i64, [0 x i64] }*
  %_ind4823 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4822, i32 0, i32 1, i32 0
  store i64 0, i64* %_ind4823
  %_ind4824 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4822, i32 0, i32 1, i32 1
  store i64 1, i64* %_ind4824
  %_ind4825 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4822, i32 0, i32 1, i32 2
  store i64 0, i64* %_ind4825
  %_ind4826 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4814, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4822, { i64, [0 x i64] }** %_ind4826
  %_raw_array4827 = call i64* @oat_alloc_array(i64 3)
  %_array4828 = bitcast i64* %_raw_array4827 to { i64, [0 x i64] }*
  %_ind4829 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4828, i32 0, i32 1, i32 0
  store i64 1, i64* %_ind4829
  %_ind4830 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4828, i32 0, i32 1, i32 1
  store i64 0, i64* %_ind4830
  %_ind4831 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4828, i32 0, i32 1, i32 2
  store i64 1, i64* %_ind4831
  %_ind4832 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4814, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array4828, { i64, [0 x i64] }** %_ind4832
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4814, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_c4833
  %_result4834 = call i64 @four()
  %_raw_array4835 = call i64* @oat_alloc_array(i64 %_result4834)
  %_array4836 = bitcast i64* %_raw_array4835 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_result4838 = call i64 @four()
  store i64 %_result4838, i64* %_i4839
  br label %_cond4845
_cond4845:
  %_i4840 = load i64, i64* %_i4839
  %_result4841 = call i64 @four()
  %_bop4842 = icmp slt i64 %_i4840, %_result4841
  br i1 %_bop4842, label %_body4844, label %_post4843
_body4844:
  %__tmp_array_sym48374846 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array4836
  %_i4847 = load i64, i64* %_i4839
  %_index_ptr4849 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym48374846, i32 0, i32 1, i64 %_i4847
  %_raw_array4850 = call i64* @oat_alloc_array(i64 2)
  %_array4851 = bitcast i64* %_raw_array4850 to { i64, [0 x i64] }*
  store i64 2, i64* %_j4853
  br label %_cond4858
_cond4858:
  %_j4854 = load i64, i64* %_j4853
  %_bop4855 = icmp slt i64 %_j4854, 2
  br i1 %_bop4855, label %_body4857, label %_post4856
_body4857:
  %__tmp_array_sym48524859 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array4851
  %_j4860 = load i64, i64* %_j4853
  %_index_ptr4862 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym48524859, i32 0, i32 1, i64 %_j4860
  %_actual_341_midterm_score4863 = load { i64, [1 x i64] }*, { i64, [1 x i64] }** @actual_341_midterm_score
  %_index_ptr4865 = getelementptr { i64, [1 x i64] }, { i64, [1 x i64] }* %_actual_341_midterm_score4863, i32 0, i32 1, i32 0
  %_index4866 = load i64, i64* %_index_ptr4865
  store i64 %_index4866, i64* %_index_ptr4862
  %_j4867 = load i64, i64* %_j4853
  %_bop4868 = add i64 %_j4867, 1
  store i64 %_bop4868, i64* %_j4853
  br label %_cond4858
_post4856:
  store { i64, [0 x i64] }* %_array4851, { i64, [0 x i64] }** %_index_ptr4849
  %_i4869 = load i64, i64* %_i4839
  %_bop4870 = add i64 %_i4869, 1
  store i64 %_bop4870, i64* %_i4839
  br label %_cond4845
_post4843:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4836, { i64, [0 x { i64, [0 x i64] }*] }** %_none_conquered4871
  %_raw_array4872 = call i64* @oat_alloc_array(i64 6)
  %_array4873 = bitcast i64* %_raw_array4872 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 6, i64* %_i4875
  br label %_cond4880
_cond4880:
  %_i4876 = load i64, i64* %_i4875
  %_bop4877 = icmp slt i64 %_i4876, 6
  br i1 %_bop4877, label %_body4879, label %_post4878
_body4879:
  %__tmp_array_sym48744881 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array4873
  %_i4882 = load i64, i64* %_i4875
  %_index_ptr4884 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym48744881, i32 0, i32 1, i64 %_i4882
  %_raw_array4885 = call i64* @oat_alloc_array(i64 6)
  %_array4886 = bitcast i64* %_raw_array4885 to { i64, [0 x i64] }*
  store i64 6, i64* %_j4888
  br label %_cond4893
_cond4893:
  %_j4889 = load i64, i64* %_j4888
  %_bop4890 = icmp slt i64 %_j4889, 6
  br i1 %_bop4890, label %_body4892, label %_post4891
_body4892:
  %__tmp_array_sym48874894 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array4886
  %_j4895 = load i64, i64* %_j4888
  %_index_ptr4897 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym48874894, i32 0, i32 1, i64 %_j4895
  %_i4898 = load i64, i64* %_i4875
  %_bop4899 = mul i64 %_i4898, 0
  %_bop4900 = add i64 %_bop4899, 1
  store i64 %_bop4900, i64* %_index_ptr4897
  %_j4901 = load i64, i64* %_j4888
  %_bop4902 = add i64 %_j4901, 1
  store i64 %_bop4902, i64* %_j4888
  br label %_cond4893
_post4891:
  store { i64, [0 x i64] }* %_array4886, { i64, [0 x i64] }** %_index_ptr4884
  %_i4903 = load i64, i64* %_i4875
  %_bop4904 = add i64 %_i4903, 1
  store i64 %_bop4904, i64* %_i4875
  br label %_cond4880
_post4878:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4873, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered4905
  %_raw_array4906 = call i64* @oat_alloc_array(i64 1)
  %_array4907 = bitcast i64* %_raw_array4906 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4908 = call i64* @oat_alloc_array(i64 0)
  %_array4909 = bitcast i64* %_raw_array4908 to { i64, [0 x i64] }*
  %_ind4910 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4907, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4909, { i64, [0 x i64] }** %_ind4910
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4907, { i64, [0 x { i64, [0 x i64] }*] }** %_island4911
  %_raw_array4912 = call i64* @oat_alloc_array(i64 1)
  %_array4913 = bitcast i64* %_raw_array4912 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 1, i64* %_i4915
  br label %_cond4920
_cond4920:
  %_i4916 = load i64, i64* %_i4915
  %_bop4917 = icmp slt i64 %_i4916, 1
  br i1 %_bop4917, label %_body4919, label %_post4918
_body4919:
  %__tmp_array_sym49144921 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array4913
  %_i4922 = load i64, i64* %_i4915
  %_index_ptr4924 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym49144921, i32 0, i32 1, i64 %_i4922
  %_raw_array4925 = call i64* @oat_alloc_array(i64 1)
  %_array4926 = bitcast i64* %_raw_array4925 to { i64, [0 x i64] }*
  store i64 1, i64* %_j4928
  br label %_cond4933
_cond4933:
  %_j4929 = load i64, i64* %_j4928
  %_bop4930 = icmp slt i64 %_j4929, 1
  br i1 %_bop4930, label %_body4932, label %_post4931
_body4932:
  %__tmp_array_sym49274934 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array4926
  %_j4935 = load i64, i64* %_j4928
  %_index_ptr4937 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym49274934, i32 0, i32 1, i64 %_j4935
  %_ideal_341_midterm_score4938 = load { i64, [1 x i64] }*, { i64, [1 x i64] }** @ideal_341_midterm_score
  %_index_ptr4940 = getelementptr { i64, [1 x i64] }, { i64, [1 x i64] }* %_ideal_341_midterm_score4938, i32 0, i32 1, i32 0
  %_index4941 = load i64, i64* %_index_ptr4940
  %_kesha_to_fling4942 = load i1, i1* @kesha_to_fling
  %_professor4943 = load [11 x i8]*, [11 x i8]** @professor
  %_cast4944 = bitcast [11 x i8]* %_professor4943 to i8*
  %_result4945 = call { i64, [0 x i64] }* @asian_brother_of_foo_named_fui(i8* %_cast4944, i1 %_kesha_to_fling4942, i64 %_index4941)
  %_index_ptr4947 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_result4945, i32 0, i32 1, i32 1
  %_index4948 = load i64, i64* %_index_ptr4947
  store i64 %_index4948, i64* %_index_ptr4937
  %_j4949 = load i64, i64* %_j4928
  %_bop4950 = add i64 %_j4949, 1
  store i64 %_bop4950, i64* %_j4928
  br label %_cond4933
_post4931:
  store { i64, [0 x i64] }* %_array4926, { i64, [0 x i64] }** %_index_ptr4924
  %_i4951 = load i64, i64* %_i4915
  %_bop4952 = add i64 %_i4951, 1
  store i64 %_bop4952, i64* %_i4915
  br label %_cond4920
_post4918:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4913, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland4953
  %_all_conquered4954 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered4905
  store { i64, [0 x { i64, [0 x i64] }*] }* %_all_conquered4954, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered4905
  %_island4955 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_island4911
  store { i64, [0 x { i64, [0 x i64] }*] }* %_island4955, { i64, [0 x { i64, [0 x i64] }*] }** %_temp4956
  %_emptyland4957 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland4953
  store { i64, [0 x { i64, [0 x i64] }*] }* %_emptyland4957, { i64, [0 x { i64, [0 x i64] }*] }** %_island4911
  %_temp4958 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_temp4956
  store { i64, [0 x { i64, [0 x i64] }*] }* %_temp4958, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland4953
  %_str4960 = getelementptr [20 x i8], [20 x i8]* @_str_arr4959, i32 0, i32 0
  call void @print_string(i8* %_str4960)
  %_territory_a4962 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_a4785
  %_result4963 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_territory_a4962, i64 4, i64 4)
  store i64 %_result4963, i64* %_a4964
  %_territory_b4965 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_b4812
  %_result4966 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_territory_b4965, i64 3, i64 5)
  store i64 %_result4966, i64* %_b4967
  %_territory_c4968 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_c4833
  %_result4969 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_territory_c4968, i64 3, i64 3)
  store i64 %_result4969, i64* %_c4970
  %_none_conquered4971 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_none_conquered4871
  %_result4972 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_none_conquered4971, i64 4, i64 2)
  store i64 %_result4972, i64* %_none4973
  %_all_conquered4974 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered4905
  %_result4975 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_all_conquered4974, i64 6, i64 6)
  store i64 %_result4975, i64* %_all4976
  %_island4977 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_island4911
  %_result4978 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_island4977, i64 1, i64 1)
  store i64 %_result4978, i64* %_i4979
  %_emptyland4980 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland4953
  %_result4981 = call i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %_emptyland4980, i64 0, i64 0)
  store i64 %_result4981, i64* %_e4982
  %_a4983 = load i64, i64* %_a4964
  %_bop4984 = icmp eq i64 %_a4983, 3
  %_b4985 = load i64, i64* %_b4967
  %_bop4986 = icmp eq i64 %_b4985, 1
  %_bop4987 = and i1 %_bop4984, %_bop4986
  %_c4988 = load i64, i64* %_c4970
  %_bop4989 = icmp eq i64 %_c4988, 5
  %_bop4990 = and i1 %_bop4987, %_bop4989
  %_none4991 = load i64, i64* %_none4973
  %_bop4992 = icmp eq i64 %_none4991, 0
  %_bop4993 = and i1 %_bop4990, %_bop4992
  %_all4994 = load i64, i64* %_all4976
  %_bop4995 = icmp eq i64 %_all4994, 1
  %_bop4996 = and i1 %_bop4993, %_bop4995
  %_i4997 = load i64, i64* %_i4979
  %_bop4998 = icmp eq i64 %_i4997, 1
  %_bop4999 = and i1 %_bop4996, %_bop4998
  %_e5000 = load i64, i64* %_e4982
  %_bop5001 = icmp eq i64 %_e5000, 0
  %_bop5002 = and i1 %_bop4999, %_bop5001
  br i1 %_bop5002, label %_then5008, label %_else5007
_then5008:
  %_str5004 = getelementptr [38 x i8], [38 x i8]* @_str_arr5003, i32 0, i32 0
  call void @print_string(i8* %_str5004)
  br label %_merge5006
_else5007:
  br label %_merge5006
_merge5006:
  %_a5009 = load i64, i64* %_a4964
  %_b5010 = load i64, i64* %_b4967
  %_bop5011 = add i64 %_a5009, %_b5010
  %_c5012 = load i64, i64* %_c4970
  %_bop5013 = add i64 %_bop5011, %_c5012
  %_none5014 = load i64, i64* %_none4973
  %_bop5015 = add i64 %_bop5013, %_none5014
  %_all5016 = load i64, i64* %_all4976
  %_bop5017 = add i64 %_bop5015, %_all5016
  %_i5018 = load i64, i64* %_i4979
  %_bop5019 = add i64 %_bop5017, %_i5018
  %_e5020 = load i64, i64* %_e4982
  %_bop5021 = add i64 %_bop5019, %_e5020
  store i64 %_bop5021, i64* %_sum5022
  %_sum5023 = load i64, i64* %_sum5022
  ret i64 %_sum5023
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
