; generated from: oatprograms/run42.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %_argc756, { i64, [0 x i8*] }* %_argv754) {
  %_argc757 = alloca i64
  %_argv755 = alloca { i64, [0 x i8*] }*
  %_i761 = alloca i64
  %_j774 = alloca i64
  %_a1788 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i792 = alloca i64
  %_j805 = alloca i64
  %_a2819 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i823 = alloca i64
  %_j836 = alloca i64
  %_a3850 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i854 = alloca i64
  %_j867 = alloca i64
  %_a4881 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i885 = alloca i64
  %_a5898 = alloca { i64, [0 x i64] }*
  store i64 %_argc756, i64* %_argc757
  store { i64, [0 x i8*] }* %_argv754, { i64, [0 x i8*] }** %_argv755
  %_raw_array758 = call i64* @oat_alloc_array(i64 3)
  %_array759 = bitcast i64* %_raw_array758 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 3, i64* %_i761
  br label %_cond766
_cond766:
  %_i762 = load i64, i64* %_i761
  %_bop763 = icmp slt i64 %_i762, 3
  br i1 %_bop763, label %_body765, label %_post764
_body765:
  %__tmp_array_sym760767 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array759
  %_i768 = load i64, i64* %_i761
  %_index_ptr770 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym760767, i32 0, i32 1, i64 %_i768
  %_raw_array771 = call i64* @oat_alloc_array(i64 1)
  %_array772 = bitcast i64* %_raw_array771 to { i64, [0 x i64] }*
  store i64 1, i64* %_j774
  br label %_cond779
_cond779:
  %_j775 = load i64, i64* %_j774
  %_bop776 = icmp slt i64 %_j775, 1
  br i1 %_bop776, label %_body778, label %_post777
_body778:
  %__tmp_array_sym773780 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array772
  %_j781 = load i64, i64* %_j774
  %_index_ptr783 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym773780, i32 0, i32 1, i64 %_j781
  store i64 0, i64* %_index_ptr783
  %_j784 = load i64, i64* %_j774
  %_bop785 = add i64 %_j784, 1
  store i64 %_bop785, i64* %_j774
  br label %_cond779
_post777:
  store { i64, [0 x i64] }* %_array772, { i64, [0 x i64] }** %_index_ptr770
  %_i786 = load i64, i64* %_i761
  %_bop787 = add i64 %_i786, 1
  store i64 %_bop787, i64* %_i761
  br label %_cond766
_post764:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array759, { i64, [0 x { i64, [0 x i64] }*] }** %_a1788
  %_raw_array789 = call i64* @oat_alloc_array(i64 3)
  %_array790 = bitcast i64* %_raw_array789 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 3, i64* %_i792
  br label %_cond797
_cond797:
  %_i793 = load i64, i64* %_i792
  %_bop794 = icmp slt i64 %_i793, 3
  br i1 %_bop794, label %_body796, label %_post795
_body796:
  %__tmp_array_sym791798 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array790
  %_i799 = load i64, i64* %_i792
  %_index_ptr801 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym791798, i32 0, i32 1, i64 %_i799
  %_raw_array802 = call i64* @oat_alloc_array(i64 1)
  %_array803 = bitcast i64* %_raw_array802 to { i64, [0 x i64] }*
  store i64 1, i64* %_j805
  br label %_cond810
_cond810:
  %_j806 = load i64, i64* %_j805
  %_bop807 = icmp slt i64 %_j806, 1
  br i1 %_bop807, label %_body809, label %_post808
_body809:
  %__tmp_array_sym804811 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array803
  %_j812 = load i64, i64* %_j805
  %_index_ptr814 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym804811, i32 0, i32 1, i64 %_j812
  store i64 0, i64* %_index_ptr814
  %_j815 = load i64, i64* %_j805
  %_bop816 = add i64 %_j815, 1
  store i64 %_bop816, i64* %_j805
  br label %_cond810
_post808:
  store { i64, [0 x i64] }* %_array803, { i64, [0 x i64] }** %_index_ptr801
  %_i817 = load i64, i64* %_i792
  %_bop818 = add i64 %_i817, 1
  store i64 %_bop818, i64* %_i792
  br label %_cond797
_post795:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array790, { i64, [0 x { i64, [0 x i64] }*] }** %_a2819
  %_raw_array820 = call i64* @oat_alloc_array(i64 3)
  %_array821 = bitcast i64* %_raw_array820 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 3, i64* %_i823
  br label %_cond828
_cond828:
  %_i824 = load i64, i64* %_i823
  %_bop825 = icmp slt i64 %_i824, 3
  br i1 %_bop825, label %_body827, label %_post826
_body827:
  %__tmp_array_sym822829 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array821
  %_i830 = load i64, i64* %_i823
  %_index_ptr832 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym822829, i32 0, i32 1, i64 %_i830
  %_raw_array833 = call i64* @oat_alloc_array(i64 1)
  %_array834 = bitcast i64* %_raw_array833 to { i64, [0 x i64] }*
  store i64 1, i64* %_j836
  br label %_cond841
_cond841:
  %_j837 = load i64, i64* %_j836
  %_bop838 = icmp slt i64 %_j837, 1
  br i1 %_bop838, label %_body840, label %_post839
_body840:
  %__tmp_array_sym835842 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array834
  %_j843 = load i64, i64* %_j836
  %_index_ptr845 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym835842, i32 0, i32 1, i64 %_j843
  store i64 0, i64* %_index_ptr845
  %_j846 = load i64, i64* %_j836
  %_bop847 = add i64 %_j846, 1
  store i64 %_bop847, i64* %_j836
  br label %_cond841
_post839:
  store { i64, [0 x i64] }* %_array834, { i64, [0 x i64] }** %_index_ptr832
  %_i848 = load i64, i64* %_i823
  %_bop849 = add i64 %_i848, 1
  store i64 %_bop849, i64* %_i823
  br label %_cond828
_post826:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array821, { i64, [0 x { i64, [0 x i64] }*] }** %_a3850
  %_raw_array851 = call i64* @oat_alloc_array(i64 3)
  %_array852 = bitcast i64* %_raw_array851 to { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 3, i64* %_i854
  br label %_cond859
_cond859:
  %_i855 = load i64, i64* %_i854
  %_bop856 = icmp slt i64 %_i855, 3
  br i1 %_bop856, label %_body858, label %_post857
_body858:
  %__tmp_array_sym853860 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_array852
  %_i861 = load i64, i64* %_i854
  %_index_ptr863 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %__tmp_array_sym853860, i32 0, i32 1, i64 %_i861
  %_raw_array864 = call i64* @oat_alloc_array(i64 1)
  %_array865 = bitcast i64* %_raw_array864 to { i64, [0 x i64] }*
  store i64 1, i64* %_j867
  br label %_cond872
_cond872:
  %_j868 = load i64, i64* %_j867
  %_bop869 = icmp slt i64 %_j868, 1
  br i1 %_bop869, label %_body871, label %_post870
_body871:
  %__tmp_array_sym866873 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array865
  %_j874 = load i64, i64* %_j867
  %_index_ptr876 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym866873, i32 0, i32 1, i64 %_j874
  store i64 0, i64* %_index_ptr876
  %_j877 = load i64, i64* %_j867
  %_bop878 = add i64 %_j877, 1
  store i64 %_bop878, i64* %_j867
  br label %_cond872
_post870:
  store { i64, [0 x i64] }* %_array865, { i64, [0 x i64] }** %_index_ptr863
  %_i879 = load i64, i64* %_i854
  %_bop880 = add i64 %_i879, 1
  store i64 %_bop880, i64* %_i854
  br label %_cond859
_post857:
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array852, { i64, [0 x { i64, [0 x i64] }*] }** %_a4881
  %_raw_array882 = call i64* @oat_alloc_array(i64 3)
  %_array883 = bitcast i64* %_raw_array882 to { i64, [0 x i64] }*
  store i64 3, i64* %_i885
  br label %_cond890
_cond890:
  %_i886 = load i64, i64* %_i885
  %_bop887 = icmp slt i64 %_i886, 3
  br i1 %_bop887, label %_body889, label %_post888
_body889:
  %__tmp_array_sym884891 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array883
  %_i892 = load i64, i64* %_i885
  %_index_ptr894 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %__tmp_array_sym884891, i32 0, i32 1, i64 %_i892
  %_i895 = load i64, i64* %_i885
  store i64 %_i895, i64* %_index_ptr894
  %_i896 = load i64, i64* %_i885
  %_bop897 = add i64 %_i896, 1
  store i64 %_bop897, i64* %_i885
  br label %_cond890
_post888:
  store { i64, [0 x i64] }* %_array883, { i64, [0 x i64] }** %_a5898
  %_a2899 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2819
  %_index_ptr901 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a2899, i32 0, i32 1, i32 0
  %_a5902 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a5898
  store { i64, [0 x i64] }* %_a5902, { i64, [0 x i64] }** %_index_ptr901
  %_a2903 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2819
  %_index_ptr905 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a2903, i32 0, i32 1, i32 0
  %_index906 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr905
  %_index_ptr908 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index906, i32 0, i32 1, i32 0
  store i64 2, i64* %_index_ptr908
  %_a2909 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2819
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a2909, { i64, [0 x { i64, [0 x i64] }*] }** %_a1788
  %_a1910 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1788
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a1910, { i64, [0 x { i64, [0 x i64] }*] }** %_a3850
  %_a4911 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a4881
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a4911, { i64, [0 x { i64, [0 x i64] }*] }** %_a1788
  %_a3912 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a3850
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a3912, { i64, [0 x { i64, [0 x i64] }*] }** %_a2819
  %_a2913 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2819
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a2913, { i64, [0 x { i64, [0 x i64] }*] }** %_a4881
  %_a4914 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a4881
  store { i64, [0 x { i64, [0 x i64] }*] }* %_a4914, { i64, [0 x { i64, [0 x i64] }*] }** %_a3850
  %_a3915 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a3850
  %_index_ptr917 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_a3915, i32 0, i32 1, i32 0
  %_index918 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr917
  %_index_ptr920 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index918, i32 0, i32 1, i32 0
  %_index921 = load i64, i64* %_index_ptr920
  ret i64 %_index921
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
