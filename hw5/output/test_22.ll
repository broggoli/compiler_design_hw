; generated from: hw5programs/compile_builtin_argument.oat
target triple = "x86_64-unknown-linux"
@_str_arr148 = global [3 x i8] c"ab\00"

define void @run2(void (i8*)* %_f153, i8* %_arg151) {
  %_f154 = alloca void (i8*)*
  %_arg152 = alloca i8*
  store void (i8*)* %_f153, void (i8*)** %_f154
  store i8* %_arg151, i8** %_arg152
  %_f155 = load void (i8*)*, void (i8*)** %_f154
  %_arg156 = load i8*, i8** %_arg152
  call void %_f155(i8* %_arg156)
  %_f158 = load void (i8*)*, void (i8*)** %_f154
  %_arg159 = load i8*, i8** %_arg152
  call void %_f158(i8* %_arg159)
  ret void
}

define i64 @program(i64 %_argc146, { i64, [0 x i8*] }* %_argv144) {
  %_argc147 = alloca i64
  %_argv145 = alloca { i64, [0 x i8*] }*
  store i64 %_argc146, i64* %_argc147
  store { i64, [0 x i8*] }* %_argv144, { i64, [0 x i8*] }** %_argv145
  %_str149 = getelementptr [3 x i8], [3 x i8]* @_str_arr148, i32 0, i32 0
  call void @run2(void (i8*)* @print_string, i8* %_str149)
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
