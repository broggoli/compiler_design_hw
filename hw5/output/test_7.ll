; generated from: oatprograms/run48.oat
target triple = "x86_64-unknown-linux"
@a = global i64 1

define i64 @f() {
  %_a1937 = load i64, i64* @a
  %_bop1938 = add i64 %_a1937, 1
  store i64 %_bop1938, i64* @a
  %_a1939 = load i64, i64* @a
  ret i64 %_a1939
}

define i64 @program(i64 %_argc1904, { i64, [0 x i8*] }* %_argv1902) {
  %_argc1905 = alloca i64
  %_argv1903 = alloca { i64, [0 x i8*] }*
  %_i1911 = alloca i64
  %_b1925 = alloca { i64, [0 x i64] }*
  store i64 %_argc1904, i64* %_argc1905
  store { i64, [0 x i8*] }* %_argv1902, { i64, [0 x i8*] }** %_argv1903
  %_result1906 = call i64 @f()
  %_raw_array1907 = call i64* @oat_alloc_array(i64 %_result1906)
  %_array1908 = bitcast i64* %_raw_array1907 to { i64, [0 x i64] }*
  %_result1910 = call i64 @f()
  store i64 %_result1910, i64* %_i1911
  br label %_cond1917
_cond1917:
  %_i1912 = load i64, i64* %_i1911
  %_result1913 = call i64 @f()
  %_bop1914 = icmp slt i64 %_i1912, %_result1913
  br i1 %_bop1914, label %_body1916, label %_post1915
_body1916:
  %__tmp_array_sym19091918 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1908
  %_i1919 = load i64, i64* %_i1911
  %_index_ptr1921 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym19091918, i32 0, i32 1, i64 %_i1919
  %_result1922 = call i64 @f()
  store i64 %_result1922, i64* %_index_ptr1921
  %_i1923 = load i64, i64* %_i1911
  %_bop1924 = add i64 %_i1923, 1
  store i64 %_bop1924, i64* %_i1911
  br label %_cond1917
_post1915:
  store { i64, [0 x i64] }* %_array1908, { i64, [0 x i64] }** %_b1925
  %_a1926 = load i64, i64* @a
  %_b1927 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b1925
  %_index_ptr1929 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_b1927, i32 0, i32 1, i32 0
  %_index1930 = load i64, i64* %_index_ptr1929
  %_bop1931 = add i64 %_a1926, %_index1930
  %_b1932 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b1925
  %_index_ptr1934 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_b1932, i32 0, i32 1, i32 1
  %_index1935 = load i64, i64* %_index_ptr1934
  %_bop1936 = add i64 %_bop1931, %_index1935
  ret i64 %_bop1936
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
