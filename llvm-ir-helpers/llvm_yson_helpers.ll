; ModuleID = 'llvm_yson_helpers.cpp'
source_filename = "llvm_yson_helpers.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"struct.std::__y1::array" = type { [6 x i32] }
%"struct.std::__y1::array.36" = type { [16 x i32] }
%"struct.std::__y1::array.38" = type { [6 x i32] }
%class.anon = type { i8 }
%"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo" = type { %class.TBasicString, %class.TBasicString }
%class.TBasicString = type { %class.TIntrusivePtr }
%class.TIntrusivePtr = type { %struct.TStdString* }
%struct.TStdString = type { %struct.TRefCountHolder, %"class.std::__y1::basic_string" }
%struct.TRefCountHolder = type { %class.TAtomicCounter }
%class.TAtomicCounter = type { %"struct.std::__y1::atomic.8" }
%"struct.std::__y1::atomic.8" = type { %"struct.std::__y1::__atomic_base.9" }
%"struct.std::__y1::__atomic_base.9" = type { %"struct.std::__y1::__atomic_base.10" }
%"struct.std::__y1::__atomic_base.10" = type { %"struct.std::__y1::__cxx_atomic_impl.11" }
%"struct.std::__y1::__cxx_atomic_impl.11" = type { %"struct.std::__y1::__cxx_atomic_base_impl.12" }
%"struct.std::__y1::__cxx_atomic_base_impl.12" = type { i64 }
%"class.std::__y1::basic_string" = type { %"class.std::__y1::__compressed_pair.13" }
%"class.std::__y1::__compressed_pair.13" = type { %"struct.std::__y1::__compressed_pair_elem.14" }
%"struct.std::__y1::__compressed_pair_elem.14" = type { %"struct.std::__y1::basic_string<char>::__rep" }
%"struct.std::__y1::basic_string<char>::__rep" = type { %union.anon.15 }
%union.anon.15 = type { %"struct.std::__y1::basic_string<char>::__long" }
%"struct.std::__y1::basic_string<char>::__long" = type { i64, i64, i8* }
%"class.NYT::TErrorCodeRegistry" = type { %class.THashMap, %"class.std::__y1::vector.24" }
%class.THashMap = type { %class.THashTable }
%class.THashTable = type { %class._yhashtable_buckets, i64 }
%class._yhashtable_buckets = type { %struct.__yhashtable_node**, %"class.NPrivate::TReciprocalDivisor" }
%struct.__yhashtable_node = type opaque
%"class.NPrivate::TReciprocalDivisor" = type <{ i64, i32, i8, i8, [2 x i8] }>
%"class.std::__y1::vector.24" = type { %"struct.NYT::TErrorCodeRegistry::TErrorCodeRangeInfo"*, %"struct.NYT::TErrorCodeRegistry::TErrorCodeRangeInfo"*, %"class.std::__y1::__compressed_pair.25" }
%"struct.NYT::TErrorCodeRegistry::TErrorCodeRangeInfo" = type { i32, i32, %class.TBasicString, %"class.std::__y1::function" }
%"class.std::__y1::function" = type { %"class.std::__y1::__function::__value_func" }
%"class.std::__y1::__function::__value_func" = type { %"struct.std::__y1::aligned_storage<24, 16>::type", %"class.std::__y1::__function::__base"*, [8 x i8] }
%"struct.std::__y1::aligned_storage<24, 16>::type" = type { [32 x i8] }
%"class.std::__y1::__function::__base" = type opaque
%"class.std::__y1::__compressed_pair.25" = type { %"struct.std::__y1::__compressed_pair_elem.26" }
%"struct.std::__y1::__compressed_pair_elem.26" = type { %"struct.NYT::TErrorCodeRegistry::TErrorCodeRangeInfo"* }
%"class.std::type_info" = type { i32 (...)**, i8* }
%"class.NYT::TRefCounter" = type { %"struct.std::__y1::atomic", %"struct.std::__y1::atomic" }
%"struct.std::__y1::atomic" = type { %"struct.std::__y1::__atomic_base" }
%"struct.std::__y1::__atomic_base" = type { %"struct.std::__y1::__atomic_base.0" }
%"struct.std::__y1::__atomic_base.0" = type { %"struct.std::__y1::__cxx_atomic_impl" }
%"struct.std::__y1::__cxx_atomic_impl" = type { %"struct.std::__y1::__cxx_atomic_base_impl" }
%"struct.std::__y1::__cxx_atomic_base_impl" = type { i32 }
%"struct.NYT::TSharedRangeHolder" = type { %"class.NYT::TRefCounted" }
%"class.NYT::TRefCounted" = type { %"class.NYT::TRefCountedBase", %"class.NYT::TRefCounter" }
%"class.NYT::TRefCountedBase" = type { i32 (...)** }
%"class.NYT::TSharedRefArrayImpl" = type <{ %"struct.NYT::TSharedRangeHolder", i64, i64, %"class.NYT::TStrongTypedef", [4 x i8] }>
%"class.NYT::TStrongTypedef" = type { i32 }
%class.anon.1 = type { i8 }
%class.anon.3 = type { i8 }
%class.anon.5 = type { i8 }
%"struct.NYT::NYTree::IAttributeDictionary" = type { %"class.NYT::TRefCounted" }
%"class.NYT::NYson::TYsonPullParserCursor" = type { i8, %"class.NYT::NYson::TYsonItem", %"class.NYT::NYson::TYsonPullParser"* }
%"class.NYT::NYson::TYsonItem" = type { %"union.NYT::NYson::TYsonItem::TData", i8 }
%"union.NYT::NYson::TYsonItem::TData" = type <{ i64, [4 x i8] }>
%"class.NYT::NYson::TYsonPullParser" = type <{ %"class.NYT::NYson::NDetail::TZeroCopyInputStreamReader", %"class.NYT::NYson::NDetail::TLexerBase", %"class.NYT::NYson::NDetail::TYsonSyntaxChecker", i8, [7 x i8] }>
%"class.NYT::NYson::NDetail::TZeroCopyInputStreamReader" = type { %class.IZeroCopyInput*, i8*, i8*, i8*, i64, i8, i8*, %class.IOutputStream* }
%class.IZeroCopyInput = type { %class.IInputStream }
%class.IInputStream = type { i32 (...)** }
%class.IOutputStream = type { i32 (...)** }
%"class.NYT::NYson::NDetail::TLexerBase" = type { %"class.NYT::NYson::NDetail::TCodedStream", %"class.std::__y1::vector", i64 }
%"class.NYT::NYson::NDetail::TCodedStream" = type { %"class.NYT::NYson::NDetail::TCharStream" }
%"class.NYT::NYson::NDetail::TCharStream" = type { %"class.NYT::NYson::NDetail::TReaderWithContext", %"class.NYT::NYson::NDetail::TPositionInfo" }
%"class.NYT::NYson::NDetail::TReaderWithContext" = type { %"class.NYT::NYson::NDetail::TZeroCopyInputStreamReader", i8*, [64 x i8], i64, i64, %"class.NYT::NYson::NDetail::TStaticRingQueue" }
%"class.NYT::NYson::NDetail::TStaticRingQueue" = type { [10 x i8], i64, i64 }
%"class.NYT::NYson::NDetail::TPositionInfo" = type { i64 }
%"class.std::__y1::vector" = type { i8*, i8*, %"class.std::__y1::__compressed_pair" }
%"class.std::__y1::__compressed_pair" = type { %"struct.std::__y1::__compressed_pair_elem" }
%"struct.std::__y1::__compressed_pair_elem" = type { i8* }
%"class.NYT::NYson::NDetail::TYsonSyntaxChecker" = type { %"class.NYT::TCompactVector", i32, i32 }
%"class.NYT::TCompactVector" = type { %union.anon }
%union.anon = type { %"struct.NYT::TCompactVector<NYT::NYson::NDetail::EYsonState, 16>::TOnHeapMeta" }
%"struct.NYT::TCompactVector<NYT::NYson::NDetail::EYsonState, 16>::TOnHeapMeta" = type { [16 x i8], %"struct.NYT::TCompactVectorOnHeapStorage"* }
%"struct.NYT::TCompactVectorOnHeapStorage" = type { i8*, i8*, [0 x i8] }
%"struct.std::__y1::array.33" = type { [6 x %class.TBasicStringBuf] }
%class.TBasicStringBuf = type { %"class.std::__y1::basic_string_view" }
%"class.std::__y1::basic_string_view" = type { i8*, i64 }
%"struct.std::__y1::basic_string<char>::__short" = type { %union.anon.16, [23 x i8] }
%union.anon.16 = type { i8 }
%"class.std::length_error" = type { %"class.std::logic_error" }
%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__y1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__y1::__libcpp_refstring" = type { i8* }
%"struct.std::__y1::array.37" = type { [16 x %class.TBasicStringBuf] }

$_ZNK3NYT20ErrorEnum_EErrorCodeMUlvE_clEv = comdat any

$_ZN3NYT13GetRefCounterEPKNS_18TSharedRangeHolderE = comdat any

$_ZN3NYT17DestroyRefCountedEPKNS_18TSharedRangeHolderE = comdat any

$_ZN3NYT20DeallocateRefCountedEPKNS_18TSharedRangeHolderE = comdat any

$_ZN3NYT13GetRefCounterEPKNS_19TSharedRefArrayImplE = comdat any

$_ZN3NYT17DestroyRefCountedEPKNS_19TSharedRefArrayImplE = comdat any

$_ZN3NYT20DeallocateRefCountedEPKNS_19TSharedRefArrayImplE = comdat any

$_ZNK3NYT4NBus20ErrorEnum_EErrorCodeMUlvE_clEv = comdat any

$_ZNK3NYT4NRpc20ErrorEnum_EErrorCodeMUlvE_clEv = comdat any

$_ZNK3NYT6NYTree20ErrorEnum_EErrorCodeMUlvE_clEv = comdat any

$_ZN3NYT6NYTree13GetRefCounterEPKNS0_20IAttributeDictionaryE = comdat any

$_ZN3NYT6NYTree17DestroyRefCountedEPKNS0_20IAttributeDictionaryE = comdat any

$_ZN3NYT6NYTree20DeallocateRefCountedEPKNS0_20IAttributeDictionaryE = comdat any

$_ZN3NYT11TEnumTraitsINS_10EErrorCodeELb1EE8ToStringES1_ = comdat any

$_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv = comdat any

$_ZNSt4__y120__throw_length_errorEPKc = comdat any

$_ZNSt12length_errorC2EPKc = comdat any

$_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6assignEPKcm = comdat any

$_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv = comdat any

$_ZN3NYT11TEnumTraitsINS_4NBus10EErrorCodeELb1EE8ToStringES2_ = comdat any

$_ZN3NYT11TEnumTraitsINS_4NRpc10EErrorCodeELb1EE8ToStringES2_ = comdat any

$_ZN3NYT11TEnumTraitsINS_6NYTree10EErrorCodeELb1EE8ToStringES2_ = comdat any

$_ZN3NYT20ErrorEnum_EErrorCodeE = comdat any

$_ZN3NYT4NBus20ErrorEnum_EErrorCodeE = comdat any

$_ZN3NYT4NRpc20ErrorEnum_EErrorCodeE = comdat any

$_ZN3NYT6NYTree20ErrorEnum_EErrorCodeE = comdat any

$_ZN3NYT26TEnumTraitsImpl_EErrorCode6ValuesE = comdat any

$_ZTSN3NYT10EErrorCodeE = comdat any

$_ZTIN3NYT10EErrorCodeE = comdat any

$_ZN3NYT26TEnumTraitsImpl_EErrorCode5NamesE = comdat any

$_ZTSN3NYT4NBus10EErrorCodeE = comdat any

$_ZTIN3NYT4NBus10EErrorCodeE = comdat any

$_ZN3NYT4NRpc26TEnumTraitsImpl_EErrorCode6ValuesE = comdat any

$_ZTSN3NYT4NRpc10EErrorCodeE = comdat any

$_ZTIN3NYT4NRpc10EErrorCodeE = comdat any

$_ZN3NYT4NRpc26TEnumTraitsImpl_EErrorCode5NamesE = comdat any

$_ZN3NYT6NYTree26TEnumTraitsImpl_EErrorCode6ValuesE = comdat any

$_ZTSN3NYT6NYTree10EErrorCodeE = comdat any

$_ZTIN3NYT6NYTree10EErrorCodeE = comdat any

$_ZN3NYT6NYTree26TEnumTraitsImpl_EErrorCode5NamesE = comdat any

@_ZN3NYT20ErrorEnum_EErrorCodeE = linkonce_odr dso_local global i8* null, comdat, align 8
@_ZGVN3NYT20ErrorEnum_EErrorCodeE = linkonce_odr dso_local global i64 0, comdat($_ZN3NYT20ErrorEnum_EErrorCodeE), align 8
@_ZN3NYT4NBus20ErrorEnum_EErrorCodeE = linkonce_odr dso_local global i8* null, comdat, align 8
@_ZGVN3NYT4NBus20ErrorEnum_EErrorCodeE = linkonce_odr dso_local global i64 0, comdat($_ZN3NYT4NBus20ErrorEnum_EErrorCodeE), align 8
@_ZN3NYT4NRpc20ErrorEnum_EErrorCodeE = linkonce_odr dso_local global i8* null, comdat, align 8
@_ZGVN3NYT4NRpc20ErrorEnum_EErrorCodeE = linkonce_odr dso_local global i64 0, comdat($_ZN3NYT4NRpc20ErrorEnum_EErrorCodeE), align 8
@_ZN3NYT6NYTree20ErrorEnum_EErrorCodeE = linkonce_odr dso_local global i8* null, comdat, align 8
@_ZGVN3NYT6NYTree20ErrorEnum_EErrorCodeE = linkonce_odr dso_local global i64 0, comdat($_ZN3NYT6NYTree20ErrorEnum_EErrorCodeE), align 8
@_ZN3NYT26TEnumTraitsImpl_EErrorCode6ValuesE = linkonce_odr dso_local constant %"struct.std::__y1::array" { [6 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5] }, comdat, align 4
@_ZTVN10__cxxabiv116__enum_type_infoE = external global i8*
@_ZTSN3NYT10EErrorCodeE = linkonce_odr dso_local constant [19 x i8] c"N3NYT10EErrorCodeE\00", comdat, align 1
@_ZTIN3NYT10EErrorCodeE = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv116__enum_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @_ZTSN3NYT10EErrorCodeE, i32 0, i32 0) }, comdat, align 8
@.str = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"OK\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"Generic\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"Canceled\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Timeout\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"FutureCombinerFailure\00", align 1
@.str.10 = private unnamed_addr constant [23 x i8] c"FutureCombinerShortcut\00", align 1
@_ZN3NYT26TEnumTraitsImpl_EErrorCode5NamesE = linkonce_odr dso_local local_unnamed_addr constant { [6 x { i8*, i64 }] } { [6 x { i8*, i64 }] [{ i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i64 2 }, { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i64 7 }, { i8*, i64 } { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i64 8 }, { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i64 7 }, { i8*, i64 } { i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i32 0, i32 0), i64 21 }, { i8*, i64 } { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.10, i32 0, i32 0), i64 22 }] }, comdat, align 8
@.str.12 = private unnamed_addr constant [13 x i8] c"basic_string\00", align 1
@_ZTISt12length_error = external constant i8*
@_ZTVSt12length_error = external unnamed_addr constant { [5 x i8*] }, align 8
@NULL_STRING_REPR = external constant [128 x i8], align 32
@.str.13 = private unnamed_addr constant [11 x i8] c"EErrorCode\00", align 1
@_ZTSN3NYT4NBus10EErrorCodeE = linkonce_odr dso_local constant [24 x i8] c"N3NYT4NBus10EErrorCodeE\00", comdat, align 1
@_ZTIN3NYT4NBus10EErrorCodeE = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv116__enum_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @_ZTSN3NYT4NBus10EErrorCodeE, i32 0, i32 0) }, comdat, align 8
@.str.14 = private unnamed_addr constant [15 x i8] c"TransportError\00", align 1
@_ZN3NYT4NRpc26TEnumTraitsImpl_EErrorCode6ValuesE = linkonce_odr dso_local constant %"struct.std::__y1::array.36" { [16 x i32] [i32 100, i32 101, i32 102, i32 103, i32 105, i32 116, i32 106, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 117] }, comdat, align 4
@_ZTSN3NYT4NRpc10EErrorCodeE = linkonce_odr dso_local constant [24 x i8] c"N3NYT4NRpc10EErrorCodeE\00", comdat, align 1
@_ZTIN3NYT4NRpc10EErrorCodeE = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv116__enum_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @_ZTSN3NYT4NRpc10EErrorCodeE, i32 0, i32 0) }, comdat, align 8
@.str.16 = private unnamed_addr constant [14 x i8] c"ProtocolError\00", align 1
@.str.17 = private unnamed_addr constant [14 x i8] c"NoSuchService\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"NoSuchMethod\00", align 1
@.str.19 = private unnamed_addr constant [12 x i8] c"Unavailable\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"TransientFailure\00", align 1
@.str.21 = private unnamed_addr constant [11 x i8] c"PoisonPill\00", align 1
@.str.22 = private unnamed_addr constant [30 x i8] c"RequestQueueSizeLimitExceeded\00", align 1
@.str.23 = private unnamed_addr constant [20 x i8] c"AuthenticationError\00", align 1
@.str.24 = private unnamed_addr constant [17 x i8] c"InvalidCsrfToken\00", align 1
@.str.25 = private unnamed_addr constant [19 x i8] c"InvalidCredentials\00", align 1
@.str.26 = private unnamed_addr constant [22 x i8] c"StreamingNotSupported\00", align 1
@.str.27 = private unnamed_addr constant [25 x i8] c"UnsupportedClientFeature\00", align 1
@.str.28 = private unnamed_addr constant [25 x i8] c"UnsupportedServerFeature\00", align 1
@.str.29 = private unnamed_addr constant [11 x i8] c"PeerBanned\00", align 1
@.str.30 = private unnamed_addr constant [12 x i8] c"NoSuchRealm\00", align 1
@_ZN3NYT4NRpc26TEnumTraitsImpl_EErrorCode5NamesE = linkonce_odr dso_local local_unnamed_addr constant { [16 x { i8*, i64 }] } { [16 x { i8*, i64 }] [{ i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.14, i32 0, i32 0), i64 14 }, { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.16, i32 0, i32 0), i64 13 }, { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.17, i32 0, i32 0), i64 13 }, { i8*, i64 } { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i32 0, i32 0), i64 12 }, { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.19, i32 0, i32 0), i64 11 }, { i8*, i64 } { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.20, i32 0, i32 0), i64 16 }, { i8*, i64 } { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.21, i32 0, i32 0), i64 10 }, { i8*, i64 } { i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.22, i32 0, i32 0), i64 29 }, { i8*, i64 } { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.23, i32 0, i32 0), i64 19 }, { i8*, i64 } { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.24, i32 0, i32 0), i64 16 }, { i8*, i64 } { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.25, i32 0, i32 0), i64 18 }, { i8*, i64 } { i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.26, i32 0, i32 0), i64 21 }, { i8*, i64 } { i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.27, i32 0, i32 0), i64 24 }, { i8*, i64 } { i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.28, i32 0, i32 0), i64 24 }, { i8*, i64 } { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.29, i32 0, i32 0), i64 10 }, { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.30, i32 0, i32 0), i64 11 }] }, comdat, align 8
@_ZN3NYT6NYTree26TEnumTraitsImpl_EErrorCode6ValuesE = linkonce_odr dso_local constant %"struct.std::__y1::array.38" { [6 x i32] [i32 500, i32 501, i32 502, i32 503, i32 504, i32 505] }, comdat, align 4
@_ZTSN3NYT6NYTree10EErrorCodeE = linkonce_odr dso_local constant [26 x i8] c"N3NYT6NYTree10EErrorCodeE\00", comdat, align 1
@_ZTIN3NYT6NYTree10EErrorCodeE = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv116__enum_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @_ZTSN3NYT6NYTree10EErrorCodeE, i32 0, i32 0) }, comdat, align 8
@.str.32 = private unnamed_addr constant [13 x i8] c"ResolveError\00", align 1
@.str.33 = private unnamed_addr constant [14 x i8] c"AlreadyExists\00", align 1
@.str.34 = private unnamed_addr constant [23 x i8] c"MaxChildCountViolation\00", align 1
@.str.35 = private unnamed_addr constant [25 x i8] c"MaxStringLengthViolation\00", align 1
@.str.36 = private unnamed_addr constant [26 x i8] c"MaxAttributeSizeViolation\00", align 1
@.str.37 = private unnamed_addr constant [22 x i8] c"MaxKeyLengthViolation\00", align 1
@_ZN3NYT6NYTree26TEnumTraitsImpl_EErrorCode5NamesE = linkonce_odr dso_local local_unnamed_addr constant { [6 x { i8*, i64 }] } { [6 x { i8*, i64 }] [{ i8*, i64 } { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.32, i32 0, i32 0), i64 12 }, { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.33, i32 0, i32 0), i64 13 }, { i8*, i64 } { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.34, i32 0, i32 0), i64 22 }, { i8*, i64 } { i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.35, i32 0, i32 0), i64 24 }, { i8*, i64 } { i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.36, i32 0, i32 0), i64 25 }, { i8*, i64 } { i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.37, i32 0, i32 0), i64 21 }] }, comdat, align 8
@llvm.global_ctors = appending global [4 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @__cxx_global_var_init, i8* bitcast (i8** @_ZN3NYT20ErrorEnum_EErrorCodeE to i8*) }, { i32, void ()*, i8* } { i32 65535, void ()* @__cxx_global_var_init.1, i8* bitcast (i8** @_ZN3NYT4NBus20ErrorEnum_EErrorCodeE to i8*) }, { i32, void ()*, i8* } { i32 65535, void ()* @__cxx_global_var_init.2, i8* bitcast (i8** @_ZN3NYT4NRpc20ErrorEnum_EErrorCodeE to i8*) }, { i32, void ()*, i8* } { i32 65535, void ()* @__cxx_global_var_init.3, i8* bitcast (i8** @_ZN3NYT6NYTree20ErrorEnum_EErrorCodeE to i8*) }]
@llvm.used = appending global [13 x i8*] [i8* bitcast (%"class.NYT::TRefCounter"* (%"struct.NYT::TSharedRangeHolder"*)* @_ZN3NYT13GetRefCounterEPKNS_18TSharedRangeHolderE to i8*), i8* bitcast (%"class.NYT::TRefCounter"* (%"class.NYT::TSharedRefArrayImpl"*)* @_ZN3NYT13GetRefCounterEPKNS_19TSharedRefArrayImplE to i8*), i8* bitcast (void (%"struct.NYT::TSharedRangeHolder"*)* @_ZN3NYT17DestroyRefCountedEPKNS_18TSharedRangeHolderE to i8*), i8* bitcast (void (%"class.NYT::TSharedRefArrayImpl"*)* @_ZN3NYT17DestroyRefCountedEPKNS_19TSharedRefArrayImplE to i8*), i8* bitcast (void (%"struct.NYT::TSharedRangeHolder"*)* @_ZN3NYT20DeallocateRefCountedEPKNS_18TSharedRangeHolderE to i8*), i8* bitcast (void (%"class.NYT::TSharedRefArrayImpl"*)* @_ZN3NYT20DeallocateRefCountedEPKNS_19TSharedRefArrayImplE to i8*), i8* bitcast (i8** @_ZN3NYT20ErrorEnum_EErrorCodeE to i8*), i8* bitcast (i8** @_ZN3NYT4NBus20ErrorEnum_EErrorCodeE to i8*), i8* bitcast (i8** @_ZN3NYT4NRpc20ErrorEnum_EErrorCodeE to i8*), i8* bitcast (%"class.NYT::TRefCounter"* (%"struct.NYT::NYTree::IAttributeDictionary"*)* @_ZN3NYT6NYTree13GetRefCounterEPKNS0_20IAttributeDictionaryE to i8*), i8* bitcast (void (%"struct.NYT::NYTree::IAttributeDictionary"*)* @_ZN3NYT6NYTree17DestroyRefCountedEPKNS0_20IAttributeDictionaryE to i8*), i8* bitcast (void (%"struct.NYT::NYTree::IAttributeDictionary"*)* @_ZN3NYT6NYTree20DeallocateRefCountedEPKNS0_20IAttributeDictionaryE to i8*), i8* bitcast (i8** @_ZN3NYT6NYTree20ErrorEnum_EErrorCodeE to i8*)], section "llvm.metadata"
@switch.table._ZN3NYT11TEnumTraitsINS_4NRpc10EErrorCodeELb1EE8ToStringES2_ = private unnamed_addr constant [18 x i64] [i64 0, i64 1, i64 2, i64 3, i64 0, i64 4, i64 6, i64 0, i64 7, i64 8, i64 9, i64 10, i64 11, i64 12, i64 13, i64 14, i64 5, i64 15], align 8

; Function Attrs: uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %class.anon, align 1
  %2 = load atomic i8, i8* bitcast (i64* @_ZGVN3NYT20ErrorEnum_EErrorCodeE to i8*) acquire, align 8
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %11

4:                                                ; preds = %0
  %5 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVN3NYT20ErrorEnum_EErrorCodeE) #17
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds %class.anon, %class.anon* %1, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #17
  %9 = invoke i8* @_ZNK3NYT20ErrorEnum_EErrorCodeMUlvE_clEv(%class.anon* nonnull dereferenceable(1) %1)
          to label %10 unwind label %12

10:                                               ; preds = %7
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #17
  store i8* null, i8** @_ZN3NYT20ErrorEnum_EErrorCodeE, align 8, !tbaa !4
  call void @__cxa_guard_release(i64* nonnull @_ZGVN3NYT20ErrorEnum_EErrorCodeE) #17
  br label %11

11:                                               ; preds = %10, %4, %0
  ret void

12:                                               ; preds = %7
  %13 = landingpad { i8*, i32 }
          cleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #17
  call void @__cxa_guard_abort(i64* nonnull @_ZGVN3NYT20ErrorEnum_EErrorCodeE) #17
  resume { i8*, i32 } %13
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(i64*) local_unnamed_addr #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local i8* @_ZNK3NYT20ErrorEnum_EErrorCodeMUlvE_clEv(%class.anon* nonnull dereferenceable(1) %0) local_unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", align 8
  %3 = bitcast %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2 to i8*
  %4 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 0
  %5 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 1
  %6 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 1, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 0, i32 0, i32 0
  br label %9

8:                                                ; preds = %60
  ret i8* null

9:                                                ; preds = %1, %60
  %10 = phi i32* [ getelementptr inbounds (%"struct.std::__y1::array", %"struct.std::__y1::array"* @_ZN3NYT26TEnumTraitsImpl_EErrorCode6ValuesE, i64 0, i32 0, i64 0), %1 ], [ %61, %60 ]
  %11 = load i32, i32* %10, align 4, !tbaa !8
  %12 = call %"class.NYT::TErrorCodeRegistry"* @_ZN3NYT18TErrorCodeRegistry3GetEv()
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #17
  call void @_ZN3NYT18TErrorCodeRegistry14ParseNamespaceERKSt9type_info(%class.TBasicString* nonnull sret(%class.TBasicString) align 8 %4, %"class.std::type_info"* nonnull align 8 dereferenceable(16) bitcast ({ i8*, i8* }* @_ZTIN3NYT10EErrorCodeE to %"class.std::type_info"*))
  invoke void @_ZN3NYT11TEnumTraitsINS_10EErrorCodeELb1EE8ToStringES1_(%class.TBasicString* nonnull sret(%class.TBasicString) align 8 %5, i32 %11)
          to label %13 unwind label %63

13:                                               ; preds = %9
  invoke void @_ZN3NYT18TErrorCodeRegistry17RegisterErrorCodeEiRKNS0_14TErrorCodeInfoE(%"class.NYT::TErrorCodeRegistry"* nonnull dereferenceable(56) %12, i32 %11, %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* nonnull align 8 dereferenceable(16) %2)
          to label %14 unwind label %87

14:                                               ; preds = %13
  %15 = load %struct.TStdString*, %struct.TStdString** %6, align 8, !tbaa !10
  %16 = icmp eq %struct.TStdString* %15, null
  %17 = icmp eq %struct.TStdString* %15, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %18 = or i1 %16, %17
  br i1 %18, label %37, label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %21 = load atomic i64, i64* %20 seq_cst, align 8
  %22 = icmp eq i64 %21, 1
  br i1 %22, label %26, label %23

23:                                               ; preds = %19
  %24 = atomicrmw sub i64* %20, i64 1 seq_cst
  %25 = icmp eq i64 %24, 1
  br i1 %25, label %26, label %37

26:                                               ; preds = %23, %19
  %27 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 1
  %28 = bitcast %"class.std::__y1::basic_string"* %27 to i8*
  %29 = load i8, i8* %28, align 8, !tbaa !12
  %30 = and i8 %29, 1
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %35, label %32

32:                                               ; preds = %26
  %33 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %34 = load i8*, i8** %33, align 8, !tbaa !12
  call void @_ZdlPv(i8* %34) #18
  br label %35

35:                                               ; preds = %32, %26
  %36 = bitcast %struct.TStdString* %15 to i8*
  call void @_ZdlPv(i8* nonnull %36) #18
  br label %37

37:                                               ; preds = %35, %23, %14
  %38 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %39 = icmp eq %struct.TStdString* %38, null
  %40 = icmp eq %struct.TStdString* %38, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %41 = or i1 %39, %40
  br i1 %41, label %60, label %42

42:                                               ; preds = %37
  %43 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %44 = load atomic i64, i64* %43 seq_cst, align 8
  %45 = icmp eq i64 %44, 1
  br i1 %45, label %49, label %46

46:                                               ; preds = %42
  %47 = atomicrmw sub i64* %43, i64 1 seq_cst
  %48 = icmp eq i64 %47, 1
  br i1 %48, label %49, label %60

49:                                               ; preds = %46, %42
  %50 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 1
  %51 = bitcast %"class.std::__y1::basic_string"* %50 to i8*
  %52 = load i8, i8* %51, align 8, !tbaa !12
  %53 = and i8 %52, 1
  %54 = icmp eq i8 %53, 0
  br i1 %54, label %58, label %55

55:                                               ; preds = %49
  %56 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %57 = load i8*, i8** %56, align 8, !tbaa !12
  call void @_ZdlPv(i8* %57) #18
  br label %58

58:                                               ; preds = %55, %49
  %59 = bitcast %struct.TStdString* %38 to i8*
  call void @_ZdlPv(i8* nonnull %59) #18
  br label %60

60:                                               ; preds = %37, %46, %58
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #17
  %61 = getelementptr inbounds i32, i32* %10, i64 1
  %62 = icmp eq i32* %61, getelementptr inbounds (%"struct.std::__y1::array", %"struct.std::__y1::array"* @_ZN3NYT26TEnumTraitsImpl_EErrorCode6ValuesE, i64 1, i32 0, i64 0)
  br i1 %62, label %8, label %9

63:                                               ; preds = %9
  %64 = landingpad { i8*, i32 }
          cleanup
  %65 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %66 = icmp eq %struct.TStdString* %65, null
  %67 = icmp eq %struct.TStdString* %65, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %68 = or i1 %66, %67
  br i1 %68, label %134, label %69

69:                                               ; preds = %63
  %70 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %71 = load atomic i64, i64* %70 seq_cst, align 8
  %72 = icmp eq i64 %71, 1
  br i1 %72, label %76, label %73

73:                                               ; preds = %69
  %74 = atomicrmw sub i64* %70, i64 1 seq_cst
  %75 = icmp eq i64 %74, 1
  br i1 %75, label %76, label %134

76:                                               ; preds = %73, %69
  %77 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 1
  %78 = bitcast %"class.std::__y1::basic_string"* %77 to i8*
  %79 = load i8, i8* %78, align 8, !tbaa !12
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %76
  %83 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !12
  call void @_ZdlPv(i8* %84) #18
  br label %85

85:                                               ; preds = %82, %76
  %86 = bitcast %struct.TStdString* %65 to i8*
  call void @_ZdlPv(i8* nonnull %86) #18
  br label %134

87:                                               ; preds = %13
  %88 = landingpad { i8*, i32 }
          cleanup
  %89 = load %struct.TStdString*, %struct.TStdString** %6, align 8, !tbaa !10
  %90 = icmp eq %struct.TStdString* %89, null
  %91 = icmp eq %struct.TStdString* %89, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %92 = or i1 %90, %91
  br i1 %92, label %111, label %93

93:                                               ; preds = %87
  %94 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %95 = load atomic i64, i64* %94 seq_cst, align 8
  %96 = icmp eq i64 %95, 1
  br i1 %96, label %100, label %97

97:                                               ; preds = %93
  %98 = atomicrmw sub i64* %94, i64 1 seq_cst
  %99 = icmp eq i64 %98, 1
  br i1 %99, label %100, label %111

100:                                              ; preds = %97, %93
  %101 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 1
  %102 = bitcast %"class.std::__y1::basic_string"* %101 to i8*
  %103 = load i8, i8* %102, align 8, !tbaa !12
  %104 = and i8 %103, 1
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %109, label %106

106:                                              ; preds = %100
  %107 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %108 = load i8*, i8** %107, align 8, !tbaa !12
  call void @_ZdlPv(i8* %108) #18
  br label %109

109:                                              ; preds = %106, %100
  %110 = bitcast %struct.TStdString* %89 to i8*
  call void @_ZdlPv(i8* nonnull %110) #18
  br label %111

111:                                              ; preds = %109, %97, %87
  %112 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %113 = icmp eq %struct.TStdString* %112, null
  %114 = icmp eq %struct.TStdString* %112, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %115 = or i1 %113, %114
  br i1 %115, label %134, label %116

116:                                              ; preds = %111
  %117 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %118 = load atomic i64, i64* %117 seq_cst, align 8
  %119 = icmp eq i64 %118, 1
  br i1 %119, label %123, label %120

120:                                              ; preds = %116
  %121 = atomicrmw sub i64* %117, i64 1 seq_cst
  %122 = icmp eq i64 %121, 1
  br i1 %122, label %123, label %134

123:                                              ; preds = %120, %116
  %124 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 1
  %125 = bitcast %"class.std::__y1::basic_string"* %124 to i8*
  %126 = load i8, i8* %125, align 8, !tbaa !12
  %127 = and i8 %126, 1
  %128 = icmp eq i8 %127, 0
  br i1 %128, label %132, label %129

129:                                              ; preds = %123
  %130 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %131 = load i8*, i8** %130, align 8, !tbaa !12
  call void @_ZdlPv(i8* %131) #18
  br label %132

132:                                              ; preds = %129, %123
  %133 = bitcast %struct.TStdString* %112 to i8*
  call void @_ZdlPv(i8* nonnull %133) #18
  br label %134

134:                                              ; preds = %132, %120, %111, %85, %73, %63
  %135 = phi { i8*, i32 } [ %64, %63 ], [ %64, %73 ], [ %64, %85 ], [ %88, %111 ], [ %88, %120 ], [ %88, %132 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #17
  resume { i8*, i32 } %135
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nounwind
declare void @__cxa_guard_abort(i64*) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(i64*) local_unnamed_addr #1

; Function Attrs: alwaysinline uwtable willreturn mustprogress
define linkonce_odr dso_local %"class.NYT::TRefCounter"* @_ZN3NYT13GetRefCounterEPKNS_18TSharedRangeHolderE(%"struct.NYT::TSharedRangeHolder"* %0) #4 comdat {
  %2 = icmp eq %"struct.NYT::TSharedRangeHolder"* %0, null
  %3 = getelementptr inbounds %"struct.NYT::TSharedRangeHolder", %"struct.NYT::TSharedRangeHolder"* %0, i64 0, i32 0, i32 1
  %4 = select i1 %2, %"class.NYT::TRefCounter"* null, %"class.NYT::TRefCounter"* %3
  ret %"class.NYT::TRefCounter"* %4
}

; Function Attrs: alwaysinline uwtable mustprogress
define linkonce_odr dso_local void @_ZN3NYT17DestroyRefCountedEPKNS_18TSharedRangeHolderE(%"struct.NYT::TSharedRangeHolder"* %0) #5 comdat {
  %2 = getelementptr %"struct.NYT::TSharedRangeHolder", %"struct.NYT::TSharedRangeHolder"* %0, i64 0, i32 0, i32 0
  %3 = bitcast %"struct.NYT::TSharedRangeHolder"* %0 to void (%"class.NYT::TRefCountedBase"*)***
  %4 = load void (%"class.NYT::TRefCountedBase"*)**, void (%"class.NYT::TRefCountedBase"*)*** %3, align 8, !tbaa !13
  %5 = getelementptr inbounds void (%"class.NYT::TRefCountedBase"*)*, void (%"class.NYT::TRefCountedBase"*)** %4, i64 2
  %6 = load void (%"class.NYT::TRefCountedBase"*)*, void (%"class.NYT::TRefCountedBase"*)** %5, align 8
  tail call void %6(%"class.NYT::TRefCountedBase"* nonnull dereferenceable(8) %2)
  ret void
}

; Function Attrs: alwaysinline uwtable
define linkonce_odr dso_local void @_ZN3NYT20DeallocateRefCountedEPKNS_18TSharedRangeHolderE(%"struct.NYT::TSharedRangeHolder"* %0) #6 comdat {
  %2 = bitcast %"struct.NYT::TSharedRangeHolder"* %0 to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !15
  %4 = and i64 %3, 281474976710655
  %5 = inttoptr i64 %4 to void (i8*, i16)*
  %6 = lshr i64 %3, 48
  %7 = trunc i64 %6 to i16
  %8 = bitcast %"struct.NYT::TSharedRangeHolder"* %0 to i8*
  %9 = sub nsw i64 0, %6
  %10 = getelementptr inbounds i8, i8* %8, i64 %9
  tail call void %5(i8* %10, i16 zeroext %7)
  ret void
}

; Function Attrs: alwaysinline uwtable willreturn mustprogress
define linkonce_odr dso_local %"class.NYT::TRefCounter"* @_ZN3NYT13GetRefCounterEPKNS_19TSharedRefArrayImplE(%"class.NYT::TSharedRefArrayImpl"* %0) #4 comdat {
  %2 = icmp eq %"class.NYT::TSharedRefArrayImpl"* %0, null
  %3 = getelementptr inbounds %"class.NYT::TSharedRefArrayImpl", %"class.NYT::TSharedRefArrayImpl"* %0, i64 0, i32 0, i32 0, i32 1
  %4 = select i1 %2, %"class.NYT::TRefCounter"* null, %"class.NYT::TRefCounter"* %3
  ret %"class.NYT::TRefCounter"* %4
}

; Function Attrs: alwaysinline uwtable mustprogress
define linkonce_odr dso_local void @_ZN3NYT17DestroyRefCountedEPKNS_19TSharedRefArrayImplE(%"class.NYT::TSharedRefArrayImpl"* %0) #5 comdat {
  %2 = getelementptr %"class.NYT::TSharedRefArrayImpl", %"class.NYT::TSharedRefArrayImpl"* %0, i64 0, i32 0, i32 0, i32 0
  %3 = bitcast %"class.NYT::TSharedRefArrayImpl"* %0 to void (%"class.NYT::TRefCountedBase"*)***
  %4 = load void (%"class.NYT::TRefCountedBase"*)**, void (%"class.NYT::TRefCountedBase"*)*** %3, align 8, !tbaa !13
  %5 = getelementptr inbounds void (%"class.NYT::TRefCountedBase"*)*, void (%"class.NYT::TRefCountedBase"*)** %4, i64 2
  %6 = load void (%"class.NYT::TRefCountedBase"*)*, void (%"class.NYT::TRefCountedBase"*)** %5, align 8
  tail call void %6(%"class.NYT::TRefCountedBase"* nonnull dereferenceable(8) %2)
  ret void
}

; Function Attrs: alwaysinline uwtable
define linkonce_odr dso_local void @_ZN3NYT20DeallocateRefCountedEPKNS_19TSharedRefArrayImplE(%"class.NYT::TSharedRefArrayImpl"* %0) #6 comdat {
  %2 = bitcast %"class.NYT::TSharedRefArrayImpl"* %0 to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !15
  %4 = and i64 %3, 281474976710655
  %5 = inttoptr i64 %4 to void (i8*, i16)*
  %6 = lshr i64 %3, 48
  %7 = trunc i64 %6 to i16
  %8 = bitcast %"class.NYT::TSharedRefArrayImpl"* %0 to i8*
  %9 = sub nsw i64 0, %6
  %10 = getelementptr inbounds i8, i8* %8, i64 %9
  tail call void %5(i8* %10, i16 zeroext %7)
  ret void
}

; Function Attrs: uwtable
define internal void @__cxx_global_var_init.1() #0 section ".text.startup" personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %class.anon.1, align 1
  %2 = load atomic i8, i8* bitcast (i64* @_ZGVN3NYT4NBus20ErrorEnum_EErrorCodeE to i8*) acquire, align 8
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %11

4:                                                ; preds = %0
  %5 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVN3NYT4NBus20ErrorEnum_EErrorCodeE) #17
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds %class.anon.1, %class.anon.1* %1, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #17
  %9 = invoke i8* @_ZNK3NYT4NBus20ErrorEnum_EErrorCodeMUlvE_clEv(%class.anon.1* nonnull dereferenceable(1) %1)
          to label %10 unwind label %12

10:                                               ; preds = %7
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #17
  store i8* null, i8** @_ZN3NYT4NBus20ErrorEnum_EErrorCodeE, align 8, !tbaa !4
  call void @__cxa_guard_release(i64* nonnull @_ZGVN3NYT4NBus20ErrorEnum_EErrorCodeE) #17
  br label %11

11:                                               ; preds = %10, %4, %0
  ret void

12:                                               ; preds = %7
  %13 = landingpad { i8*, i32 }
          cleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #17
  call void @__cxa_guard_abort(i64* nonnull @_ZGVN3NYT4NBus20ErrorEnum_EErrorCodeE) #17
  resume { i8*, i32 } %13
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local i8* @_ZNK3NYT4NBus20ErrorEnum_EErrorCodeMUlvE_clEv(%class.anon.1* nonnull dereferenceable(1) %0) local_unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", align 8
  %3 = bitcast %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2 to i8*
  %4 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 0
  %5 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 1
  %6 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 1, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 0, i32 0, i32 0
  %8 = call %"class.NYT::TErrorCodeRegistry"* @_ZN3NYT18TErrorCodeRegistry3GetEv()
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #17
  call void @_ZN3NYT18TErrorCodeRegistry14ParseNamespaceERKSt9type_info(%class.TBasicString* nonnull sret(%class.TBasicString) align 8 %4, %"class.std::type_info"* nonnull align 8 dereferenceable(16) bitcast ({ i8*, i8* }* @_ZTIN3NYT4NBus10EErrorCodeE to %"class.std::type_info"*))
  invoke void @_ZN3NYT11TEnumTraitsINS_4NBus10EErrorCodeELb1EE8ToStringES2_(%class.TBasicString* nonnull sret(%class.TBasicString) align 8 %5, i32 100)
          to label %9 unwind label %57

9:                                                ; preds = %1
  invoke void @_ZN3NYT18TErrorCodeRegistry17RegisterErrorCodeEiRKNS0_14TErrorCodeInfoE(%"class.NYT::TErrorCodeRegistry"* nonnull dereferenceable(56) %8, i32 100, %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* nonnull align 8 dereferenceable(16) %2)
          to label %10 unwind label %81

10:                                               ; preds = %9
  %11 = load %struct.TStdString*, %struct.TStdString** %6, align 8, !tbaa !10
  %12 = icmp eq %struct.TStdString* %11, null
  %13 = icmp eq %struct.TStdString* %11, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %14 = or i1 %12, %13
  br i1 %14, label %33, label %15

15:                                               ; preds = %10
  %16 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %11, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %17 = load atomic i64, i64* %16 seq_cst, align 8
  %18 = icmp eq i64 %17, 1
  br i1 %18, label %22, label %19

19:                                               ; preds = %15
  %20 = atomicrmw sub i64* %16, i64 1 seq_cst
  %21 = icmp eq i64 %20, 1
  br i1 %21, label %22, label %33

22:                                               ; preds = %19, %15
  %23 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %11, i64 0, i32 1
  %24 = bitcast %"class.std::__y1::basic_string"* %23 to i8*
  %25 = load i8, i8* %24, align 8, !tbaa !12
  %26 = and i8 %25, 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %31, label %28

28:                                               ; preds = %22
  %29 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %11, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %30 = load i8*, i8** %29, align 8, !tbaa !12
  call void @_ZdlPv(i8* %30) #18
  br label %31

31:                                               ; preds = %28, %22
  %32 = bitcast %struct.TStdString* %11 to i8*
  call void @_ZdlPv(i8* nonnull %32) #18
  br label %33

33:                                               ; preds = %31, %19, %10
  %34 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %35 = icmp eq %struct.TStdString* %34, null
  %36 = icmp eq %struct.TStdString* %34, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %37 = or i1 %35, %36
  br i1 %37, label %56, label %38

38:                                               ; preds = %33
  %39 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %34, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %40 = load atomic i64, i64* %39 seq_cst, align 8
  %41 = icmp eq i64 %40, 1
  br i1 %41, label %45, label %42

42:                                               ; preds = %38
  %43 = atomicrmw sub i64* %39, i64 1 seq_cst
  %44 = icmp eq i64 %43, 1
  br i1 %44, label %45, label %56

45:                                               ; preds = %42, %38
  %46 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %34, i64 0, i32 1
  %47 = bitcast %"class.std::__y1::basic_string"* %46 to i8*
  %48 = load i8, i8* %47, align 8, !tbaa !12
  %49 = and i8 %48, 1
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %54, label %51

51:                                               ; preds = %45
  %52 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %34, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %53 = load i8*, i8** %52, align 8, !tbaa !12
  call void @_ZdlPv(i8* %53) #18
  br label %54

54:                                               ; preds = %51, %45
  %55 = bitcast %struct.TStdString* %34 to i8*
  call void @_ZdlPv(i8* nonnull %55) #18
  br label %56

56:                                               ; preds = %33, %42, %54
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #17
  ret i8* null

57:                                               ; preds = %1
  %58 = landingpad { i8*, i32 }
          cleanup
  %59 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %60 = icmp eq %struct.TStdString* %59, null
  %61 = icmp eq %struct.TStdString* %59, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %62 = or i1 %60, %61
  br i1 %62, label %128, label %63

63:                                               ; preds = %57
  %64 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %59, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %65 = load atomic i64, i64* %64 seq_cst, align 8
  %66 = icmp eq i64 %65, 1
  br i1 %66, label %70, label %67

67:                                               ; preds = %63
  %68 = atomicrmw sub i64* %64, i64 1 seq_cst
  %69 = icmp eq i64 %68, 1
  br i1 %69, label %70, label %128

70:                                               ; preds = %67, %63
  %71 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %59, i64 0, i32 1
  %72 = bitcast %"class.std::__y1::basic_string"* %71 to i8*
  %73 = load i8, i8* %72, align 8, !tbaa !12
  %74 = and i8 %73, 1
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %79, label %76

76:                                               ; preds = %70
  %77 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %59, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %78 = load i8*, i8** %77, align 8, !tbaa !12
  call void @_ZdlPv(i8* %78) #18
  br label %79

79:                                               ; preds = %76, %70
  %80 = bitcast %struct.TStdString* %59 to i8*
  call void @_ZdlPv(i8* nonnull %80) #18
  br label %128

81:                                               ; preds = %9
  %82 = landingpad { i8*, i32 }
          cleanup
  %83 = load %struct.TStdString*, %struct.TStdString** %6, align 8, !tbaa !10
  %84 = icmp eq %struct.TStdString* %83, null
  %85 = icmp eq %struct.TStdString* %83, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %86 = or i1 %84, %85
  br i1 %86, label %105, label %87

87:                                               ; preds = %81
  %88 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %83, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %89 = load atomic i64, i64* %88 seq_cst, align 8
  %90 = icmp eq i64 %89, 1
  br i1 %90, label %94, label %91

91:                                               ; preds = %87
  %92 = atomicrmw sub i64* %88, i64 1 seq_cst
  %93 = icmp eq i64 %92, 1
  br i1 %93, label %94, label %105

94:                                               ; preds = %91, %87
  %95 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %83, i64 0, i32 1
  %96 = bitcast %"class.std::__y1::basic_string"* %95 to i8*
  %97 = load i8, i8* %96, align 8, !tbaa !12
  %98 = and i8 %97, 1
  %99 = icmp eq i8 %98, 0
  br i1 %99, label %103, label %100

100:                                              ; preds = %94
  %101 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %83, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %102 = load i8*, i8** %101, align 8, !tbaa !12
  call void @_ZdlPv(i8* %102) #18
  br label %103

103:                                              ; preds = %100, %94
  %104 = bitcast %struct.TStdString* %83 to i8*
  call void @_ZdlPv(i8* nonnull %104) #18
  br label %105

105:                                              ; preds = %103, %91, %81
  %106 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %107 = icmp eq %struct.TStdString* %106, null
  %108 = icmp eq %struct.TStdString* %106, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %109 = or i1 %107, %108
  br i1 %109, label %128, label %110

110:                                              ; preds = %105
  %111 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %106, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %112 = load atomic i64, i64* %111 seq_cst, align 8
  %113 = icmp eq i64 %112, 1
  br i1 %113, label %117, label %114

114:                                              ; preds = %110
  %115 = atomicrmw sub i64* %111, i64 1 seq_cst
  %116 = icmp eq i64 %115, 1
  br i1 %116, label %117, label %128

117:                                              ; preds = %114, %110
  %118 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %106, i64 0, i32 1
  %119 = bitcast %"class.std::__y1::basic_string"* %118 to i8*
  %120 = load i8, i8* %119, align 8, !tbaa !12
  %121 = and i8 %120, 1
  %122 = icmp eq i8 %121, 0
  br i1 %122, label %126, label %123

123:                                              ; preds = %117
  %124 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %106, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %125 = load i8*, i8** %124, align 8, !tbaa !12
  call void @_ZdlPv(i8* %125) #18
  br label %126

126:                                              ; preds = %123, %117
  %127 = bitcast %struct.TStdString* %106 to i8*
  call void @_ZdlPv(i8* nonnull %127) #18
  br label %128

128:                                              ; preds = %126, %114, %105, %79, %67, %57
  %129 = phi { i8*, i32 } [ %58, %57 ], [ %58, %67 ], [ %58, %79 ], [ %82, %105 ], [ %82, %114 ], [ %82, %126 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #17
  resume { i8*, i32 } %129
}

; Function Attrs: uwtable
define internal void @__cxx_global_var_init.2() #0 section ".text.startup" personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %class.anon.3, align 1
  %2 = load atomic i8, i8* bitcast (i64* @_ZGVN3NYT4NRpc20ErrorEnum_EErrorCodeE to i8*) acquire, align 8
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %11

4:                                                ; preds = %0
  %5 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVN3NYT4NRpc20ErrorEnum_EErrorCodeE) #17
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds %class.anon.3, %class.anon.3* %1, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #17
  %9 = invoke i8* @_ZNK3NYT4NRpc20ErrorEnum_EErrorCodeMUlvE_clEv(%class.anon.3* nonnull dereferenceable(1) %1)
          to label %10 unwind label %12

10:                                               ; preds = %7
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #17
  store i8* null, i8** @_ZN3NYT4NRpc20ErrorEnum_EErrorCodeE, align 8, !tbaa !4
  call void @__cxa_guard_release(i64* nonnull @_ZGVN3NYT4NRpc20ErrorEnum_EErrorCodeE) #17
  br label %11

11:                                               ; preds = %10, %4, %0
  ret void

12:                                               ; preds = %7
  %13 = landingpad { i8*, i32 }
          cleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #17
  call void @__cxa_guard_abort(i64* nonnull @_ZGVN3NYT4NRpc20ErrorEnum_EErrorCodeE) #17
  resume { i8*, i32 } %13
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local i8* @_ZNK3NYT4NRpc20ErrorEnum_EErrorCodeMUlvE_clEv(%class.anon.3* nonnull dereferenceable(1) %0) local_unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", align 8
  %3 = bitcast %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2 to i8*
  %4 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 0
  %5 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 1
  %6 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 1, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 0, i32 0, i32 0
  br label %9

8:                                                ; preds = %60
  ret i8* null

9:                                                ; preds = %1, %60
  %10 = phi i32* [ getelementptr inbounds (%"struct.std::__y1::array.36", %"struct.std::__y1::array.36"* @_ZN3NYT4NRpc26TEnumTraitsImpl_EErrorCode6ValuesE, i64 0, i32 0, i64 0), %1 ], [ %61, %60 ]
  %11 = load i32, i32* %10, align 4, !tbaa !17
  %12 = call %"class.NYT::TErrorCodeRegistry"* @_ZN3NYT18TErrorCodeRegistry3GetEv()
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #17
  call void @_ZN3NYT18TErrorCodeRegistry14ParseNamespaceERKSt9type_info(%class.TBasicString* nonnull sret(%class.TBasicString) align 8 %4, %"class.std::type_info"* nonnull align 8 dereferenceable(16) bitcast ({ i8*, i8* }* @_ZTIN3NYT4NRpc10EErrorCodeE to %"class.std::type_info"*))
  invoke void @_ZN3NYT11TEnumTraitsINS_4NRpc10EErrorCodeELb1EE8ToStringES2_(%class.TBasicString* nonnull sret(%class.TBasicString) align 8 %5, i32 %11)
          to label %13 unwind label %63

13:                                               ; preds = %9
  invoke void @_ZN3NYT18TErrorCodeRegistry17RegisterErrorCodeEiRKNS0_14TErrorCodeInfoE(%"class.NYT::TErrorCodeRegistry"* nonnull dereferenceable(56) %12, i32 %11, %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* nonnull align 8 dereferenceable(16) %2)
          to label %14 unwind label %87

14:                                               ; preds = %13
  %15 = load %struct.TStdString*, %struct.TStdString** %6, align 8, !tbaa !10
  %16 = icmp eq %struct.TStdString* %15, null
  %17 = icmp eq %struct.TStdString* %15, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %18 = or i1 %16, %17
  br i1 %18, label %37, label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %21 = load atomic i64, i64* %20 seq_cst, align 8
  %22 = icmp eq i64 %21, 1
  br i1 %22, label %26, label %23

23:                                               ; preds = %19
  %24 = atomicrmw sub i64* %20, i64 1 seq_cst
  %25 = icmp eq i64 %24, 1
  br i1 %25, label %26, label %37

26:                                               ; preds = %23, %19
  %27 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 1
  %28 = bitcast %"class.std::__y1::basic_string"* %27 to i8*
  %29 = load i8, i8* %28, align 8, !tbaa !12
  %30 = and i8 %29, 1
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %35, label %32

32:                                               ; preds = %26
  %33 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %34 = load i8*, i8** %33, align 8, !tbaa !12
  call void @_ZdlPv(i8* %34) #18
  br label %35

35:                                               ; preds = %32, %26
  %36 = bitcast %struct.TStdString* %15 to i8*
  call void @_ZdlPv(i8* nonnull %36) #18
  br label %37

37:                                               ; preds = %35, %23, %14
  %38 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %39 = icmp eq %struct.TStdString* %38, null
  %40 = icmp eq %struct.TStdString* %38, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %41 = or i1 %39, %40
  br i1 %41, label %60, label %42

42:                                               ; preds = %37
  %43 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %44 = load atomic i64, i64* %43 seq_cst, align 8
  %45 = icmp eq i64 %44, 1
  br i1 %45, label %49, label %46

46:                                               ; preds = %42
  %47 = atomicrmw sub i64* %43, i64 1 seq_cst
  %48 = icmp eq i64 %47, 1
  br i1 %48, label %49, label %60

49:                                               ; preds = %46, %42
  %50 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 1
  %51 = bitcast %"class.std::__y1::basic_string"* %50 to i8*
  %52 = load i8, i8* %51, align 8, !tbaa !12
  %53 = and i8 %52, 1
  %54 = icmp eq i8 %53, 0
  br i1 %54, label %58, label %55

55:                                               ; preds = %49
  %56 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %57 = load i8*, i8** %56, align 8, !tbaa !12
  call void @_ZdlPv(i8* %57) #18
  br label %58

58:                                               ; preds = %55, %49
  %59 = bitcast %struct.TStdString* %38 to i8*
  call void @_ZdlPv(i8* nonnull %59) #18
  br label %60

60:                                               ; preds = %37, %46, %58
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #17
  %61 = getelementptr inbounds i32, i32* %10, i64 1
  %62 = icmp eq i32* %61, getelementptr inbounds (%"struct.std::__y1::array.36", %"struct.std::__y1::array.36"* @_ZN3NYT4NRpc26TEnumTraitsImpl_EErrorCode6ValuesE, i64 1, i32 0, i64 0)
  br i1 %62, label %8, label %9

63:                                               ; preds = %9
  %64 = landingpad { i8*, i32 }
          cleanup
  %65 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %66 = icmp eq %struct.TStdString* %65, null
  %67 = icmp eq %struct.TStdString* %65, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %68 = or i1 %66, %67
  br i1 %68, label %134, label %69

69:                                               ; preds = %63
  %70 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %71 = load atomic i64, i64* %70 seq_cst, align 8
  %72 = icmp eq i64 %71, 1
  br i1 %72, label %76, label %73

73:                                               ; preds = %69
  %74 = atomicrmw sub i64* %70, i64 1 seq_cst
  %75 = icmp eq i64 %74, 1
  br i1 %75, label %76, label %134

76:                                               ; preds = %73, %69
  %77 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 1
  %78 = bitcast %"class.std::__y1::basic_string"* %77 to i8*
  %79 = load i8, i8* %78, align 8, !tbaa !12
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %76
  %83 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !12
  call void @_ZdlPv(i8* %84) #18
  br label %85

85:                                               ; preds = %82, %76
  %86 = bitcast %struct.TStdString* %65 to i8*
  call void @_ZdlPv(i8* nonnull %86) #18
  br label %134

87:                                               ; preds = %13
  %88 = landingpad { i8*, i32 }
          cleanup
  %89 = load %struct.TStdString*, %struct.TStdString** %6, align 8, !tbaa !10
  %90 = icmp eq %struct.TStdString* %89, null
  %91 = icmp eq %struct.TStdString* %89, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %92 = or i1 %90, %91
  br i1 %92, label %111, label %93

93:                                               ; preds = %87
  %94 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %95 = load atomic i64, i64* %94 seq_cst, align 8
  %96 = icmp eq i64 %95, 1
  br i1 %96, label %100, label %97

97:                                               ; preds = %93
  %98 = atomicrmw sub i64* %94, i64 1 seq_cst
  %99 = icmp eq i64 %98, 1
  br i1 %99, label %100, label %111

100:                                              ; preds = %97, %93
  %101 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 1
  %102 = bitcast %"class.std::__y1::basic_string"* %101 to i8*
  %103 = load i8, i8* %102, align 8, !tbaa !12
  %104 = and i8 %103, 1
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %109, label %106

106:                                              ; preds = %100
  %107 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %108 = load i8*, i8** %107, align 8, !tbaa !12
  call void @_ZdlPv(i8* %108) #18
  br label %109

109:                                              ; preds = %106, %100
  %110 = bitcast %struct.TStdString* %89 to i8*
  call void @_ZdlPv(i8* nonnull %110) #18
  br label %111

111:                                              ; preds = %109, %97, %87
  %112 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %113 = icmp eq %struct.TStdString* %112, null
  %114 = icmp eq %struct.TStdString* %112, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %115 = or i1 %113, %114
  br i1 %115, label %134, label %116

116:                                              ; preds = %111
  %117 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %118 = load atomic i64, i64* %117 seq_cst, align 8
  %119 = icmp eq i64 %118, 1
  br i1 %119, label %123, label %120

120:                                              ; preds = %116
  %121 = atomicrmw sub i64* %117, i64 1 seq_cst
  %122 = icmp eq i64 %121, 1
  br i1 %122, label %123, label %134

123:                                              ; preds = %120, %116
  %124 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 1
  %125 = bitcast %"class.std::__y1::basic_string"* %124 to i8*
  %126 = load i8, i8* %125, align 8, !tbaa !12
  %127 = and i8 %126, 1
  %128 = icmp eq i8 %127, 0
  br i1 %128, label %132, label %129

129:                                              ; preds = %123
  %130 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %131 = load i8*, i8** %130, align 8, !tbaa !12
  call void @_ZdlPv(i8* %131) #18
  br label %132

132:                                              ; preds = %129, %123
  %133 = bitcast %struct.TStdString* %112 to i8*
  call void @_ZdlPv(i8* nonnull %133) #18
  br label %134

134:                                              ; preds = %132, %120, %111, %85, %73, %63
  %135 = phi { i8*, i32 } [ %64, %63 ], [ %64, %73 ], [ %64, %85 ], [ %88, %111 ], [ %88, %120 ], [ %88, %132 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #17
  resume { i8*, i32 } %135
}

; Function Attrs: uwtable
define internal void @__cxx_global_var_init.3() #0 section ".text.startup" personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %class.anon.5, align 1
  %2 = load atomic i8, i8* bitcast (i64* @_ZGVN3NYT6NYTree20ErrorEnum_EErrorCodeE to i8*) acquire, align 8
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %11

4:                                                ; preds = %0
  %5 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVN3NYT6NYTree20ErrorEnum_EErrorCodeE) #17
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds %class.anon.5, %class.anon.5* %1, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #17
  %9 = invoke i8* @_ZNK3NYT6NYTree20ErrorEnum_EErrorCodeMUlvE_clEv(%class.anon.5* nonnull dereferenceable(1) %1)
          to label %10 unwind label %12

10:                                               ; preds = %7
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #17
  store i8* null, i8** @_ZN3NYT6NYTree20ErrorEnum_EErrorCodeE, align 8, !tbaa !4
  call void @__cxa_guard_release(i64* nonnull @_ZGVN3NYT6NYTree20ErrorEnum_EErrorCodeE) #17
  br label %11

11:                                               ; preds = %10, %4, %0
  ret void

12:                                               ; preds = %7
  %13 = landingpad { i8*, i32 }
          cleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #17
  call void @__cxa_guard_abort(i64* nonnull @_ZGVN3NYT6NYTree20ErrorEnum_EErrorCodeE) #17
  resume { i8*, i32 } %13
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local i8* @_ZNK3NYT6NYTree20ErrorEnum_EErrorCodeMUlvE_clEv(%class.anon.5* nonnull dereferenceable(1) %0) local_unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", align 8
  %3 = bitcast %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2 to i8*
  %4 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 0
  %5 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 1
  %6 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 1, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo", %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* %2, i64 0, i32 0, i32 0, i32 0
  br label %9

8:                                                ; preds = %60
  ret i8* null

9:                                                ; preds = %1, %60
  %10 = phi i32* [ getelementptr inbounds (%"struct.std::__y1::array.38", %"struct.std::__y1::array.38"* @_ZN3NYT6NYTree26TEnumTraitsImpl_EErrorCode6ValuesE, i64 0, i32 0, i64 0), %1 ], [ %61, %60 ]
  %11 = load i32, i32* %10, align 4, !tbaa !19
  %12 = call %"class.NYT::TErrorCodeRegistry"* @_ZN3NYT18TErrorCodeRegistry3GetEv()
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #17
  call void @_ZN3NYT18TErrorCodeRegistry14ParseNamespaceERKSt9type_info(%class.TBasicString* nonnull sret(%class.TBasicString) align 8 %4, %"class.std::type_info"* nonnull align 8 dereferenceable(16) bitcast ({ i8*, i8* }* @_ZTIN3NYT6NYTree10EErrorCodeE to %"class.std::type_info"*))
  invoke void @_ZN3NYT11TEnumTraitsINS_6NYTree10EErrorCodeELb1EE8ToStringES2_(%class.TBasicString* nonnull sret(%class.TBasicString) align 8 %5, i32 %11)
          to label %13 unwind label %63

13:                                               ; preds = %9
  invoke void @_ZN3NYT18TErrorCodeRegistry17RegisterErrorCodeEiRKNS0_14TErrorCodeInfoE(%"class.NYT::TErrorCodeRegistry"* nonnull dereferenceable(56) %12, i32 %11, %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* nonnull align 8 dereferenceable(16) %2)
          to label %14 unwind label %87

14:                                               ; preds = %13
  %15 = load %struct.TStdString*, %struct.TStdString** %6, align 8, !tbaa !10
  %16 = icmp eq %struct.TStdString* %15, null
  %17 = icmp eq %struct.TStdString* %15, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %18 = or i1 %16, %17
  br i1 %18, label %37, label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %21 = load atomic i64, i64* %20 seq_cst, align 8
  %22 = icmp eq i64 %21, 1
  br i1 %22, label %26, label %23

23:                                               ; preds = %19
  %24 = atomicrmw sub i64* %20, i64 1 seq_cst
  %25 = icmp eq i64 %24, 1
  br i1 %25, label %26, label %37

26:                                               ; preds = %23, %19
  %27 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 1
  %28 = bitcast %"class.std::__y1::basic_string"* %27 to i8*
  %29 = load i8, i8* %28, align 8, !tbaa !12
  %30 = and i8 %29, 1
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %35, label %32

32:                                               ; preds = %26
  %33 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %34 = load i8*, i8** %33, align 8, !tbaa !12
  call void @_ZdlPv(i8* %34) #18
  br label %35

35:                                               ; preds = %32, %26
  %36 = bitcast %struct.TStdString* %15 to i8*
  call void @_ZdlPv(i8* nonnull %36) #18
  br label %37

37:                                               ; preds = %35, %23, %14
  %38 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %39 = icmp eq %struct.TStdString* %38, null
  %40 = icmp eq %struct.TStdString* %38, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %41 = or i1 %39, %40
  br i1 %41, label %60, label %42

42:                                               ; preds = %37
  %43 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %44 = load atomic i64, i64* %43 seq_cst, align 8
  %45 = icmp eq i64 %44, 1
  br i1 %45, label %49, label %46

46:                                               ; preds = %42
  %47 = atomicrmw sub i64* %43, i64 1 seq_cst
  %48 = icmp eq i64 %47, 1
  br i1 %48, label %49, label %60

49:                                               ; preds = %46, %42
  %50 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 1
  %51 = bitcast %"class.std::__y1::basic_string"* %50 to i8*
  %52 = load i8, i8* %51, align 8, !tbaa !12
  %53 = and i8 %52, 1
  %54 = icmp eq i8 %53, 0
  br i1 %54, label %58, label %55

55:                                               ; preds = %49
  %56 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %38, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %57 = load i8*, i8** %56, align 8, !tbaa !12
  call void @_ZdlPv(i8* %57) #18
  br label %58

58:                                               ; preds = %55, %49
  %59 = bitcast %struct.TStdString* %38 to i8*
  call void @_ZdlPv(i8* nonnull %59) #18
  br label %60

60:                                               ; preds = %37, %46, %58
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #17
  %61 = getelementptr inbounds i32, i32* %10, i64 1
  %62 = icmp eq i32* %61, getelementptr inbounds (%"struct.std::__y1::array.38", %"struct.std::__y1::array.38"* @_ZN3NYT6NYTree26TEnumTraitsImpl_EErrorCode6ValuesE, i64 1, i32 0, i64 0)
  br i1 %62, label %8, label %9

63:                                               ; preds = %9
  %64 = landingpad { i8*, i32 }
          cleanup
  %65 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %66 = icmp eq %struct.TStdString* %65, null
  %67 = icmp eq %struct.TStdString* %65, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %68 = or i1 %66, %67
  br i1 %68, label %134, label %69

69:                                               ; preds = %63
  %70 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %71 = load atomic i64, i64* %70 seq_cst, align 8
  %72 = icmp eq i64 %71, 1
  br i1 %72, label %76, label %73

73:                                               ; preds = %69
  %74 = atomicrmw sub i64* %70, i64 1 seq_cst
  %75 = icmp eq i64 %74, 1
  br i1 %75, label %76, label %134

76:                                               ; preds = %73, %69
  %77 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 1
  %78 = bitcast %"class.std::__y1::basic_string"* %77 to i8*
  %79 = load i8, i8* %78, align 8, !tbaa !12
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %76
  %83 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %65, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !12
  call void @_ZdlPv(i8* %84) #18
  br label %85

85:                                               ; preds = %82, %76
  %86 = bitcast %struct.TStdString* %65 to i8*
  call void @_ZdlPv(i8* nonnull %86) #18
  br label %134

87:                                               ; preds = %13
  %88 = landingpad { i8*, i32 }
          cleanup
  %89 = load %struct.TStdString*, %struct.TStdString** %6, align 8, !tbaa !10
  %90 = icmp eq %struct.TStdString* %89, null
  %91 = icmp eq %struct.TStdString* %89, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %92 = or i1 %90, %91
  br i1 %92, label %111, label %93

93:                                               ; preds = %87
  %94 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %95 = load atomic i64, i64* %94 seq_cst, align 8
  %96 = icmp eq i64 %95, 1
  br i1 %96, label %100, label %97

97:                                               ; preds = %93
  %98 = atomicrmw sub i64* %94, i64 1 seq_cst
  %99 = icmp eq i64 %98, 1
  br i1 %99, label %100, label %111

100:                                              ; preds = %97, %93
  %101 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 1
  %102 = bitcast %"class.std::__y1::basic_string"* %101 to i8*
  %103 = load i8, i8* %102, align 8, !tbaa !12
  %104 = and i8 %103, 1
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %109, label %106

106:                                              ; preds = %100
  %107 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %89, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %108 = load i8*, i8** %107, align 8, !tbaa !12
  call void @_ZdlPv(i8* %108) #18
  br label %109

109:                                              ; preds = %106, %100
  %110 = bitcast %struct.TStdString* %89 to i8*
  call void @_ZdlPv(i8* nonnull %110) #18
  br label %111

111:                                              ; preds = %109, %97, %87
  %112 = load %struct.TStdString*, %struct.TStdString** %7, align 8, !tbaa !10
  %113 = icmp eq %struct.TStdString* %112, null
  %114 = icmp eq %struct.TStdString* %112, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %115 = or i1 %113, %114
  br i1 %115, label %134, label %116

116:                                              ; preds = %111
  %117 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %118 = load atomic i64, i64* %117 seq_cst, align 8
  %119 = icmp eq i64 %118, 1
  br i1 %119, label %123, label %120

120:                                              ; preds = %116
  %121 = atomicrmw sub i64* %117, i64 1 seq_cst
  %122 = icmp eq i64 %121, 1
  br i1 %122, label %123, label %134

123:                                              ; preds = %120, %116
  %124 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 1
  %125 = bitcast %"class.std::__y1::basic_string"* %124 to i8*
  %126 = load i8, i8* %125, align 8, !tbaa !12
  %127 = and i8 %126, 1
  %128 = icmp eq i8 %127, 0
  br i1 %128, label %132, label %129

129:                                              ; preds = %123
  %130 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %112, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %131 = load i8*, i8** %130, align 8, !tbaa !12
  call void @_ZdlPv(i8* %131) #18
  br label %132

132:                                              ; preds = %129, %123
  %133 = bitcast %struct.TStdString* %112 to i8*
  call void @_ZdlPv(i8* nonnull %133) #18
  br label %134

134:                                              ; preds = %132, %120, %111, %85, %73, %63
  %135 = phi { i8*, i32 } [ %64, %63 ], [ %64, %73 ], [ %64, %85 ], [ %88, %111 ], [ %88, %120 ], [ %88, %132 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #17
  resume { i8*, i32 } %135
}

; Function Attrs: alwaysinline uwtable willreturn mustprogress
define linkonce_odr dso_local %"class.NYT::TRefCounter"* @_ZN3NYT6NYTree13GetRefCounterEPKNS0_20IAttributeDictionaryE(%"struct.NYT::NYTree::IAttributeDictionary"* %0) #4 comdat {
  %2 = icmp eq %"struct.NYT::NYTree::IAttributeDictionary"* %0, null
  %3 = getelementptr inbounds %"struct.NYT::NYTree::IAttributeDictionary", %"struct.NYT::NYTree::IAttributeDictionary"* %0, i64 0, i32 0, i32 1
  %4 = select i1 %2, %"class.NYT::TRefCounter"* null, %"class.NYT::TRefCounter"* %3
  ret %"class.NYT::TRefCounter"* %4
}

; Function Attrs: alwaysinline uwtable mustprogress
define linkonce_odr dso_local void @_ZN3NYT6NYTree17DestroyRefCountedEPKNS0_20IAttributeDictionaryE(%"struct.NYT::NYTree::IAttributeDictionary"* %0) #5 comdat {
  %2 = getelementptr %"struct.NYT::NYTree::IAttributeDictionary", %"struct.NYT::NYTree::IAttributeDictionary"* %0, i64 0, i32 0, i32 0
  %3 = bitcast %"struct.NYT::NYTree::IAttributeDictionary"* %0 to void (%"class.NYT::TRefCountedBase"*)***
  %4 = load void (%"class.NYT::TRefCountedBase"*)**, void (%"class.NYT::TRefCountedBase"*)*** %3, align 8, !tbaa !13
  %5 = getelementptr inbounds void (%"class.NYT::TRefCountedBase"*)*, void (%"class.NYT::TRefCountedBase"*)** %4, i64 2
  %6 = load void (%"class.NYT::TRefCountedBase"*)*, void (%"class.NYT::TRefCountedBase"*)** %5, align 8
  tail call void %6(%"class.NYT::TRefCountedBase"* nonnull dereferenceable(8) %2)
  ret void
}

; Function Attrs: alwaysinline uwtable
define linkonce_odr dso_local void @_ZN3NYT6NYTree20DeallocateRefCountedEPKNS0_20IAttributeDictionaryE(%"struct.NYT::NYTree::IAttributeDictionary"* %0) #6 comdat {
  %2 = bitcast %"struct.NYT::NYTree::IAttributeDictionary"* %0 to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !15
  %4 = and i64 %3, 281474976710655
  %5 = inttoptr i64 %4 to void (i8*, i16)*
  %6 = lshr i64 %3, 48
  %7 = trunc i64 %6 to i16
  %8 = bitcast %"struct.NYT::NYTree::IAttributeDictionary"* %0 to i8*
  %9 = sub nsw i64 0, %6
  %10 = getelementptr inbounds i8, i8* %8, i64 %9
  tail call void %5(i8* %10, i16 zeroext %7)
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable willreturn mustprogress
define dso_local %"class.NYT::NYson::TYsonPullParserCursor"* @toYsonCursor(i8* readnone %0) local_unnamed_addr #7 {
  %2 = bitcast i8* %0 to %"class.NYT::NYson::TYsonPullParserCursor"*
  ret %"class.NYT::NYson::TYsonPullParserCursor"* %2
}

; Function Attrs: norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i1 @IsDone(i8* nocapture readonly %0) local_unnamed_addr #8 {
  %2 = getelementptr inbounds i8, i8* %0, i64 13
  %3 = load i8, i8* %2, align 1, !tbaa !21
  %4 = icmp eq i8 %3, 0
  ret i1 %4
}

; Function Attrs: norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i8 @GetCurrentType(i8* nocapture readonly %0) local_unnamed_addr #8 {
  %2 = getelementptr inbounds i8, i8* %0, i64 13
  %3 = load i8, i8* %2, align 1, !tbaa !21
  ret i8 %3
}

; Function Attrs: uwtable mustprogress
define dso_local void @CallNext(i8* nocapture %0) local_unnamed_addr #9 {
  %2 = alloca %"class.NYT::NYson::TYsonItem", align 1
  %3 = bitcast %"class.NYT::NYson::TYsonItem"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 13, i8* nonnull %3) #17
  %4 = getelementptr inbounds i8, i8* %0, i64 16
  %5 = bitcast i8* %4 to %"class.NYT::NYson::TYsonPullParser"**
  %6 = load %"class.NYT::NYson::TYsonPullParser"*, %"class.NYT::NYson::TYsonPullParser"** %5, align 8, !tbaa !24
  call void @_ZN3NYT5NYson15TYsonPullParser4NextEv(%"class.NYT::NYson::TYsonItem"* nonnull sret(%"class.NYT::NYson::TYsonItem") align 1 %2, %"class.NYT::NYson::TYsonPullParser"* nonnull dereferenceable(321) %6)
  %7 = getelementptr inbounds i8, i8* %0, i64 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(13) %7, i8* nonnull align 1 dereferenceable(13) %3, i64 13, i1 false) #17
  call void @llvm.lifetime.end.p0i8(i64 13, i8* nonnull %3) #17
  ret void
}

; Function Attrs: uwtable mustprogress
define dso_local zeroext i1 @ValidateInt(i8* nocapture %0) local_unnamed_addr #9 {
  %2 = alloca %"class.NYT::NYson::TYsonItem", align 1
  %3 = getelementptr inbounds i8, i8* %0, i64 13
  %4 = load i8, i8* %3, align 1, !tbaa !21
  %5 = bitcast %"class.NYT::NYson::TYsonItem"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 13, i8* nonnull %5) #17
  %6 = getelementptr inbounds i8, i8* %0, i64 16
  %7 = bitcast i8* %6 to %"class.NYT::NYson::TYsonPullParser"**
  %8 = load %"class.NYT::NYson::TYsonPullParser"*, %"class.NYT::NYson::TYsonPullParser"** %7, align 8, !tbaa !24
  call void @_ZN3NYT5NYson15TYsonPullParser4NextEv(%"class.NYT::NYson::TYsonItem"* nonnull sret(%"class.NYT::NYson::TYsonItem") align 1 %2, %"class.NYT::NYson::TYsonPullParser"* nonnull dereferenceable(321) %8)
  %9 = getelementptr inbounds i8, i8* %0, i64 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(13) %9, i8* nonnull align 1 dereferenceable(13) %5, i64 13, i1 false) #17
  call void @llvm.lifetime.end.p0i8(i64 13, i8* nonnull %5) #17
  %10 = add i8 %4, -9
  %11 = icmp ult i8 %10, 2
  ret i1 %11
}

; Function Attrs: uwtable mustprogress
define dso_local zeroext i1 @ValidateString(i8* nocapture %0) local_unnamed_addr #9 {
  %2 = alloca %"class.NYT::NYson::TYsonItem", align 1
  %3 = getelementptr inbounds i8, i8* %0, i64 13
  %4 = load i8, i8* %3, align 1, !tbaa !21
  %5 = bitcast %"class.NYT::NYson::TYsonItem"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 13, i8* nonnull %5) #17
  %6 = getelementptr inbounds i8, i8* %0, i64 16
  %7 = bitcast i8* %6 to %"class.NYT::NYson::TYsonPullParser"**
  %8 = load %"class.NYT::NYson::TYsonPullParser"*, %"class.NYT::NYson::TYsonPullParser"** %7, align 8, !tbaa !24
  call void @_ZN3NYT5NYson15TYsonPullParser4NextEv(%"class.NYT::NYson::TYsonItem"* nonnull sret(%"class.NYT::NYson::TYsonItem") align 1 %2, %"class.NYT::NYson::TYsonPullParser"* nonnull dereferenceable(321) %8)
  %9 = getelementptr inbounds i8, i8* %0, i64 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(13) %9, i8* nonnull align 1 dereferenceable(13) %5, i64 13, i1 false) #17
  call void @llvm.lifetime.end.p0i8(i64 13, i8* nonnull %5) #17
  %10 = icmp eq i8 %4, 12
  ret i1 %10
}

; Function Attrs: norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i1 @IsBeginArray(i8* nocapture readonly %0) local_unnamed_addr #8 {
  %2 = getelementptr inbounds i8, i8* %0, i64 13
  %3 = load i8, i8* %2, align 1, !tbaa !21
  %4 = icmp eq i8 %3, 5
  ret i1 %4
}

; Function Attrs: norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i1 @IsEndArray(i8* nocapture readonly %0) local_unnamed_addr #8 {
  %2 = getelementptr inbounds i8, i8* %0, i64 13
  %3 = load i8, i8* %2, align 1, !tbaa !21
  %4 = icmp eq i8 %3, 6
  ret i1 %4
}

; Function Attrs: norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i1 @IsNull(i8* nocapture readonly %0) local_unnamed_addr #8 {
  %2 = getelementptr inbounds i8, i8* %0, i64 13
  %3 = load i8, i8* %2, align 1, !tbaa !21
  %4 = icmp eq i8 %3, 7
  ret i1 %4
}

declare %"class.NYT::TErrorCodeRegistry"* @_ZN3NYT18TErrorCodeRegistry3GetEv() local_unnamed_addr #10

declare void @_ZN3NYT18TErrorCodeRegistry17RegisterErrorCodeEiRKNS0_14TErrorCodeInfoE(%"class.NYT::TErrorCodeRegistry"* nonnull dereferenceable(56), i32, %"struct.NYT::TErrorCodeRegistry::TErrorCodeInfo"* nonnull align 8 dereferenceable(16)) local_unnamed_addr #10

declare void @_ZN3NYT18TErrorCodeRegistry14ParseNamespaceERKSt9type_info(%class.TBasicString* sret(%class.TBasicString) align 8, %"class.std::type_info"* nonnull align 8 dereferenceable(16)) local_unnamed_addr #10

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN3NYT11TEnumTraitsINS_10EErrorCodeELb1EE8ToStringES1_(%class.TBasicString* noalias sret(%class.TBasicString) align 8 %0, i32 %1) local_unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca [512 x i8], align 16
  %4 = alloca %class.TBasicString, align 8
  %5 = icmp ult i32 %1, 6
  br i1 %5, label %6, label %46

6:                                                ; preds = %2
  %7 = zext i32 %1 to i64
  %8 = getelementptr inbounds %"struct.std::__y1::array.33", %"struct.std::__y1::array.33"* bitcast ({ [6 x { i8*, i64 }] }* @_ZN3NYT26TEnumTraitsImpl_EErrorCode5NamesE to %"struct.std::__y1::array.33"*), i64 0, i32 0, i64 %7, i32 0, i32 0
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %"struct.std::__y1::array.33", %"struct.std::__y1::array.33"* bitcast ({ [6 x { i8*, i64 }] }* @_ZN3NYT26TEnumTraitsImpl_EErrorCode5NamesE to %"struct.std::__y1::array.33"*), i64 0, i32 0, i64 %7, i32 0, i32 1
  %11 = load i64, i64* %10, align 8
  tail call void @llvm.experimental.noalias.scope.decl(metadata !27)
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %44, label %13

13:                                               ; preds = %6
  tail call void @llvm.experimental.noalias.scope.decl(metadata !30), !noalias !27
  %14 = tail call noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19, !noalias !33
  %15 = bitcast i8* %14 to i64*
  store i64 1, i64* %15, align 8, !tbaa !34, !noalias !33
  %16 = getelementptr inbounds i8, i8* %14, i64 8
  %17 = icmp ugt i64 %11, -17
  br i1 %17, label %18, label %21

18:                                               ; preds = %13
  %19 = bitcast i8* %16 to %"class.std::__y1::basic_string"*
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %19) #20
          to label %20 unwind label %38, !noalias !33

20:                                               ; preds = %18
  unreachable

21:                                               ; preds = %13
  %22 = icmp ult i64 %11, 23
  br i1 %22, label %34, label %23

23:                                               ; preds = %21
  %24 = add nuw i64 %11, 16
  %25 = and i64 %24, -16
  %26 = invoke noalias nonnull i8* @_Znwm(i64 %25) #19
          to label %27 unwind label %38, !noalias !33

27:                                               ; preds = %23
  %28 = getelementptr inbounds i8, i8* %14, i64 24
  %29 = bitcast i8* %28 to i8**
  store i8* %26, i8** %29, align 8, !tbaa !12, !noalias !33
  %30 = or i64 %25, 1
  %31 = bitcast i8* %16 to i64*
  store i64 %30, i64* %31, align 8, !tbaa !12, !noalias !33
  %32 = getelementptr inbounds i8, i8* %14, i64 16
  %33 = bitcast i8* %32 to i64*
  store i64 %11, i64* %33, align 8, !tbaa !12, !noalias !33
  br label %40

34:                                               ; preds = %21
  %35 = trunc i64 %11 to i8
  %36 = shl nuw nsw i8 %35, 1
  store i8 %36, i8* %16, align 8, !tbaa !12, !noalias !33
  %37 = getelementptr inbounds i8, i8* %14, i64 9
  br label %40

38:                                               ; preds = %23, %18
  %39 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZdlPv(i8* nonnull %14) #18, !noalias !33
  resume { i8*, i32 } %39

40:                                               ; preds = %34, %27
  %41 = phi i8* [ %26, %27 ], [ %37, %34 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %41, i8* align 1 %9, i64 %11, i1 false) #17, !noalias !33
  %42 = getelementptr inbounds i8, i8* %41, i64 %11
  store i8 0, i8* %42, align 1, !tbaa !12, !noalias !33
  %43 = bitcast %class.TBasicString* %0 to i8**
  store i8* %14, i8** %43, align 8, !tbaa !10, !alias.scope !33
  br label %191

44:                                               ; preds = %6
  %45 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  store %struct.TStdString* bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %struct.TStdString** %45, align 8, !tbaa !10, !alias.scope !36
  br label %191

46:                                               ; preds = %2
  %47 = bitcast %class.TBasicString* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %47) #17
  %48 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %4, i64 0, i32 0, i32 0
  store %struct.TStdString* bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %struct.TStdString** %48, align 8, !tbaa !10, !alias.scope !39
  %49 = invoke nonnull align 8 dereferenceable(8) %class.TBasicString* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6assignEPKcm(%class.TBasicString* nonnull dereferenceable(8) %4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i64 0, i64 0), i64 10)
          to label %50 unwind label %141

50:                                               ; preds = %46
  %51 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %52 unwind label %141

52:                                               ; preds = %50
  %53 = load %struct.TStdString*, %struct.TStdString** %48, align 8, !tbaa !10
  %54 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %53, i64 0, i32 1
  %55 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %54, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
          to label %56 unwind label %141

56:                                               ; preds = %52
  %57 = getelementptr inbounds [512 x i8], [512 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %57) #17, !noalias !42
  %58 = invoke i64 @_Z12ToStringImplIiEmT_Pcm(i32 %1, i8* nonnull %57, i64 512)
          to label %59 unwind label %143

59:                                               ; preds = %56
  %60 = icmp eq i64 %58, 0
  br i1 %60, label %93, label %61

61:                                               ; preds = %59
  %62 = invoke noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19
          to label %63 unwind label %143

63:                                               ; preds = %61
  %64 = bitcast i8* %62 to i64*
  store i64 1, i64* %64, align 8, !tbaa !34, !noalias !47
  %65 = getelementptr inbounds i8, i8* %62, i64 8
  %66 = icmp ugt i64 %58, -17
  br i1 %66, label %67, label %70

67:                                               ; preds = %63
  %68 = bitcast i8* %65 to %"class.std::__y1::basic_string"*
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %68) #20
          to label %69 unwind label %87, !noalias !47

69:                                               ; preds = %67
  unreachable

70:                                               ; preds = %63
  %71 = icmp ult i64 %58, 23
  br i1 %71, label %83, label %72

72:                                               ; preds = %70
  %73 = add nuw i64 %58, 16
  %74 = and i64 %73, -16
  %75 = invoke noalias nonnull i8* @_Znwm(i64 %74) #19
          to label %76 unwind label %87, !noalias !47

76:                                               ; preds = %72
  %77 = getelementptr inbounds i8, i8* %62, i64 24
  %78 = bitcast i8* %77 to i8**
  store i8* %75, i8** %78, align 8, !tbaa !12, !noalias !47
  %79 = or i64 %74, 1
  %80 = bitcast i8* %65 to i64*
  store i64 %79, i64* %80, align 8, !tbaa !12, !noalias !47
  %81 = getelementptr inbounds i8, i8* %62, i64 16
  %82 = bitcast i8* %81 to i64*
  store i64 %58, i64* %82, align 8, !tbaa !12, !noalias !47
  br label %89

83:                                               ; preds = %70
  %84 = trunc i64 %58 to i8
  %85 = shl nuw nsw i8 %84, 1
  store i8 %85, i8* %65, align 8, !tbaa !12, !noalias !47
  %86 = getelementptr inbounds i8, i8* %62, i64 9
  br label %89

87:                                               ; preds = %72, %67
  %88 = landingpad { i8*, i32 }
          cleanup
  call void @_ZdlPv(i8* nonnull %62) #18, !noalias !47
  br label %166

89:                                               ; preds = %83, %76
  %90 = phi i8* [ %75, %76 ], [ %86, %83 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %90, i8* nonnull align 16 %57, i64 %58, i1 false) #17, !noalias !47
  %91 = getelementptr inbounds i8, i8* %90, i64 %58
  store i8 0, i8* %91, align 1, !tbaa !12, !noalias !47
  %92 = bitcast i8* %62 to %struct.TStdString*
  br label %93

93:                                               ; preds = %89, %59
  %94 = phi %struct.TStdString* [ %92, %89 ], [ bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %59 ]
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %57) #17, !noalias !42
  %95 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %96 unwind label %145

96:                                               ; preds = %93
  %97 = load %struct.TStdString*, %struct.TStdString** %48, align 8, !tbaa !10
  %98 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %97, i64 0, i32 1
  %99 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %94, i64 0, i32 1
  %100 = bitcast %"class.std::__y1::basic_string"* %99 to i8*
  %101 = load i8, i8* %100, align 8, !tbaa !12
  %102 = and i8 %101, 1
  %103 = icmp eq i8 %102, 0
  %104 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %94, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %105 = load i8*, i8** %104, align 8
  %106 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %94, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %107 = load i64, i64* %106, align 8
  %108 = bitcast %"class.std::__y1::basic_string"* %99 to %"struct.std::__y1::basic_string<char>::__short"*
  %109 = getelementptr inbounds %"struct.std::__y1::basic_string<char>::__short", %"struct.std::__y1::basic_string<char>::__short"* %108, i64 0, i32 1, i64 0
  %110 = lshr i8 %101, 1
  %111 = zext i8 %110 to i64
  %112 = select i1 %103, i8* %109, i8* %105
  %113 = select i1 %103, i64 %111, i64 %107
  %114 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %98, i8* %112, i64 %113)
          to label %115 unwind label %145

115:                                              ; preds = %96
  %116 = icmp eq %struct.TStdString* %94, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  br i1 %116, label %132, label %117

117:                                              ; preds = %115
  %118 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %94, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %119 = load atomic i64, i64* %118 seq_cst, align 8
  %120 = icmp eq i64 %119, 1
  br i1 %120, label %124, label %121

121:                                              ; preds = %117
  %122 = atomicrmw sub i64* %118, i64 1 seq_cst
  %123 = icmp eq i64 %122, 1
  br i1 %123, label %124, label %132

124:                                              ; preds = %121, %117
  %125 = load i8, i8* %100, align 8, !tbaa !12
  %126 = and i8 %125, 1
  %127 = icmp eq i8 %126, 0
  br i1 %127, label %130, label %128

128:                                              ; preds = %124
  %129 = load i8*, i8** %104, align 8, !tbaa !12
  call void @_ZdlPv(i8* %129) #18
  br label %130

130:                                              ; preds = %128, %124
  %131 = bitcast %struct.TStdString* %94 to i8*
  call void @_ZdlPv(i8* nonnull %131) #18
  br label %132

132:                                              ; preds = %115, %121, %130
  %133 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %134 unwind label %141

134:                                              ; preds = %132
  %135 = load %struct.TStdString*, %struct.TStdString** %48, align 8, !tbaa !10
  %136 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %135, i64 0, i32 1
  %137 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %136, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
          to label %138 unwind label %141

138:                                              ; preds = %134
  %139 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  %140 = load %struct.TStdString*, %struct.TStdString** %48, align 8, !tbaa !4
  store %struct.TStdString* %140, %struct.TStdString** %139, align 8, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #17
  br label %191

141:                                              ; preds = %134, %132, %52, %50, %46
  %142 = landingpad { i8*, i32 }
          cleanup
  br label %166

143:                                              ; preds = %61, %56
  %144 = landingpad { i8*, i32 }
          cleanup
  br label %166

145:                                              ; preds = %96, %93
  %146 = landingpad { i8*, i32 }
          cleanup
  %147 = icmp eq %struct.TStdString* %94, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  br i1 %147, label %166, label %148

148:                                              ; preds = %145
  %149 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %94, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %150 = load atomic i64, i64* %149 seq_cst, align 8
  %151 = icmp eq i64 %150, 1
  br i1 %151, label %155, label %152

152:                                              ; preds = %148
  %153 = atomicrmw sub i64* %149, i64 1 seq_cst
  %154 = icmp eq i64 %153, 1
  br i1 %154, label %155, label %166

155:                                              ; preds = %152, %148
  %156 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %94, i64 0, i32 1
  %157 = bitcast %"class.std::__y1::basic_string"* %156 to i8*
  %158 = load i8, i8* %157, align 8, !tbaa !12
  %159 = and i8 %158, 1
  %160 = icmp eq i8 %159, 0
  br i1 %160, label %164, label %161

161:                                              ; preds = %155
  %162 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %94, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %163 = load i8*, i8** %162, align 8, !tbaa !12
  call void @_ZdlPv(i8* %163) #18
  br label %164

164:                                              ; preds = %161, %155
  %165 = bitcast %struct.TStdString* %94 to i8*
  call void @_ZdlPv(i8* nonnull %165) #18
  br label %166

166:                                              ; preds = %87, %143, %145, %152, %164, %141
  %167 = phi { i8*, i32 } [ %142, %141 ], [ %144, %143 ], [ %88, %87 ], [ %146, %145 ], [ %146, %152 ], [ %146, %164 ]
  %168 = load %struct.TStdString*, %struct.TStdString** %48, align 8, !tbaa !10
  %169 = icmp eq %struct.TStdString* %168, null
  %170 = icmp eq %struct.TStdString* %168, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %171 = or i1 %169, %170
  br i1 %171, label %190, label %172

172:                                              ; preds = %166
  %173 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %168, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %174 = load atomic i64, i64* %173 seq_cst, align 8
  %175 = icmp eq i64 %174, 1
  br i1 %175, label %179, label %176

176:                                              ; preds = %172
  %177 = atomicrmw sub i64* %173, i64 1 seq_cst
  %178 = icmp eq i64 %177, 1
  br i1 %178, label %179, label %190

179:                                              ; preds = %176, %172
  %180 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %168, i64 0, i32 1
  %181 = bitcast %"class.std::__y1::basic_string"* %180 to i8*
  %182 = load i8, i8* %181, align 8, !tbaa !12
  %183 = and i8 %182, 1
  %184 = icmp eq i8 %183, 0
  br i1 %184, label %188, label %185

185:                                              ; preds = %179
  %186 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %168, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %187 = load i8*, i8** %186, align 8, !tbaa !12
  call void @_ZdlPv(i8* %187) #18
  br label %188

188:                                              ; preds = %185, %179
  %189 = bitcast %struct.TStdString* %168 to i8*
  call void @_ZdlPv(i8* nonnull %189) #18
  br label %190

190:                                              ; preds = %166, %176, %188
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #17
  resume { i8*, i32 } %167

191:                                              ; preds = %44, %40, %138
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nobuiltin nofree allocsize(0)
declare nonnull i8* @_Znwm(i64) local_unnamed_addr #11

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #12

; Function Attrs: noreturn uwtable mustprogress
define linkonce_odr dso_local void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %0) local_unnamed_addr #13 comdat align 2 {
  tail call void @_ZNSt4__y120__throw_length_errorEPKc(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i64 0, i64 0)) #20
  unreachable
}

; Function Attrs: inlinehint noreturn uwtable mustprogress
define linkonce_odr dso_local void @_ZNSt4__y120__throw_length_errorEPKc(i8* %0) local_unnamed_addr #14 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 16) #17
  %3 = bitcast i8* %2 to %"class.std::length_error"*
  invoke void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* nonnull dereferenceable(16) %3, i8* %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(i8* %2, i8* bitcast (i8** @_ZTISt12length_error to i8*), i8* bitcast (void (%"class.std::length_error"*)* @_ZNSt12length_errorD1Ev to i8*)) #20
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #17
  resume { i8*, i32 } %6
}

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* nonnull dereferenceable(16) %0, i8* %1) unnamed_addr #0 comdat align 2 {
  %3 = getelementptr inbounds %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* nonnull dereferenceable(16) %3, i8* %1)
  %4 = getelementptr inbounds %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12length_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !13
  ret void
}

declare void @__cxa_free_exception(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt12length_errorD1Ev(%"class.std::length_error"* nonnull dereferenceable(16)) unnamed_addr #15

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* nonnull dereferenceable(16), i8*) unnamed_addr #10

; Function Attrs: uwtable
define linkonce_odr dso_local nonnull align 8 dereferenceable(8) %class.TBasicString* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6assignEPKcm(%class.TBasicString* nonnull dereferenceable(8) %0, i8* %1, i64 %2) local_unnamed_addr #0 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %4 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  %5 = load %struct.TStdString*, %struct.TStdString** %4, align 8, !tbaa !10
  %6 = icmp eq %struct.TStdString* %5, null
  %7 = icmp eq %struct.TStdString* %5, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %8 = or i1 %6, %7
  br i1 %8, label %18, label %9

9:                                                ; preds = %3
  %10 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %11 = load atomic i64, i64* %10 seq_cst, align 8
  %12 = icmp eq i64 %11, 1
  br i1 %12, label %13, label %18

13:                                               ; preds = %9
  %14 = tail call i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %0)
  %15 = load %struct.TStdString*, %struct.TStdString** %4, align 8, !tbaa !10
  %16 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %15, i64 0, i32 1
  %17 = tail call nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKcm(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %16, i8* %1, i64 %2)
  br label %75

18:                                               ; preds = %3, %9
  %19 = icmp eq i64 %2, 0
  br i1 %19, label %51, label %20

20:                                               ; preds = %18
  %21 = tail call noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19, !noalias !50
  %22 = bitcast i8* %21 to i64*
  store i64 1, i64* %22, align 8, !tbaa !34, !noalias !50
  %23 = getelementptr inbounds i8, i8* %21, i64 8
  %24 = icmp ugt i64 %2, -17
  br i1 %24, label %25, label %28

25:                                               ; preds = %20
  %26 = bitcast i8* %23 to %"class.std::__y1::basic_string"*
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %26) #20
          to label %27 unwind label %45, !noalias !50

27:                                               ; preds = %25
  unreachable

28:                                               ; preds = %20
  %29 = icmp ult i64 %2, 23
  br i1 %29, label %41, label %30

30:                                               ; preds = %28
  %31 = add nuw i64 %2, 16
  %32 = and i64 %31, -16
  %33 = invoke noalias nonnull i8* @_Znwm(i64 %32) #19
          to label %34 unwind label %45, !noalias !50

34:                                               ; preds = %30
  %35 = getelementptr inbounds i8, i8* %21, i64 24
  %36 = bitcast i8* %35 to i8**
  store i8* %33, i8** %36, align 8, !tbaa !12, !noalias !50
  %37 = or i64 %32, 1
  %38 = bitcast i8* %23 to i64*
  store i64 %37, i64* %38, align 8, !tbaa !12, !noalias !50
  %39 = getelementptr inbounds i8, i8* %21, i64 16
  %40 = bitcast i8* %39 to i64*
  store i64 %2, i64* %40, align 8, !tbaa !12, !noalias !50
  br label %47

41:                                               ; preds = %28
  %42 = trunc i64 %2 to i8
  %43 = shl nuw nsw i8 %42, 1
  store i8 %43, i8* %23, align 8, !tbaa !12, !noalias !50
  %44 = getelementptr inbounds i8, i8* %21, i64 9
  br label %47

45:                                               ; preds = %30, %25
  %46 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZdlPv(i8* nonnull %21) #18, !noalias !50
  resume { i8*, i32 } %46

47:                                               ; preds = %41, %34
  %48 = phi i8* [ %33, %34 ], [ %44, %41 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %48, i8* align 1 %1, i64 %2, i1 false) #17, !noalias !50
  %49 = getelementptr inbounds i8, i8* %48, i64 %2
  store i8 0, i8* %49, align 1, !tbaa !12, !noalias !50
  %50 = bitcast i8* %21 to %struct.TStdString*
  br label %51

51:                                               ; preds = %18, %47
  %52 = phi %struct.TStdString* [ %50, %47 ], [ bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %18 ]
  %53 = load %struct.TStdString*, %struct.TStdString** %4, align 8, !tbaa !4
  store %struct.TStdString* %52, %struct.TStdString** %4, align 8, !tbaa !4
  %54 = icmp eq %struct.TStdString* %53, null
  %55 = icmp eq %struct.TStdString* %53, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %56 = or i1 %54, %55
  br i1 %56, label %75, label %57

57:                                               ; preds = %51
  %58 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %53, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %59 = load atomic i64, i64* %58 seq_cst, align 8
  %60 = icmp eq i64 %59, 1
  br i1 %60, label %64, label %61

61:                                               ; preds = %57
  %62 = atomicrmw sub i64* %58, i64 1 seq_cst
  %63 = icmp eq i64 %62, 1
  br i1 %63, label %64, label %75

64:                                               ; preds = %61, %57
  %65 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %53, i64 0, i32 1
  %66 = bitcast %"class.std::__y1::basic_string"* %65 to i8*
  %67 = load i8, i8* %66, align 8, !tbaa !12
  %68 = and i8 %67, 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %64
  %71 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %53, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %72 = load i8*, i8** %71, align 8, !tbaa !12
  tail call void @_ZdlPv(i8* %72) #18
  br label %73

73:                                               ; preds = %70, %64
  %74 = bitcast %struct.TStdString* %53 to i8*
  tail call void @_ZdlPv(i8* nonnull %74) #18
  br label %75

75:                                               ; preds = %73, %61, %51, %13
  ret %class.TBasicString* %0
}

declare nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKcm(%"class.std::__y1::basic_string"* nonnull dereferenceable(24), i8*, i64) local_unnamed_addr #10

; Function Attrs: uwtable
define linkonce_odr dso_local i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %0) local_unnamed_addr #0 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  %3 = load %struct.TStdString*, %struct.TStdString** %2, align 8, !tbaa !10
  %4 = icmp eq %struct.TStdString* %3, null
  %5 = icmp eq %struct.TStdString* %3, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %6 = or i1 %4, %5
  br i1 %6, label %13, label %7, !prof !53

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %9 = load atomic i64, i64* %8 seq_cst, align 8
  %10 = icmp eq i64 %9, 1
  br i1 %10, label %87, label %11, !prof !54

11:                                               ; preds = %7
  %12 = load %struct.TStdString*, %struct.TStdString** %2, align 8, !tbaa !10
  br label %13

13:                                               ; preds = %11, %1
  %14 = phi %struct.TStdString* [ %12, %11 ], [ %3, %1 ]
  %15 = tail call noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19, !noalias !55
  %16 = bitcast i8* %15 to i64*
  store i64 1, i64* %16, align 8, !tbaa !34, !noalias !55
  %17 = getelementptr inbounds i8, i8* %15, i64 8
  %18 = bitcast i8* %17 to %"class.std::__y1::basic_string"*
  %19 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %14, i64 0, i32 1
  %20 = bitcast %"class.std::__y1::basic_string"* %19 to i8*
  %21 = load i8, i8* %20, align 8, !tbaa !12, !noalias !55
  %22 = and i8 %21, 1
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %24, label %29

24:                                               ; preds = %13
  %25 = bitcast %"class.std::__y1::basic_string"* %19 to %"struct.std::__y1::basic_string<char>::__short"*
  %26 = getelementptr inbounds %"struct.std::__y1::basic_string<char>::__short", %"struct.std::__y1::basic_string<char>::__short"* %25, i64 0, i32 1, i64 0
  %27 = lshr i8 %21, 1
  %28 = zext i8 %27 to i64
  br label %37

29:                                               ; preds = %13
  %30 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %14, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %31 = load i8*, i8** %30, align 8, !tbaa !12, !noalias !55
  %32 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %14, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %33 = load i64, i64* %32, align 8, !tbaa !12, !noalias !55
  %34 = icmp ugt i64 %33, -17
  br i1 %34, label %35, label %37

35:                                               ; preds = %29
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %18) #20
          to label %36 unwind label %59, !noalias !55

36:                                               ; preds = %35
  unreachable

37:                                               ; preds = %29, %24
  %38 = phi i64 [ %28, %24 ], [ %33, %29 ]
  %39 = phi i8* [ %26, %24 ], [ %31, %29 ]
  %40 = icmp ult i64 %38, 23
  br i1 %40, label %52, label %41

41:                                               ; preds = %37
  %42 = add nuw i64 %38, 16
  %43 = and i64 %42, -16
  %44 = invoke noalias nonnull i8* @_Znwm(i64 %43) #19
          to label %45 unwind label %59, !noalias !55

45:                                               ; preds = %41
  %46 = getelementptr inbounds i8, i8* %15, i64 24
  %47 = bitcast i8* %46 to i8**
  store i8* %44, i8** %47, align 8, !tbaa !12, !noalias !55
  %48 = or i64 %43, 1
  %49 = bitcast i8* %17 to i64*
  store i64 %48, i64* %49, align 8, !tbaa !12, !noalias !55
  %50 = getelementptr inbounds i8, i8* %15, i64 16
  %51 = bitcast i8* %50 to i64*
  store i64 %38, i64* %51, align 8, !tbaa !12, !noalias !55
  br label %57

52:                                               ; preds = %37
  %53 = trunc i64 %38 to i8
  %54 = shl nuw nsw i8 %53, 1
  store i8 %54, i8* %17, align 8, !tbaa !12, !noalias !55
  %55 = getelementptr inbounds i8, i8* %15, i64 9
  %56 = icmp eq i64 %38, 0
  br i1 %56, label %61, label %57

57:                                               ; preds = %52, %45
  %58 = phi i8* [ %44, %45 ], [ %55, %52 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %58, i8* align 1 %39, i64 %38, i1 false) #17, !noalias !55
  br label %61

59:                                               ; preds = %41, %35
  %60 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZdlPv(i8* nonnull %15) #18, !noalias !55
  resume { i8*, i32 } %60

61:                                               ; preds = %52, %57
  %62 = phi i8* [ %55, %52 ], [ %58, %57 ]
  %63 = getelementptr inbounds i8, i8* %62, i64 %38
  store i8 0, i8* %63, align 1, !tbaa !12, !noalias !55
  %64 = load %struct.TStdString*, %struct.TStdString** %2, align 8, !tbaa !4
  %65 = bitcast %class.TBasicString* %0 to i8**
  store i8* %15, i8** %65, align 8, !tbaa !4
  %66 = icmp eq %struct.TStdString* %64, null
  %67 = icmp eq %struct.TStdString* %64, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %68 = or i1 %66, %67
  br i1 %68, label %87, label %69

69:                                               ; preds = %61
  %70 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %64, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %71 = load atomic i64, i64* %70 seq_cst, align 8
  %72 = icmp eq i64 %71, 1
  br i1 %72, label %76, label %73

73:                                               ; preds = %69
  %74 = atomicrmw sub i64* %70, i64 1 seq_cst
  %75 = icmp eq i64 %74, 1
  br i1 %75, label %76, label %87

76:                                               ; preds = %73, %69
  %77 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %64, i64 0, i32 1
  %78 = bitcast %"class.std::__y1::basic_string"* %77 to i8*
  %79 = load i8, i8* %78, align 8, !tbaa !12
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %76
  %83 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %64, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !12
  tail call void @_ZdlPv(i8* %84) #18
  br label %85

85:                                               ; preds = %82, %76
  %86 = bitcast %struct.TStdString* %64 to i8*
  tail call void @_ZdlPv(i8* nonnull %86) #18
  br label %87

87:                                               ; preds = %85, %73, %61, %7
  %88 = load %struct.TStdString*, %struct.TStdString** %2, align 8, !tbaa !10
  %89 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %88, i64 0, i32 1
  %90 = bitcast %"class.std::__y1::basic_string"* %89 to i8*
  %91 = load i8, i8* %90, align 8, !tbaa !12
  %92 = and i8 %91, 1
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %97, label %94

94:                                               ; preds = %87
  %95 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %88, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %96 = load i8*, i8** %95, align 8, !tbaa !12
  br label %100

97:                                               ; preds = %87
  %98 = bitcast %"class.std::__y1::basic_string"* %89 to %"struct.std::__y1::basic_string<char>::__short"*
  %99 = getelementptr inbounds %"struct.std::__y1::basic_string<char>::__short", %"struct.std::__y1::basic_string<char>::__short"* %98, i64 0, i32 1, i64 0
  br label %100

100:                                              ; preds = %94, %97
  %101 = phi i8* [ %96, %94 ], [ %99, %97 ]
  ret i8* %101
}

declare nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24), i8*) local_unnamed_addr #10

declare i64 @_Z12ToStringImplIiEmT_Pcm(i32, i8*, i64) local_unnamed_addr #10

declare nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__y1::basic_string"* nonnull dereferenceable(24), i8*, i64) local_unnamed_addr #10

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN3NYT11TEnumTraitsINS_4NBus10EErrorCodeELb1EE8ToStringES2_(%class.TBasicString* noalias sret(%class.TBasicString) align 8 %0, i32 %1) local_unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca [512 x i8], align 16
  %4 = alloca %class.TBasicString, align 8
  %5 = icmp eq i32 %1, 100
  br i1 %5, label %6, label %13

6:                                                ; preds = %2
  tail call void @llvm.experimental.noalias.scope.decl(metadata !58)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !61), !noalias !58
  %7 = tail call noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19, !noalias !64
  %8 = bitcast i8* %7 to i64*
  store i64 1, i64* %8, align 8, !tbaa !34, !noalias !64
  %9 = getelementptr inbounds i8, i8* %7, i64 8
  store i8 28, i8* %9, align 8, !tbaa !12, !noalias !64
  %10 = getelementptr inbounds i8, i8* %7, i64 9
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(14) %10, i8* nonnull align 1 dereferenceable(14) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.14, i64 0, i64 0), i64 14, i1 false) #17, !noalias !64
  %11 = getelementptr inbounds i8, i8* %7, i64 23
  store i8 0, i8* %11, align 1, !tbaa !12, !noalias !64
  %12 = bitcast %class.TBasicString* %0 to i8**
  store i8* %7, i8** %12, align 8, !tbaa !10, !alias.scope !64
  br label %158

13:                                               ; preds = %2
  %14 = bitcast %class.TBasicString* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14) #17
  %15 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %4, i64 0, i32 0, i32 0
  store %struct.TStdString* bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %struct.TStdString** %15, align 8, !tbaa !10, !alias.scope !65
  %16 = invoke nonnull align 8 dereferenceable(8) %class.TBasicString* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6assignEPKcm(%class.TBasicString* nonnull dereferenceable(8) %4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i64 0, i64 0), i64 10)
          to label %17 unwind label %108

17:                                               ; preds = %13
  %18 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %19 unwind label %108

19:                                               ; preds = %17
  %20 = load %struct.TStdString*, %struct.TStdString** %15, align 8, !tbaa !10
  %21 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %20, i64 0, i32 1
  %22 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %21, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
          to label %23 unwind label %108

23:                                               ; preds = %19
  %24 = getelementptr inbounds [512 x i8], [512 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %24) #17, !noalias !68
  %25 = invoke i64 @_Z12ToStringImplIiEmT_Pcm(i32 %1, i8* nonnull %24, i64 512)
          to label %26 unwind label %110

26:                                               ; preds = %23
  %27 = icmp eq i64 %25, 0
  br i1 %27, label %60, label %28

28:                                               ; preds = %26
  %29 = invoke noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19
          to label %30 unwind label %110

30:                                               ; preds = %28
  %31 = bitcast i8* %29 to i64*
  store i64 1, i64* %31, align 8, !tbaa !34, !noalias !73
  %32 = getelementptr inbounds i8, i8* %29, i64 8
  %33 = icmp ugt i64 %25, -17
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = bitcast i8* %32 to %"class.std::__y1::basic_string"*
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %35) #20
          to label %36 unwind label %54, !noalias !73

36:                                               ; preds = %34
  unreachable

37:                                               ; preds = %30
  %38 = icmp ult i64 %25, 23
  br i1 %38, label %50, label %39

39:                                               ; preds = %37
  %40 = add nuw i64 %25, 16
  %41 = and i64 %40, -16
  %42 = invoke noalias nonnull i8* @_Znwm(i64 %41) #19
          to label %43 unwind label %54, !noalias !73

43:                                               ; preds = %39
  %44 = getelementptr inbounds i8, i8* %29, i64 24
  %45 = bitcast i8* %44 to i8**
  store i8* %42, i8** %45, align 8, !tbaa !12, !noalias !73
  %46 = or i64 %41, 1
  %47 = bitcast i8* %32 to i64*
  store i64 %46, i64* %47, align 8, !tbaa !12, !noalias !73
  %48 = getelementptr inbounds i8, i8* %29, i64 16
  %49 = bitcast i8* %48 to i64*
  store i64 %25, i64* %49, align 8, !tbaa !12, !noalias !73
  br label %56

50:                                               ; preds = %37
  %51 = trunc i64 %25 to i8
  %52 = shl nuw nsw i8 %51, 1
  store i8 %52, i8* %32, align 8, !tbaa !12, !noalias !73
  %53 = getelementptr inbounds i8, i8* %29, i64 9
  br label %56

54:                                               ; preds = %39, %34
  %55 = landingpad { i8*, i32 }
          cleanup
  call void @_ZdlPv(i8* nonnull %29) #18, !noalias !73
  br label %133

56:                                               ; preds = %50, %43
  %57 = phi i8* [ %42, %43 ], [ %53, %50 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %57, i8* nonnull align 16 %24, i64 %25, i1 false) #17, !noalias !73
  %58 = getelementptr inbounds i8, i8* %57, i64 %25
  store i8 0, i8* %58, align 1, !tbaa !12, !noalias !73
  %59 = bitcast i8* %29 to %struct.TStdString*
  br label %60

60:                                               ; preds = %56, %26
  %61 = phi %struct.TStdString* [ %59, %56 ], [ bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %26 ]
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %24) #17, !noalias !68
  %62 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %63 unwind label %112

63:                                               ; preds = %60
  %64 = load %struct.TStdString*, %struct.TStdString** %15, align 8, !tbaa !10
  %65 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %64, i64 0, i32 1
  %66 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %61, i64 0, i32 1
  %67 = bitcast %"class.std::__y1::basic_string"* %66 to i8*
  %68 = load i8, i8* %67, align 8, !tbaa !12
  %69 = and i8 %68, 1
  %70 = icmp eq i8 %69, 0
  %71 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %61, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %72 = load i8*, i8** %71, align 8
  %73 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %61, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %74 = load i64, i64* %73, align 8
  %75 = bitcast %"class.std::__y1::basic_string"* %66 to %"struct.std::__y1::basic_string<char>::__short"*
  %76 = getelementptr inbounds %"struct.std::__y1::basic_string<char>::__short", %"struct.std::__y1::basic_string<char>::__short"* %75, i64 0, i32 1, i64 0
  %77 = lshr i8 %68, 1
  %78 = zext i8 %77 to i64
  %79 = select i1 %70, i8* %76, i8* %72
  %80 = select i1 %70, i64 %78, i64 %74
  %81 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %65, i8* %79, i64 %80)
          to label %82 unwind label %112

82:                                               ; preds = %63
  %83 = icmp eq %struct.TStdString* %61, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  br i1 %83, label %99, label %84

84:                                               ; preds = %82
  %85 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %61, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %86 = load atomic i64, i64* %85 seq_cst, align 8
  %87 = icmp eq i64 %86, 1
  br i1 %87, label %91, label %88

88:                                               ; preds = %84
  %89 = atomicrmw sub i64* %85, i64 1 seq_cst
  %90 = icmp eq i64 %89, 1
  br i1 %90, label %91, label %99

91:                                               ; preds = %88, %84
  %92 = load i8, i8* %67, align 8, !tbaa !12
  %93 = and i8 %92, 1
  %94 = icmp eq i8 %93, 0
  br i1 %94, label %97, label %95

95:                                               ; preds = %91
  %96 = load i8*, i8** %71, align 8, !tbaa !12
  call void @_ZdlPv(i8* %96) #18
  br label %97

97:                                               ; preds = %95, %91
  %98 = bitcast %struct.TStdString* %61 to i8*
  call void @_ZdlPv(i8* nonnull %98) #18
  br label %99

99:                                               ; preds = %82, %88, %97
  %100 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %101 unwind label %108

101:                                              ; preds = %99
  %102 = load %struct.TStdString*, %struct.TStdString** %15, align 8, !tbaa !10
  %103 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %102, i64 0, i32 1
  %104 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %103, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
          to label %105 unwind label %108

105:                                              ; preds = %101
  %106 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  %107 = load %struct.TStdString*, %struct.TStdString** %15, align 8, !tbaa !4
  store %struct.TStdString* %107, %struct.TStdString** %106, align 8, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #17
  br label %158

108:                                              ; preds = %101, %99, %19, %17, %13
  %109 = landingpad { i8*, i32 }
          cleanup
  br label %133

110:                                              ; preds = %28, %23
  %111 = landingpad { i8*, i32 }
          cleanup
  br label %133

112:                                              ; preds = %63, %60
  %113 = landingpad { i8*, i32 }
          cleanup
  %114 = icmp eq %struct.TStdString* %61, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  br i1 %114, label %133, label %115

115:                                              ; preds = %112
  %116 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %61, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %117 = load atomic i64, i64* %116 seq_cst, align 8
  %118 = icmp eq i64 %117, 1
  br i1 %118, label %122, label %119

119:                                              ; preds = %115
  %120 = atomicrmw sub i64* %116, i64 1 seq_cst
  %121 = icmp eq i64 %120, 1
  br i1 %121, label %122, label %133

122:                                              ; preds = %119, %115
  %123 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %61, i64 0, i32 1
  %124 = bitcast %"class.std::__y1::basic_string"* %123 to i8*
  %125 = load i8, i8* %124, align 8, !tbaa !12
  %126 = and i8 %125, 1
  %127 = icmp eq i8 %126, 0
  br i1 %127, label %131, label %128

128:                                              ; preds = %122
  %129 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %61, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %130 = load i8*, i8** %129, align 8, !tbaa !12
  call void @_ZdlPv(i8* %130) #18
  br label %131

131:                                              ; preds = %128, %122
  %132 = bitcast %struct.TStdString* %61 to i8*
  call void @_ZdlPv(i8* nonnull %132) #18
  br label %133

133:                                              ; preds = %54, %110, %112, %119, %131, %108
  %134 = phi { i8*, i32 } [ %109, %108 ], [ %111, %110 ], [ %55, %54 ], [ %113, %112 ], [ %113, %119 ], [ %113, %131 ]
  %135 = load %struct.TStdString*, %struct.TStdString** %15, align 8, !tbaa !10
  %136 = icmp eq %struct.TStdString* %135, null
  %137 = icmp eq %struct.TStdString* %135, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %138 = or i1 %136, %137
  br i1 %138, label %157, label %139

139:                                              ; preds = %133
  %140 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %135, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %141 = load atomic i64, i64* %140 seq_cst, align 8
  %142 = icmp eq i64 %141, 1
  br i1 %142, label %146, label %143

143:                                              ; preds = %139
  %144 = atomicrmw sub i64* %140, i64 1 seq_cst
  %145 = icmp eq i64 %144, 1
  br i1 %145, label %146, label %157

146:                                              ; preds = %143, %139
  %147 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %135, i64 0, i32 1
  %148 = bitcast %"class.std::__y1::basic_string"* %147 to i8*
  %149 = load i8, i8* %148, align 8, !tbaa !12
  %150 = and i8 %149, 1
  %151 = icmp eq i8 %150, 0
  br i1 %151, label %155, label %152

152:                                              ; preds = %146
  %153 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %135, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %154 = load i8*, i8** %153, align 8, !tbaa !12
  call void @_ZdlPv(i8* %154) #18
  br label %155

155:                                              ; preds = %152, %146
  %156 = bitcast %struct.TStdString* %135 to i8*
  call void @_ZdlPv(i8* nonnull %156) #18
  br label %157

157:                                              ; preds = %133, %143, %155
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #17
  resume { i8*, i32 } %134

158:                                              ; preds = %6, %105
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN3NYT11TEnumTraitsINS_4NRpc10EErrorCodeELb1EE8ToStringES2_(%class.TBasicString* noalias sret(%class.TBasicString) align 8 %0, i32 %1) local_unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca [512 x i8], align 16
  %4 = alloca %class.TBasicString, align 8
  %5 = add i32 %1, -100
  %6 = icmp ult i32 %5, 18
  br i1 %6, label %7, label %53

7:                                                ; preds = %2
  %8 = lshr i32 261999, %5
  %9 = and i32 %8, 1
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %53, label %11

11:                                               ; preds = %7
  %12 = sext i32 %5 to i64
  %13 = getelementptr inbounds [18 x i64], [18 x i64]* @switch.table._ZN3NYT11TEnumTraitsINS_4NRpc10EErrorCodeELb1EE8ToStringES2_, i64 0, i64 %12
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %"struct.std::__y1::array.37", %"struct.std::__y1::array.37"* bitcast ({ [16 x { i8*, i64 }] }* @_ZN3NYT4NRpc26TEnumTraitsImpl_EErrorCode5NamesE to %"struct.std::__y1::array.37"*), i64 0, i32 0, i64 %14, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr inbounds %"struct.std::__y1::array.37", %"struct.std::__y1::array.37"* bitcast ({ [16 x { i8*, i64 }] }* @_ZN3NYT4NRpc26TEnumTraitsImpl_EErrorCode5NamesE to %"struct.std::__y1::array.37"*), i64 0, i32 0, i64 %14, i32 0, i32 1
  %18 = load i64, i64* %17, align 8
  tail call void @llvm.experimental.noalias.scope.decl(metadata !76)
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %51, label %20

20:                                               ; preds = %11
  tail call void @llvm.experimental.noalias.scope.decl(metadata !79), !noalias !76
  %21 = tail call noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19, !noalias !82
  %22 = bitcast i8* %21 to i64*
  store i64 1, i64* %22, align 8, !tbaa !34, !noalias !82
  %23 = getelementptr inbounds i8, i8* %21, i64 8
  %24 = icmp ugt i64 %18, -17
  br i1 %24, label %25, label %28

25:                                               ; preds = %20
  %26 = bitcast i8* %23 to %"class.std::__y1::basic_string"*
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %26) #20
          to label %27 unwind label %45, !noalias !82

27:                                               ; preds = %25
  unreachable

28:                                               ; preds = %20
  %29 = icmp ult i64 %18, 23
  br i1 %29, label %41, label %30

30:                                               ; preds = %28
  %31 = add nuw i64 %18, 16
  %32 = and i64 %31, -16
  %33 = invoke noalias nonnull i8* @_Znwm(i64 %32) #19
          to label %34 unwind label %45, !noalias !82

34:                                               ; preds = %30
  %35 = getelementptr inbounds i8, i8* %21, i64 24
  %36 = bitcast i8* %35 to i8**
  store i8* %33, i8** %36, align 8, !tbaa !12, !noalias !82
  %37 = or i64 %32, 1
  %38 = bitcast i8* %23 to i64*
  store i64 %37, i64* %38, align 8, !tbaa !12, !noalias !82
  %39 = getelementptr inbounds i8, i8* %21, i64 16
  %40 = bitcast i8* %39 to i64*
  store i64 %18, i64* %40, align 8, !tbaa !12, !noalias !82
  br label %47

41:                                               ; preds = %28
  %42 = trunc i64 %18 to i8
  %43 = shl nuw nsw i8 %42, 1
  store i8 %43, i8* %23, align 8, !tbaa !12, !noalias !82
  %44 = getelementptr inbounds i8, i8* %21, i64 9
  br label %47

45:                                               ; preds = %30, %25
  %46 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZdlPv(i8* nonnull %21) #18, !noalias !82
  resume { i8*, i32 } %46

47:                                               ; preds = %41, %34
  %48 = phi i8* [ %33, %34 ], [ %44, %41 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %48, i8* align 1 %16, i64 %18, i1 false) #17, !noalias !82
  %49 = getelementptr inbounds i8, i8* %48, i64 %18
  store i8 0, i8* %49, align 1, !tbaa !12, !noalias !82
  %50 = bitcast %class.TBasicString* %0 to i8**
  store i8* %21, i8** %50, align 8, !tbaa !10, !alias.scope !82
  br label %198

51:                                               ; preds = %11
  %52 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  store %struct.TStdString* bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %struct.TStdString** %52, align 8, !tbaa !10, !alias.scope !83
  br label %198

53:                                               ; preds = %7, %2
  %54 = bitcast %class.TBasicString* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %54) #17
  %55 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %4, i64 0, i32 0, i32 0
  store %struct.TStdString* bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %struct.TStdString** %55, align 8, !tbaa !10, !alias.scope !86
  %56 = invoke nonnull align 8 dereferenceable(8) %class.TBasicString* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6assignEPKcm(%class.TBasicString* nonnull dereferenceable(8) %4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i64 0, i64 0), i64 10)
          to label %57 unwind label %148

57:                                               ; preds = %53
  %58 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %59 unwind label %148

59:                                               ; preds = %57
  %60 = load %struct.TStdString*, %struct.TStdString** %55, align 8, !tbaa !10
  %61 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %60, i64 0, i32 1
  %62 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %61, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
          to label %63 unwind label %148

63:                                               ; preds = %59
  %64 = getelementptr inbounds [512 x i8], [512 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %64) #17, !noalias !89
  %65 = invoke i64 @_Z12ToStringImplIiEmT_Pcm(i32 %1, i8* nonnull %64, i64 512)
          to label %66 unwind label %150

66:                                               ; preds = %63
  %67 = icmp eq i64 %65, 0
  br i1 %67, label %100, label %68

68:                                               ; preds = %66
  %69 = invoke noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19
          to label %70 unwind label %150

70:                                               ; preds = %68
  %71 = bitcast i8* %69 to i64*
  store i64 1, i64* %71, align 8, !tbaa !34, !noalias !94
  %72 = getelementptr inbounds i8, i8* %69, i64 8
  %73 = icmp ugt i64 %65, -17
  br i1 %73, label %74, label %77

74:                                               ; preds = %70
  %75 = bitcast i8* %72 to %"class.std::__y1::basic_string"*
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %75) #20
          to label %76 unwind label %94, !noalias !94

76:                                               ; preds = %74
  unreachable

77:                                               ; preds = %70
  %78 = icmp ult i64 %65, 23
  br i1 %78, label %90, label %79

79:                                               ; preds = %77
  %80 = add nuw i64 %65, 16
  %81 = and i64 %80, -16
  %82 = invoke noalias nonnull i8* @_Znwm(i64 %81) #19
          to label %83 unwind label %94, !noalias !94

83:                                               ; preds = %79
  %84 = getelementptr inbounds i8, i8* %69, i64 24
  %85 = bitcast i8* %84 to i8**
  store i8* %82, i8** %85, align 8, !tbaa !12, !noalias !94
  %86 = or i64 %81, 1
  %87 = bitcast i8* %72 to i64*
  store i64 %86, i64* %87, align 8, !tbaa !12, !noalias !94
  %88 = getelementptr inbounds i8, i8* %69, i64 16
  %89 = bitcast i8* %88 to i64*
  store i64 %65, i64* %89, align 8, !tbaa !12, !noalias !94
  br label %96

90:                                               ; preds = %77
  %91 = trunc i64 %65 to i8
  %92 = shl nuw nsw i8 %91, 1
  store i8 %92, i8* %72, align 8, !tbaa !12, !noalias !94
  %93 = getelementptr inbounds i8, i8* %69, i64 9
  br label %96

94:                                               ; preds = %79, %74
  %95 = landingpad { i8*, i32 }
          cleanup
  call void @_ZdlPv(i8* nonnull %69) #18, !noalias !94
  br label %173

96:                                               ; preds = %90, %83
  %97 = phi i8* [ %82, %83 ], [ %93, %90 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %97, i8* nonnull align 16 %64, i64 %65, i1 false) #17, !noalias !94
  %98 = getelementptr inbounds i8, i8* %97, i64 %65
  store i8 0, i8* %98, align 1, !tbaa !12, !noalias !94
  %99 = bitcast i8* %69 to %struct.TStdString*
  br label %100

100:                                              ; preds = %96, %66
  %101 = phi %struct.TStdString* [ %99, %96 ], [ bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %66 ]
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %64) #17, !noalias !89
  %102 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %103 unwind label %152

103:                                              ; preds = %100
  %104 = load %struct.TStdString*, %struct.TStdString** %55, align 8, !tbaa !10
  %105 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %104, i64 0, i32 1
  %106 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %101, i64 0, i32 1
  %107 = bitcast %"class.std::__y1::basic_string"* %106 to i8*
  %108 = load i8, i8* %107, align 8, !tbaa !12
  %109 = and i8 %108, 1
  %110 = icmp eq i8 %109, 0
  %111 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %101, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %112 = load i8*, i8** %111, align 8
  %113 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %101, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %114 = load i64, i64* %113, align 8
  %115 = bitcast %"class.std::__y1::basic_string"* %106 to %"struct.std::__y1::basic_string<char>::__short"*
  %116 = getelementptr inbounds %"struct.std::__y1::basic_string<char>::__short", %"struct.std::__y1::basic_string<char>::__short"* %115, i64 0, i32 1, i64 0
  %117 = lshr i8 %108, 1
  %118 = zext i8 %117 to i64
  %119 = select i1 %110, i8* %116, i8* %112
  %120 = select i1 %110, i64 %118, i64 %114
  %121 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %105, i8* %119, i64 %120)
          to label %122 unwind label %152

122:                                              ; preds = %103
  %123 = icmp eq %struct.TStdString* %101, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  br i1 %123, label %139, label %124

124:                                              ; preds = %122
  %125 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %101, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %126 = load atomic i64, i64* %125 seq_cst, align 8
  %127 = icmp eq i64 %126, 1
  br i1 %127, label %131, label %128

128:                                              ; preds = %124
  %129 = atomicrmw sub i64* %125, i64 1 seq_cst
  %130 = icmp eq i64 %129, 1
  br i1 %130, label %131, label %139

131:                                              ; preds = %128, %124
  %132 = load i8, i8* %107, align 8, !tbaa !12
  %133 = and i8 %132, 1
  %134 = icmp eq i8 %133, 0
  br i1 %134, label %137, label %135

135:                                              ; preds = %131
  %136 = load i8*, i8** %111, align 8, !tbaa !12
  call void @_ZdlPv(i8* %136) #18
  br label %137

137:                                              ; preds = %135, %131
  %138 = bitcast %struct.TStdString* %101 to i8*
  call void @_ZdlPv(i8* nonnull %138) #18
  br label %139

139:                                              ; preds = %122, %128, %137
  %140 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %141 unwind label %148

141:                                              ; preds = %139
  %142 = load %struct.TStdString*, %struct.TStdString** %55, align 8, !tbaa !10
  %143 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %142, i64 0, i32 1
  %144 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %143, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
          to label %145 unwind label %148

145:                                              ; preds = %141
  %146 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  %147 = load %struct.TStdString*, %struct.TStdString** %55, align 8, !tbaa !4
  store %struct.TStdString* %147, %struct.TStdString** %146, align 8, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %54) #17
  br label %198

148:                                              ; preds = %141, %139, %59, %57, %53
  %149 = landingpad { i8*, i32 }
          cleanup
  br label %173

150:                                              ; preds = %68, %63
  %151 = landingpad { i8*, i32 }
          cleanup
  br label %173

152:                                              ; preds = %103, %100
  %153 = landingpad { i8*, i32 }
          cleanup
  %154 = icmp eq %struct.TStdString* %101, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  br i1 %154, label %173, label %155

155:                                              ; preds = %152
  %156 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %101, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %157 = load atomic i64, i64* %156 seq_cst, align 8
  %158 = icmp eq i64 %157, 1
  br i1 %158, label %162, label %159

159:                                              ; preds = %155
  %160 = atomicrmw sub i64* %156, i64 1 seq_cst
  %161 = icmp eq i64 %160, 1
  br i1 %161, label %162, label %173

162:                                              ; preds = %159, %155
  %163 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %101, i64 0, i32 1
  %164 = bitcast %"class.std::__y1::basic_string"* %163 to i8*
  %165 = load i8, i8* %164, align 8, !tbaa !12
  %166 = and i8 %165, 1
  %167 = icmp eq i8 %166, 0
  br i1 %167, label %171, label %168

168:                                              ; preds = %162
  %169 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %101, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %170 = load i8*, i8** %169, align 8, !tbaa !12
  call void @_ZdlPv(i8* %170) #18
  br label %171

171:                                              ; preds = %168, %162
  %172 = bitcast %struct.TStdString* %101 to i8*
  call void @_ZdlPv(i8* nonnull %172) #18
  br label %173

173:                                              ; preds = %94, %150, %152, %159, %171, %148
  %174 = phi { i8*, i32 } [ %149, %148 ], [ %151, %150 ], [ %95, %94 ], [ %153, %152 ], [ %153, %159 ], [ %153, %171 ]
  %175 = load %struct.TStdString*, %struct.TStdString** %55, align 8, !tbaa !10
  %176 = icmp eq %struct.TStdString* %175, null
  %177 = icmp eq %struct.TStdString* %175, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %178 = or i1 %176, %177
  br i1 %178, label %197, label %179

179:                                              ; preds = %173
  %180 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %175, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %181 = load atomic i64, i64* %180 seq_cst, align 8
  %182 = icmp eq i64 %181, 1
  br i1 %182, label %186, label %183

183:                                              ; preds = %179
  %184 = atomicrmw sub i64* %180, i64 1 seq_cst
  %185 = icmp eq i64 %184, 1
  br i1 %185, label %186, label %197

186:                                              ; preds = %183, %179
  %187 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %175, i64 0, i32 1
  %188 = bitcast %"class.std::__y1::basic_string"* %187 to i8*
  %189 = load i8, i8* %188, align 8, !tbaa !12
  %190 = and i8 %189, 1
  %191 = icmp eq i8 %190, 0
  br i1 %191, label %195, label %192

192:                                              ; preds = %186
  %193 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %175, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %194 = load i8*, i8** %193, align 8, !tbaa !12
  call void @_ZdlPv(i8* %194) #18
  br label %195

195:                                              ; preds = %192, %186
  %196 = bitcast %struct.TStdString* %175 to i8*
  call void @_ZdlPv(i8* nonnull %196) #18
  br label %197

197:                                              ; preds = %173, %183, %195
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %54) #17
  resume { i8*, i32 } %174

198:                                              ; preds = %51, %47, %145
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN3NYT11TEnumTraitsINS_6NYTree10EErrorCodeELb1EE8ToStringES2_(%class.TBasicString* noalias sret(%class.TBasicString) align 8 %0, i32 %1) local_unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca [512 x i8], align 16
  %4 = alloca %class.TBasicString, align 8
  %5 = add i32 %1, -500
  %6 = icmp ult i32 %5, 6
  br i1 %6, label %7, label %47

7:                                                ; preds = %2
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds %"struct.std::__y1::array.33", %"struct.std::__y1::array.33"* bitcast ({ [6 x { i8*, i64 }] }* @_ZN3NYT6NYTree26TEnumTraitsImpl_EErrorCode5NamesE to %"struct.std::__y1::array.33"*), i64 0, i32 0, i64 %8, i32 0, i32 0
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds %"struct.std::__y1::array.33", %"struct.std::__y1::array.33"* bitcast ({ [6 x { i8*, i64 }] }* @_ZN3NYT6NYTree26TEnumTraitsImpl_EErrorCode5NamesE to %"struct.std::__y1::array.33"*), i64 0, i32 0, i64 %8, i32 0, i32 1
  %12 = load i64, i64* %11, align 8
  tail call void @llvm.experimental.noalias.scope.decl(metadata !97)
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %45, label %14

14:                                               ; preds = %7
  tail call void @llvm.experimental.noalias.scope.decl(metadata !100), !noalias !97
  %15 = tail call noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19, !noalias !103
  %16 = bitcast i8* %15 to i64*
  store i64 1, i64* %16, align 8, !tbaa !34, !noalias !103
  %17 = getelementptr inbounds i8, i8* %15, i64 8
  %18 = icmp ugt i64 %12, -17
  br i1 %18, label %19, label %22

19:                                               ; preds = %14
  %20 = bitcast i8* %17 to %"class.std::__y1::basic_string"*
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %20) #20
          to label %21 unwind label %39, !noalias !103

21:                                               ; preds = %19
  unreachable

22:                                               ; preds = %14
  %23 = icmp ult i64 %12, 23
  br i1 %23, label %35, label %24

24:                                               ; preds = %22
  %25 = add nuw i64 %12, 16
  %26 = and i64 %25, -16
  %27 = invoke noalias nonnull i8* @_Znwm(i64 %26) #19
          to label %28 unwind label %39, !noalias !103

28:                                               ; preds = %24
  %29 = getelementptr inbounds i8, i8* %15, i64 24
  %30 = bitcast i8* %29 to i8**
  store i8* %27, i8** %30, align 8, !tbaa !12, !noalias !103
  %31 = or i64 %26, 1
  %32 = bitcast i8* %17 to i64*
  store i64 %31, i64* %32, align 8, !tbaa !12, !noalias !103
  %33 = getelementptr inbounds i8, i8* %15, i64 16
  %34 = bitcast i8* %33 to i64*
  store i64 %12, i64* %34, align 8, !tbaa !12, !noalias !103
  br label %41

35:                                               ; preds = %22
  %36 = trunc i64 %12 to i8
  %37 = shl nuw nsw i8 %36, 1
  store i8 %37, i8* %17, align 8, !tbaa !12, !noalias !103
  %38 = getelementptr inbounds i8, i8* %15, i64 9
  br label %41

39:                                               ; preds = %24, %19
  %40 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZdlPv(i8* nonnull %15) #18, !noalias !103
  resume { i8*, i32 } %40

41:                                               ; preds = %35, %28
  %42 = phi i8* [ %27, %28 ], [ %38, %35 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %42, i8* align 1 %10, i64 %12, i1 false) #17, !noalias !103
  %43 = getelementptr inbounds i8, i8* %42, i64 %12
  store i8 0, i8* %43, align 1, !tbaa !12, !noalias !103
  %44 = bitcast %class.TBasicString* %0 to i8**
  store i8* %15, i8** %44, align 8, !tbaa !10, !alias.scope !103
  br label %192

45:                                               ; preds = %7
  %46 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  store %struct.TStdString* bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %struct.TStdString** %46, align 8, !tbaa !10, !alias.scope !104
  br label %192

47:                                               ; preds = %2
  %48 = bitcast %class.TBasicString* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %48) #17
  %49 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %4, i64 0, i32 0, i32 0
  store %struct.TStdString* bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %struct.TStdString** %49, align 8, !tbaa !10, !alias.scope !107
  %50 = invoke nonnull align 8 dereferenceable(8) %class.TBasicString* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6assignEPKcm(%class.TBasicString* nonnull dereferenceable(8) %4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i64 0, i64 0), i64 10)
          to label %51 unwind label %142

51:                                               ; preds = %47
  %52 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %53 unwind label %142

53:                                               ; preds = %51
  %54 = load %struct.TStdString*, %struct.TStdString** %49, align 8, !tbaa !10
  %55 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %54, i64 0, i32 1
  %56 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %55, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
          to label %57 unwind label %142

57:                                               ; preds = %53
  %58 = getelementptr inbounds [512 x i8], [512 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %58) #17, !noalias !110
  %59 = invoke i64 @_Z12ToStringImplIiEmT_Pcm(i32 %1, i8* nonnull %58, i64 512)
          to label %60 unwind label %144

60:                                               ; preds = %57
  %61 = icmp eq i64 %59, 0
  br i1 %61, label %94, label %62

62:                                               ; preds = %60
  %63 = invoke noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #19
          to label %64 unwind label %144

64:                                               ; preds = %62
  %65 = bitcast i8* %63 to i64*
  store i64 1, i64* %65, align 8, !tbaa !34, !noalias !115
  %66 = getelementptr inbounds i8, i8* %63, i64 8
  %67 = icmp ugt i64 %59, -17
  br i1 %67, label %68, label %71

68:                                               ; preds = %64
  %69 = bitcast i8* %66 to %"class.std::__y1::basic_string"*
  invoke void @_ZNKSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorEv(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %69) #20
          to label %70 unwind label %88, !noalias !115

70:                                               ; preds = %68
  unreachable

71:                                               ; preds = %64
  %72 = icmp ult i64 %59, 23
  br i1 %72, label %84, label %73

73:                                               ; preds = %71
  %74 = add nuw i64 %59, 16
  %75 = and i64 %74, -16
  %76 = invoke noalias nonnull i8* @_Znwm(i64 %75) #19
          to label %77 unwind label %88, !noalias !115

77:                                               ; preds = %73
  %78 = getelementptr inbounds i8, i8* %63, i64 24
  %79 = bitcast i8* %78 to i8**
  store i8* %76, i8** %79, align 8, !tbaa !12, !noalias !115
  %80 = or i64 %75, 1
  %81 = bitcast i8* %66 to i64*
  store i64 %80, i64* %81, align 8, !tbaa !12, !noalias !115
  %82 = getelementptr inbounds i8, i8* %63, i64 16
  %83 = bitcast i8* %82 to i64*
  store i64 %59, i64* %83, align 8, !tbaa !12, !noalias !115
  br label %90

84:                                               ; preds = %71
  %85 = trunc i64 %59 to i8
  %86 = shl nuw nsw i8 %85, 1
  store i8 %86, i8* %66, align 8, !tbaa !12, !noalias !115
  %87 = getelementptr inbounds i8, i8* %63, i64 9
  br label %90

88:                                               ; preds = %73, %68
  %89 = landingpad { i8*, i32 }
          cleanup
  call void @_ZdlPv(i8* nonnull %63) #18, !noalias !115
  br label %167

90:                                               ; preds = %84, %77
  %91 = phi i8* [ %76, %77 ], [ %87, %84 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %91, i8* nonnull align 16 %58, i64 %59, i1 false) #17, !noalias !115
  %92 = getelementptr inbounds i8, i8* %91, i64 %59
  store i8 0, i8* %92, align 1, !tbaa !12, !noalias !115
  %93 = bitcast i8* %63 to %struct.TStdString*
  br label %94

94:                                               ; preds = %90, %60
  %95 = phi %struct.TStdString* [ %93, %90 ], [ bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*), %60 ]
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %58) #17, !noalias !110
  %96 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %97 unwind label %146

97:                                               ; preds = %94
  %98 = load %struct.TStdString*, %struct.TStdString** %49, align 8, !tbaa !10
  %99 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %98, i64 0, i32 1
  %100 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %95, i64 0, i32 1
  %101 = bitcast %"class.std::__y1::basic_string"* %100 to i8*
  %102 = load i8, i8* %101, align 8, !tbaa !12
  %103 = and i8 %102, 1
  %104 = icmp eq i8 %103, 0
  %105 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %95, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %106 = load i8*, i8** %105, align 8
  %107 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %95, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %108 = load i64, i64* %107, align 8
  %109 = bitcast %"class.std::__y1::basic_string"* %100 to %"struct.std::__y1::basic_string<char>::__short"*
  %110 = getelementptr inbounds %"struct.std::__y1::basic_string<char>::__short", %"struct.std::__y1::basic_string<char>::__short"* %109, i64 0, i32 1, i64 0
  %111 = lshr i8 %102, 1
  %112 = zext i8 %111 to i64
  %113 = select i1 %104, i8* %110, i8* %106
  %114 = select i1 %104, i64 %112, i64 %108
  %115 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %99, i8* %113, i64 %114)
          to label %116 unwind label %146

116:                                              ; preds = %97
  %117 = icmp eq %struct.TStdString* %95, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  br i1 %117, label %133, label %118

118:                                              ; preds = %116
  %119 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %95, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %120 = load atomic i64, i64* %119 seq_cst, align 8
  %121 = icmp eq i64 %120, 1
  br i1 %121, label %125, label %122

122:                                              ; preds = %118
  %123 = atomicrmw sub i64* %119, i64 1 seq_cst
  %124 = icmp eq i64 %123, 1
  br i1 %124, label %125, label %133

125:                                              ; preds = %122, %118
  %126 = load i8, i8* %101, align 8, !tbaa !12
  %127 = and i8 %126, 1
  %128 = icmp eq i8 %127, 0
  br i1 %128, label %131, label %129

129:                                              ; preds = %125
  %130 = load i8*, i8** %105, align 8, !tbaa !12
  call void @_ZdlPv(i8* %130) #18
  br label %131

131:                                              ; preds = %129, %125
  %132 = bitcast %struct.TStdString* %95 to i8*
  call void @_ZdlPv(i8* nonnull %132) #18
  br label %133

133:                                              ; preds = %116, %122, %131
  %134 = invoke i8* @_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE6DetachEv(%class.TBasicString* nonnull dereferenceable(8) %4)
          to label %135 unwind label %142

135:                                              ; preds = %133
  %136 = load %struct.TStdString*, %struct.TStdString** %49, align 8, !tbaa !10
  %137 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %136, i64 0, i32 1
  %138 = invoke nonnull align 8 dereferenceable(24) %"class.std::__y1::basic_string"* @_ZNSt4__y112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__y1::basic_string"* nonnull dereferenceable(24) %137, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
          to label %139 unwind label %142

139:                                              ; preds = %135
  %140 = getelementptr inbounds %class.TBasicString, %class.TBasicString* %0, i64 0, i32 0, i32 0
  %141 = load %struct.TStdString*, %struct.TStdString** %49, align 8, !tbaa !4
  store %struct.TStdString* %141, %struct.TStdString** %140, align 8, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %48) #17
  br label %192

142:                                              ; preds = %135, %133, %53, %51, %47
  %143 = landingpad { i8*, i32 }
          cleanup
  br label %167

144:                                              ; preds = %62, %57
  %145 = landingpad { i8*, i32 }
          cleanup
  br label %167

146:                                              ; preds = %97, %94
  %147 = landingpad { i8*, i32 }
          cleanup
  %148 = icmp eq %struct.TStdString* %95, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  br i1 %148, label %167, label %149

149:                                              ; preds = %146
  %150 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %95, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %151 = load atomic i64, i64* %150 seq_cst, align 8
  %152 = icmp eq i64 %151, 1
  br i1 %152, label %156, label %153

153:                                              ; preds = %149
  %154 = atomicrmw sub i64* %150, i64 1 seq_cst
  %155 = icmp eq i64 %154, 1
  br i1 %155, label %156, label %167

156:                                              ; preds = %153, %149
  %157 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %95, i64 0, i32 1
  %158 = bitcast %"class.std::__y1::basic_string"* %157 to i8*
  %159 = load i8, i8* %158, align 8, !tbaa !12
  %160 = and i8 %159, 1
  %161 = icmp eq i8 %160, 0
  br i1 %161, label %165, label %162

162:                                              ; preds = %156
  %163 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %95, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %164 = load i8*, i8** %163, align 8, !tbaa !12
  call void @_ZdlPv(i8* %164) #18
  br label %165

165:                                              ; preds = %162, %156
  %166 = bitcast %struct.TStdString* %95 to i8*
  call void @_ZdlPv(i8* nonnull %166) #18
  br label %167

167:                                              ; preds = %88, %144, %146, %153, %165, %142
  %168 = phi { i8*, i32 } [ %143, %142 ], [ %145, %144 ], [ %89, %88 ], [ %147, %146 ], [ %147, %153 ], [ %147, %165 ]
  %169 = load %struct.TStdString*, %struct.TStdString** %49, align 8, !tbaa !10
  %170 = icmp eq %struct.TStdString* %169, null
  %171 = icmp eq %struct.TStdString* %169, bitcast ([128 x i8]* @NULL_STRING_REPR to %struct.TStdString*)
  %172 = or i1 %170, %171
  br i1 %172, label %191, label %173

173:                                              ; preds = %167
  %174 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %169, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %175 = load atomic i64, i64* %174 seq_cst, align 8
  %176 = icmp eq i64 %175, 1
  br i1 %176, label %180, label %177

177:                                              ; preds = %173
  %178 = atomicrmw sub i64* %174, i64 1 seq_cst
  %179 = icmp eq i64 %178, 1
  br i1 %179, label %180, label %191

180:                                              ; preds = %177, %173
  %181 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %169, i64 0, i32 1
  %182 = bitcast %"class.std::__y1::basic_string"* %181 to i8*
  %183 = load i8, i8* %182, align 8, !tbaa !12
  %184 = and i8 %183, 1
  %185 = icmp eq i8 %184, 0
  br i1 %185, label %189, label %186

186:                                              ; preds = %180
  %187 = getelementptr inbounds %struct.TStdString, %struct.TStdString* %169, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %188 = load i8*, i8** %187, align 8, !tbaa !12
  call void @_ZdlPv(i8* %188) #18
  br label %189

189:                                              ; preds = %186, %180
  %190 = bitcast %struct.TStdString* %169 to i8*
  call void @_ZdlPv(i8* nonnull %190) #18
  br label %191

191:                                              ; preds = %167, %177, %189
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %48) #17
  resume { i8*, i32 } %168

192:                                              ; preds = %45, %41, %139
  ret void
}

declare void @_ZN3NYT5NYson15TYsonPullParser4NextEv(%"class.NYT::NYson::TYsonItem"* sret(%"class.NYT::NYson::TYsonItem") align 1, %"class.NYT::NYson::TYsonPullParser"* nonnull dereferenceable(321)) local_unnamed_addr #10

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #16

attributes #0 = { uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { inlinehint uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { alwaysinline uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { alwaysinline uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { alwaysinline uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse nounwind readnone uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { norecurse nounwind readonly uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin nofree allocsize(0) "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nobuiltin nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noreturn uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { inlinehint noreturn uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #17 = { nounwind }
attributes #18 = { builtin nounwind }
attributes #19 = { builtin allocsize(0) }
attributes #20 = { noreturn }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"_ZTSN3NYT10EErrorCodeE", !6, i64 0}
!10 = !{!11, !5, i64 0}
!11 = !{!"_ZTS13TIntrusivePtrI10TStdStringINSt4__y112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE13TStringPtrOpsIS8_EE", !5, i64 0}
!12 = !{!6, !6, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"vtable pointer", !7, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !6, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"_ZTSN3NYT4NRpc10EErrorCodeE", !6, i64 0}
!19 = !{!20, !20, i64 0}
!20 = !{!"_ZTSN3NYT6NYTree10EErrorCodeE", !6, i64 0}
!21 = !{!22, !23, i64 12}
!22 = !{!"_ZTSN3NYT5NYson9TYsonItemE", !6, i64 0, !23, i64 12}
!23 = !{!"_ZTSN3NYT5NYson13EYsonItemTypeE", !6, i64 0}
!24 = !{!25, !5, i64 16}
!25 = !{!"_ZTSN3NYT5NYson21TYsonPullParserCursorE", !26, i64 0, !22, i64 1, !5, i64 16}
!26 = !{!"bool", !6, i64 0}
!27 = !{!28}
!28 = distinct !{!28, !29, !"_ZL8ToString15TBasicStringBufIcNSt4__y111char_traitsIcEEE: argument 0"}
!29 = distinct !{!29, !"_ZL8ToString15TBasicStringBufIcNSt4__y111char_traitsIcEEE"}
!30 = !{!31}
!31 = distinct !{!31, !32, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!32 = distinct !{!32, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
!33 = !{!31, !28}
!34 = !{!35, !6, i64 0}
!35 = !{!"_ZTSNSt4__y122__cxx_atomic_base_implIlEE", !6, i64 0}
!36 = !{!37, !28}
!37 = distinct !{!37, !38, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv: argument 0"}
!38 = distinct !{!38, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv"}
!39 = !{!40}
!40 = distinct !{!40, !41, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv: argument 0"}
!41 = distinct !{!41, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv"}
!42 = !{!43, !45}
!43 = distinct !{!43, !44, !"_ZN8NPrivate9TToStringIiLb1EE3CvtERKi: argument 0"}
!44 = distinct !{!44, !"_ZN8NPrivate9TToStringIiLb1EE3CvtERKi"}
!45 = distinct !{!45, !46, !"_Z8ToStringIiE12TBasicStringIcNSt4__y111char_traitsIcEEERKT_: argument 0"}
!46 = distinct !{!46, !"_Z8ToStringIiE12TBasicStringIcNSt4__y111char_traitsIcEEERKT_"}
!47 = !{!48, !43, !45}
!48 = distinct !{!48, !49, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!49 = distinct !{!49, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
!50 = !{!51}
!51 = distinct !{!51, !52, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!52 = distinct !{!52, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
!53 = !{!"branch_weights", i32 1073205, i32 2146410443}
!54 = !{!"branch_weights", i32 2000, i32 1}
!55 = !{!56}
!56 = distinct !{!56, !57, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJR10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEEEEE13TIntrusivePtrISA_13TStringPtrOpsISA_EEDpOT_: argument 0"}
!57 = distinct !{!57, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJR10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEEEEE13TIntrusivePtrISA_13TStringPtrOpsISA_EEDpOT_"}
!58 = !{!59}
!59 = distinct !{!59, !60, !"_ZL8ToString15TBasicStringBufIcNSt4__y111char_traitsIcEEE: argument 0"}
!60 = distinct !{!60, !"_ZL8ToString15TBasicStringBufIcNSt4__y111char_traitsIcEEE"}
!61 = !{!62}
!62 = distinct !{!62, !63, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!63 = distinct !{!63, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
!64 = !{!62, !59}
!65 = !{!66}
!66 = distinct !{!66, !67, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv: argument 0"}
!67 = distinct !{!67, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv"}
!68 = !{!69, !71}
!69 = distinct !{!69, !70, !"_ZN8NPrivate9TToStringIiLb1EE3CvtERKi: argument 0"}
!70 = distinct !{!70, !"_ZN8NPrivate9TToStringIiLb1EE3CvtERKi"}
!71 = distinct !{!71, !72, !"_Z8ToStringIiE12TBasicStringIcNSt4__y111char_traitsIcEEERKT_: argument 0"}
!72 = distinct !{!72, !"_Z8ToStringIiE12TBasicStringIcNSt4__y111char_traitsIcEEERKT_"}
!73 = !{!74, !69, !71}
!74 = distinct !{!74, !75, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!75 = distinct !{!75, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
!76 = !{!77}
!77 = distinct !{!77, !78, !"_ZL8ToString15TBasicStringBufIcNSt4__y111char_traitsIcEEE: argument 0"}
!78 = distinct !{!78, !"_ZL8ToString15TBasicStringBufIcNSt4__y111char_traitsIcEEE"}
!79 = !{!80}
!80 = distinct !{!80, !81, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!81 = distinct !{!81, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
!82 = !{!80, !77}
!83 = !{!84, !77}
!84 = distinct !{!84, !85, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv: argument 0"}
!85 = distinct !{!85, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv"}
!86 = !{!87}
!87 = distinct !{!87, !88, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv: argument 0"}
!88 = distinct !{!88, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv"}
!89 = !{!90, !92}
!90 = distinct !{!90, !91, !"_ZN8NPrivate9TToStringIiLb1EE3CvtERKi: argument 0"}
!91 = distinct !{!91, !"_ZN8NPrivate9TToStringIiLb1EE3CvtERKi"}
!92 = distinct !{!92, !93, !"_Z8ToStringIiE12TBasicStringIcNSt4__y111char_traitsIcEEERKT_: argument 0"}
!93 = distinct !{!93, !"_Z8ToStringIiE12TBasicStringIcNSt4__y111char_traitsIcEEERKT_"}
!94 = !{!95, !90, !92}
!95 = distinct !{!95, !96, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!96 = distinct !{!96, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
!97 = !{!98}
!98 = distinct !{!98, !99, !"_ZL8ToString15TBasicStringBufIcNSt4__y111char_traitsIcEEE: argument 0"}
!99 = distinct !{!99, !"_ZL8ToString15TBasicStringBufIcNSt4__y111char_traitsIcEEE"}
!100 = !{!101}
!101 = distinct !{!101, !102, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!102 = distinct !{!102, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
!103 = !{!101, !98}
!104 = !{!105, !98}
!105 = distinct !{!105, !106, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv: argument 0"}
!106 = distinct !{!106, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv"}
!107 = !{!108}
!108 = distinct !{!108, !109, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv: argument 0"}
!109 = distinct !{!109, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructEv"}
!110 = !{!111, !113}
!111 = distinct !{!111, !112, !"_ZN8NPrivate9TToStringIiLb1EE3CvtERKi: argument 0"}
!112 = distinct !{!112, !"_ZN8NPrivate9TToStringIiLb1EE3CvtERKi"}
!113 = distinct !{!113, !114, !"_Z8ToStringIiE12TBasicStringIcNSt4__y111char_traitsIcEEERKT_: argument 0"}
!114 = distinct !{!114, !"_Z8ToStringIiE12TBasicStringIcNSt4__y111char_traitsIcEEERKT_"}
!115 = !{!116, !111, !113}
!116 = distinct !{!116, !117, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_: argument 0"}
!117 = distinct !{!117, !"_ZN12TBasicStringIcNSt4__y111char_traitsIcEEE9ConstructIJRPKcRmEEE13TIntrusivePtrI10TStdStringINS0_12basic_stringIcS2_NS0_9allocatorIcEEEEE13TStringPtrOpsISF_EEDpOT_"}
