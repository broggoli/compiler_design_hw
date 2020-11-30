; generated from: oatprograms/run14.oat
target triple = "x86_64-unknown-linux"
define i64 @f({ i64, [0 x i64] }* %_a1369) {
  %_a1370 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_a1369, { i64, [0 x i64] }** %_a1370
  %_a1371 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1370
  %_index_ptr1373 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a1371, i32 0, i32 1, i32 1
  %_index1374 = load i64, i64* %_index_ptr1373
  ret i64 %_index1374
}

define i64 @g(i64 %_x1334) {
  %_x1335 = alloca i64
  %_i1339 = alloca i64
  %_arr1351 = alloca { i64, [0 x i64] }*
  %_i1352 = alloca i64
  store i64 %_x1334, i64* %_x1335
  %_raw_array1336 = call i64* @oat_alloc_array(i64 3)
  %_array1337 = bitcast i64* %_raw_array1336 to { i64, [0 x i64] }*
  store i64 3, i64* %_i1339
  br label %_cond1344
_cond1344:
  %_i1340 = load i64, i64* %_i1339
  %_bop1341 = icmp slt i64 %_i1340, 3
  br i1 %_bop1341, label %_body1343, label %_post1342
_body1343:
  %__tmp_array_sym13381345 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1337
  %_i1346 = load i64, i64* %_i1339
  %_index_ptr1348 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym13381345, i32 0, i32 1, i64 %_i1346
  store i64 0, i64* %_index_ptr1348
  %_i1349 = load i64, i64* %_i1339
  %_bop1350 = add i64 %_i1349, 1
  store i64 %_bop1350, i64* %_i1339
  br label %_cond1344
_post1342:
  store { i64, [0 x i64] }* %_array1337, { i64, [0 x i64] }** %_arr1351
  store i64 0, i64* %_i1352
  br label %_cond1357
_cond1357:
  %_i1353 = load i64, i64* %_i1352
  %_bop1354 = icmp slt i64 %_i1353, 3
  br i1 %_bop1354, label %_body1356, label %_post1355
_body1356:
  %_arr1358 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1351
  %_i1359 = load i64, i64* %_i1352
  %_index_ptr1361 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr1358, i32 0, i32 1, i64 %_i1359
  %_x1362 = load i64, i64* %_x1335
  store i64 %_x1362, i64* %_index_ptr1361
  %_i1363 = load i64, i64* %_i1352
  %_bop1364 = add i64 %_i1363, 1
  store i64 %_bop1364, i64* %_i1352
  br label %_cond1357
_post1355:
  %_arr1365 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1351
  %_index_ptr1367 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr1365, i32 0, i32 1, i32 1
  %_index1368 = load i64, i64* %_index_ptr1367
  ret i64 %_index1368
}

define i64 @program(i64 %_argc1228, { i64, [0 x i8*] }* %_argv1226) {
  %_argc1229 = alloca i64
  %_argv1227 = alloca { i64, [0 x i8*] }*
  %_i1233 = alloca i64
  %_a1245 = alloca { i64, [0 x i64] }*
  %_i1246 = alloca i64
  %_i1262 = alloca i64
  %_arr1274 = alloca { i64, [0 x i64] }*
  %_i1275 = alloca i64
  %_i1293 = alloca i64
  %_arr01305 = alloca { i64, [0 x i64] }*
  %_i1306 = alloca i64
  store i64 %_argc1228, i64* %_argc1229
  store { i64, [0 x i8*] }* %_argv1226, { i64, [0 x i8*] }** %_argv1227
  %_raw_array1230 = call i64* @oat_alloc_array(i64 3)
  %_array1231 = bitcast i64* %_raw_array1230 to { i64, [0 x i64] }*
  store i64 3, i64* %_i1233
  br label %_cond1238
_cond1238:
  %_i1234 = load i64, i64* %_i1233
  %_bop1235 = icmp slt i64 %_i1234, 3
  br i1 %_bop1235, label %_body1237, label %_post1236
_body1237:
  %__tmp_array_sym12321239 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1231
  %_i1240 = load i64, i64* %_i1233
  %_index_ptr1242 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym12321239, i32 0, i32 1, i64 %_i1240
  store i64 0, i64* %_index_ptr1242
  %_i1243 = load i64, i64* %_i1233
  %_bop1244 = add i64 %_i1243, 1
  store i64 %_bop1244, i64* %_i1233
  br label %_cond1238
_post1236:
  store { i64, [0 x i64] }* %_array1231, { i64, [0 x i64] }** %_a1245
  store i64 0, i64* %_i1246
  br label %_cond1251
_cond1251:
  %_i1247 = load i64, i64* %_i1246
  %_bop1248 = icmp slt i64 %_i1247, 3
  br i1 %_bop1248, label %_body1250, label %_post1249
_body1250:
  %_a1252 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1245
  %_i1253 = load i64, i64* %_i1246
  %_index_ptr1255 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a1252, i32 0, i32 1, i64 %_i1253
  %_i1256 = load i64, i64* %_i1246
  store i64 %_i1256, i64* %_index_ptr1255
  %_i1257 = load i64, i64* %_i1246
  %_bop1258 = add i64 %_i1257, 1
  store i64 %_bop1258, i64* %_i1246
  br label %_cond1251
_post1249:
  %_raw_array1259 = call i64* @oat_alloc_array(i64 4)
  %_array1260 = bitcast i64* %_raw_array1259 to { i64, [0 x i64] }*
  store i64 4, i64* %_i1262
  br label %_cond1267
_cond1267:
  %_i1263 = load i64, i64* %_i1262
  %_bop1264 = icmp slt i64 %_i1263, 4
  br i1 %_bop1264, label %_body1266, label %_post1265
_body1266:
  %__tmp_array_sym12611268 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1260
  %_i1269 = load i64, i64* %_i1262
  %_index_ptr1271 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym12611268, i32 0, i32 1, i64 %_i1269
  store i64 0, i64* %_index_ptr1271
  %_i1272 = load i64, i64* %_i1262
  %_bop1273 = add i64 %_i1272, 1
  store i64 %_bop1273, i64* %_i1262
  br label %_cond1267
_post1265:
  store { i64, [0 x i64] }* %_array1260, { i64, [0 x i64] }** %_arr1274
  store i64 0, i64* %_i1275
  br label %_cond1280
_cond1280:
  %_i1276 = load i64, i64* %_i1275
  %_bop1277 = icmp slt i64 %_i1276, 4
  br i1 %_bop1277, label %_body1279, label %_post1278
_body1279:
  %_arr1281 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1274
  %_i1282 = load i64, i64* %_i1275
  %_index_ptr1284 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr1281, i32 0, i32 1, i64 %_i1282
  %_i1285 = load i64, i64* %_i1275
  %_i1286 = load i64, i64* %_i1275
  %_bop1287 = mul i64 %_i1285, %_i1286
  store i64 %_bop1287, i64* %_index_ptr1284
  %_i1288 = load i64, i64* %_i1275
  %_bop1289 = add i64 %_i1288, 1
  store i64 %_bop1289, i64* %_i1275
  br label %_cond1280
_post1278:
  %_raw_array1290 = call i64* @oat_alloc_array(i64 3)
  %_array1291 = bitcast i64* %_raw_array1290 to { i64, [0 x i64] }*
  store i64 3, i64* %_i1293
  br label %_cond1298
_cond1298:
  %_i1294 = load i64, i64* %_i1293
  %_bop1295 = icmp slt i64 %_i1294, 3
  br i1 %_bop1295, label %_body1297, label %_post1296
_body1297:
  %__tmp_array_sym12921299 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1291
  %_i1300 = load i64, i64* %_i1293
  %_index_ptr1302 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym12921299, i32 0, i32 1, i64 %_i1300
  store i64 0, i64* %_index_ptr1302
  %_i1303 = load i64, i64* %_i1293
  %_bop1304 = add i64 %_i1303, 1
  store i64 %_bop1304, i64* %_i1293
  br label %_cond1298
_post1296:
  store { i64, [0 x i64] }* %_array1291, { i64, [0 x i64] }** %_arr01305
  store i64 0, i64* %_i1306
  br label %_cond1311
_cond1311:
  %_i1307 = load i64, i64* %_i1306
  %_bop1308 = icmp slt i64 %_i1307, 3
  br i1 %_bop1308, label %_body1310, label %_post1309
_body1310:
  %_arr01312 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr01305
  %_i1313 = load i64, i64* %_i1306
  %_index_ptr1315 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr01312, i32 0, i32 1, i64 %_i1313
  %_i1316 = load i64, i64* %_i1306
  %_bop1317 = mul i64 2, %_i1316
  store i64 %_bop1317, i64* %_index_ptr1315
  %_i1318 = load i64, i64* %_i1306
  %_bop1319 = add i64 %_i1318, 1
  store i64 %_bop1319, i64* %_i1306
  br label %_cond1311
_post1309:
  %_arr1320 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1274
  %_index_ptr1322 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr1320, i32 0, i32 1, i32 3
  %_index1323 = load i64, i64* %_index_ptr1322
  %_a1324 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1245
  %_index_ptr1326 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_a1324, i32 0, i32 1, i32 1
  %_index1327 = load i64, i64* %_index_ptr1326
  %_bop1328 = add i64 %_index1323, %_index1327
  %_arr01329 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr01305
  %_result1330 = call i64 @f({ i64, [0 x i64] }* %_arr01329)
  %_bop1331 = add i64 %_bop1328, %_result1330
  %_result1332 = call i64 @g(i64 4)
  %_bop1333 = add i64 %_bop1331, %_result1332
  ret i64 %_bop1333
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
