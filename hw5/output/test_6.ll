; generated from: oatprograms/run47.oat
target triple = "x86_64-unknown-linux"
@a = global i64 1

define i64 @f() {
  %_a1899 = load i64, i64* @a
  %_bop1900 = add i64 %_a1899, 1
  store i64 %_bop1900, i64* @a
  %_a1901 = load i64, i64* @a
  ret i64 %_a1901
}

define i64 @program(i64 %_argc1866, { i64, [0 x i8*] }* %_argv1864) {
  %_argc1867 = alloca i64
  %_argv1865 = alloca { i64, [0 x i8*] }*
  %_i1873 = alloca i64
  %_b1887 = alloca { i64, [0 x i64] }*
  store i64 %_argc1866, i64* %_argc1867
  store { i64, [0 x i8*] }* %_argv1864, { i64, [0 x i8*] }** %_argv1865
  %_result1868 = call i64 @f()
  %_raw_array1869 = call i64* @oat_alloc_array(i64 %_result1868)
  %_array1870 = bitcast i64* %_raw_array1869 to { i64, [0 x i64] }*
  %_result1872 = call i64 @f()
  store i64 %_result1872, i64* %_i1873
  br label %_cond1879
_cond1879:
  %_i1874 = load i64, i64* %_i1873
  %_result1875 = call i64 @f()
  %_bop1876 = icmp slt i64 %_i1874, %_result1875
  br i1 %_bop1876, label %_body1878, label %_post1877
_body1878:
  %__tmp_array_sym18711880 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array1870
  %_i1881 = load i64, i64* %_i1873
  %_index_ptr1883 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym18711880, i32 0, i32 1, i64 %_i1881
  %_i1884 = load i64, i64* %_i1873
  store i64 %_i1884, i64* %_index_ptr1883
  %_i1885 = load i64, i64* %_i1873
  %_bop1886 = add i64 %_i1885, 1
  store i64 %_bop1886, i64* %_i1873
  br label %_cond1879
_post1877:
  store { i64, [0 x i64] }* %_array1870, { i64, [0 x i64] }** %_b1887
  %_a1888 = load i64, i64* @a
  %_b1889 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b1887
  %_index_ptr1891 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_b1889, i32 0, i32 1, i32 0
  %_index1892 = load i64, i64* %_index_ptr1891
  %_bop1893 = add i64 %_a1888, %_index1892
  %_b1894 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b1887
  %_index_ptr1896 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_b1894, i32 0, i32 1, i32 1
  %_index1897 = load i64, i64* %_index_ptr1896
  %_bop1898 = add i64 %_bop1893, %_index1897
  ret i64 %_bop1898
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
