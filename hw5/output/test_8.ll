; generated from: oatprograms/lib15.oat
target triple = "x86_64-unknown-linux"
define i8* @sub(i8* %_str2168, i64 %_start2166, i64 %_len2164) {
  %_str2169 = alloca i8*
  %_start2167 = alloca i64
  %_len2165 = alloca i64
  %_arr2172 = alloca { i64, [0 x i64] }*
  %_i2178 = alloca i64
  %_r2198 = alloca { i64, [0 x i64] }*
  store i8* %_str2168, i8** %_str2169
  store i64 %_start2166, i64* %_start2167
  store i64 %_len2164, i64* %_len2165
  %_str2170 = load i8*, i8** %_str2169
  %_result2171 = call { i64, [0 x i64] }* @array_of_string(i8* %_str2170)
  store { i64, [0 x i64] }* %_result2171, { i64, [0 x i64] }** %_arr2172
  %_len2173 = load i64, i64* %_len2165
  %_raw_array2174 = call i64* @oat_alloc_array(i64 %_len2173)
  %_array2175 = bitcast i64* %_raw_array2174 to { i64, [0 x i64] }*
  %_len2177 = load i64, i64* %_len2165
  store i64 %_len2177, i64* %_i2178
  br label %_cond2184
_cond2184:
  %_i2179 = load i64, i64* %_i2178
  %_len2180 = load i64, i64* %_len2165
  %_bop2181 = icmp slt i64 %_i2179, %_len2180
  br i1 %_bop2181, label %_body2183, label %_post2182
_body2183:
  %__tmp_array_sym21762185 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array2175
  %_i2186 = load i64, i64* %_i2178
  %_index_ptr2188 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym21762185, i32 0, i32 1, i64 %_i2186
  %_arr2189 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr2172
  %_i2190 = load i64, i64* %_i2178
  %_start2191 = load i64, i64* %_start2167
  %_bop2192 = add i64 %_i2190, %_start2191
  %_index_ptr2194 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_arr2189, i32 0, i32 1, i64 %_bop2192
  %_index2195 = load i64, i64* %_index_ptr2194
  store i64 %_index2195, i64* %_index_ptr2188
  %_i2196 = load i64, i64* %_i2178
  %_bop2197 = add i64 %_i2196, 1
  store i64 %_bop2197, i64* %_i2178
  br label %_cond2184
_post2182:
  store { i64, [0 x i64] }* %_array2175, { i64, [0 x i64] }** %_r2198
  %_r2199 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r2198
  %_result2200 = call i8* @string_of_array({ i64, [0 x i64] }* %_r2199)
  ret i8* %_result2200
}

define i64 @program(i64 %_argc2156, { i64, [0 x i8*] }* %_argv2154) {
  %_argc2157 = alloca i64
  %_argv2155 = alloca { i64, [0 x i8*] }*
  store i64 %_argc2156, i64* %_argc2157
  store { i64, [0 x i8*] }* %_argv2154, { i64, [0 x i8*] }** %_argv2155
  %_argv2158 = load { i64, [0 x i8*] }*, { i64, [0 x i8*] }** %_argv2155
  %_index_ptr2160 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_argv2158, i32 0, i32 1, i32 1
  %_index2161 = load i8*, i8** %_index_ptr2160
  %_result2162 = call i8* @sub(i8* %_index2161, i64 3, i64 5)
  call void @print_string(i8* %_result2162)
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
