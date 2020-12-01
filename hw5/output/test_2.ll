; generated from: hw5programs/compile_struct_array.oat
target triple = "x86_64-unknown-linux"
%Test = type { { i64, [0 x i64] }*, i64, { i64, [0 x i64] }* }

@arr_x = global { i64, [3 x i64] }* @_global_arr212
@_global_arr212 = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 3, i64 4, i64 5 ] }
@arr_z = global { i64, [3 x i64] }* @_global_arr211
@_global_arr211 = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 4, i64 5, i64 6 ] }

define i64 @program(i64 %_argc181, { i64, [0 x i8*] }* %_argv179) {
  %_argc182 = alloca i64
  %_argv180 = alloca { i64, [0 x i8*] }*
  %_t193 = alloca %Test*
  store i64 %_argc181, i64* %_argc182
  store { i64, [0 x i8*] }* %_argv179, { i64, [0 x i8*] }** %_argv180
  %_raw_struct183 = call i64* @oat_malloc(i64 3)
  %_struct184 = bitcast i64* %_raw_struct183 to %Test*
  %_arr_z190 = load { i64, [3 x i64] }*, { i64, [3 x i64] }** @arr_z
  %_index_ptr191 = getelementptr %Test, %Test* %_struct184, i32 0, i32 2
  store { i64, [3 x i64] }* %_arr_z190, { i64, [3 x i64] }** %_index_ptr191
  %_index_ptr188 = getelementptr %Test, %Test* %_struct184, i32 0, i32 1
  store i64 3, i64* %_index_ptr188
  %_arr_x185 = load { i64, [3 x i64] }*, { i64, [3 x i64] }** @arr_x
  %_index_ptr186 = getelementptr %Test, %Test* %_struct184, i32 0, i32 0
  store { i64, [3 x i64] }* %_arr_x185, { i64, [3 x i64] }** %_index_ptr186
  store %Test* %_struct184, %Test** %_t193
  %_t194 = load %Test*, %Test** %_t193
  %_index_ptr195 = getelementptr %Test, %Test* %_t194, i32 0, i32 0
  %_proj197 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr195
  %_cast198 = bitcast { i64, [0 x i64] }* %_proj197 to i64*
  call void @oat_assert_array_length(i64* %_cast198, i64 0)
  %_index_ptr200 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_proj197, i32 0, i32 1, i32 0
  %_index201 = load i64, i64* %_index_ptr200
  %_t202 = load %Test*, %Test** %_t193
  %_index_ptr203 = getelementptr %Test, %Test* %_t202, i32 0, i32 2
  %_proj205 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr203
  %_cast206 = bitcast { i64, [0 x i64] }* %_proj205 to i64*
  call void @oat_assert_array_length(i64* %_cast206, i64 1)
  %_index_ptr208 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_proj205, i32 0, i32 1, i32 1
  %_index209 = load i64, i64* %_index_ptr208
  %_bop210 = mul i64 %_index201, %_index209
  ret i64 %_bop210
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
