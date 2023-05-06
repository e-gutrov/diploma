; ModuleID = 'llvm_madness.cpp'
source_filename = "llvm_madness.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_llvm_madness.cpp, ptr null }]

declare void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local ptr @toJsonCursor(ptr noundef readnone returned %ptr) local_unnamed_addr #3 {
entry:
  ret ptr %ptr
}

; Function Attrs: mustprogress uwtable
define dso_local zeroext i1 @IsDone(ptr noundef %ptr) local_unnamed_addr #4 {
entry:
  %vtable = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 3
  %0 = load ptr, ptr %vfn, align 8
  %call1 = tail call noundef zeroext i1 %0(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  ret i1 %call1
}

; Function Attrs: mustprogress uwtable
define dso_local i32 @GetCurrentType(ptr noundef %ptr) local_unnamed_addr #4 {
entry:
  %vtable = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 4
  %0 = load ptr, ptr %vfn, align 8
  %call1 = tail call noundef nonnull align 8 dereferenceable(32) ptr %0(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  %1 = load i32, ptr %call1, align 8, !tbaa !8
  ret i32 %1
}

; Function Attrs: mustprogress uwtable
define dso_local void @CallNext(ptr noundef %ptr) local_unnamed_addr #4 {
entry:
  %vtable = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 7
  %0 = load ptr, ptr %vfn, align 8
  tail call void %0(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local zeroext i1 @ValidateInt(ptr noundef %ptr) local_unnamed_addr #4 {
entry:
  %vtable.i = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn.i = getelementptr inbounds ptr, ptr %vtable.i, i64 4
  %0 = load ptr, ptr %vfn.i, align 8
  %call1.i = tail call noundef nonnull align 8 dereferenceable(32) ptr %0(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  %1 = load i32, ptr %call1.i, align 8, !tbaa !8
  %vtable = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 7
  %2 = load ptr, ptr %vfn, align 8
  tail call void %2(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  %3 = add i32 %1, -9
  %4 = icmp ult i32 %3, 2
  ret i1 %4
}

; Function Attrs: mustprogress uwtable
define dso_local zeroext i1 @ValidateString(ptr noundef %ptr) local_unnamed_addr #4 {
entry:
  %vtable.i = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn.i = getelementptr inbounds ptr, ptr %vtable.i, i64 4
  %0 = load ptr, ptr %vfn.i, align 8
  %call1.i = tail call noundef nonnull align 8 dereferenceable(32) ptr %0(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  %1 = load i32, ptr %call1.i, align 8, !tbaa !8
  %vtable = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 7
  %2 = load ptr, ptr %vfn, align 8
  tail call void %2(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  %3 = add i32 %1, -5
  %4 = icmp ult i32 %3, 2
  ret i1 %4
}

; Function Attrs: mustprogress uwtable
define dso_local zeroext i1 @IsBeginArray(ptr noundef %ptr) local_unnamed_addr #4 {
entry:
  %vtable.i = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn.i = getelementptr inbounds ptr, ptr %vtable.i, i64 4
  %0 = load ptr, ptr %vfn.i, align 8
  %call1.i = tail call noundef nonnull align 8 dereferenceable(32) ptr %0(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  %1 = load i32, ptr %call1.i, align 8, !tbaa !8
  %cmp = icmp eq i32 %1, 0
  ret i1 %cmp
}

; Function Attrs: mustprogress uwtable
define dso_local zeroext i1 @IsEndArray(ptr noundef %ptr) local_unnamed_addr #4 {
entry:
  %vtable.i = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn.i = getelementptr inbounds ptr, ptr %vtable.i, i64 4
  %0 = load ptr, ptr %vfn.i, align 8
  %call1.i = tail call noundef nonnull align 8 dereferenceable(32) ptr %0(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  %1 = load i32, ptr %call1.i, align 8, !tbaa !8
  %cmp = icmp eq i32 %1, 1
  ret i1 %cmp
}

; Function Attrs: mustprogress uwtable
define dso_local zeroext i1 @IsNull(ptr noundef %ptr) local_unnamed_addr #4 {
entry:
  %vtable.i = load ptr, ptr %ptr, align 8, !tbaa !5
  %vfn.i = getelementptr inbounds ptr, ptr %vtable.i, i64 4
  %0 = load ptr, ptr %vfn.i, align 8
  %call1.i = tail call noundef nonnull align 8 dereferenceable(32) ptr %0(ptr noundef nonnull align 8 dereferenceable(1121) %ptr)
  %1 = load i32, ptr %call1.i, align 8, !tbaa !8
  %cmp = icmp eq i32 %1, 7
  ret i1 %cmp
}

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_llvm_madness.cpp() #5 section ".text.startup" {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(ptr nonnull @_ZNSt8ios_base4InitD1Ev, ptr nonnull @_ZStL8__ioinit, ptr nonnull @__dso_handle) #6
  ret void
}

attributes #0 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 08d094a0e457360ad8b94b017d2dc277e697ca76)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"vtable pointer", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !10, i64 0}
!9 = !{!"_ZTSN8jsoncons16basic_staj_eventIcEE", !10, i64 0, !12, i64 4, !13, i64 8, !11, i64 16, !13, i64 24}
!10 = !{!"_ZTSN8jsoncons15staj_event_typeE", !11, i64 0}
!11 = !{!"omnipotent char", !7, i64 0}
!12 = !{!"_ZTSN8jsoncons12semantic_tagE", !11, i64 0}
!13 = !{!"long", !11, i64 0}
