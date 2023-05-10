; ModuleID = 'llvm_jsoncons_helpers.cpp'
source_filename = "llvm_jsoncons_helpers.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.jsoncons::basic_json_cursor" = type opaque

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_llvm_jsoncons_helpers.cpp, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable willreturn mustprogress
define dso_local %"class.jsoncons::basic_json_cursor"* @toJsonCursor(i8* readnone %0) local_unnamed_addr #3 {
  %2 = bitcast i8* %0 to %"class.jsoncons::basic_json_cursor"*
  ret %"class.jsoncons::basic_json_cursor"* %2
}

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local signext i8 @GetCurrentType(i8* nocapture readonly %0, i32* nocapture readonly %1) local_unnamed_addr #4 {
  %3 = load i32, i32* %1, align 4, !tbaa !2
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds i8, i8* %0, i64 %4
  %6 = load i8, i8* %5, align 1, !tbaa !6
  ret i8 %6
}

; Function Attrs: alwaysinline uwtable mustprogress
define dso_local void @CallNext(i8* %0, i32* nocapture %1, i32* nocapture %2, i32 %3, i8* %4) local_unnamed_addr #5 {
  %6 = load i32, i32* %1, align 4, !tbaa !2
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %1, align 4, !tbaa !2
  %8 = load i32, i32* %2, align 4, !tbaa !2
  %9 = icmp eq i32 %7, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %5
  store i32 0, i32* %1, align 4, !tbaa !2
  %11 = tail call i32 @FillWithEvents(i8* %0, i32 %3, i8* %4)
  store i32 %11, i32* %2, align 4, !tbaa !2
  br label %12

12:                                               ; preds = %10, %5
  ret void
}

declare dso_local i32 @FillWithEvents(i8*, i32, i8*) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i1 @IsDone(i8* nocapture readonly %0, i32* nocapture readonly %1) local_unnamed_addr #4 {
  %3 = load i32, i32* %1, align 4, !tbaa !2
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds i8, i8* %0, i64 %4
  %6 = load i8, i8* %5, align 1, !tbaa !6
  %7 = icmp eq i8 %6, -1
  ret i1 %7
}

; Function Attrs: alwaysinline uwtable mustprogress
define dso_local zeroext i1 @ValidateInt(i8* %0, i32* nocapture %1, i32* nocapture %2, i32 %3, i8* %4) local_unnamed_addr #5 {
  %6 = load i32, i32* %1, align 4, !tbaa !2
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i8, i8* %0, i64 %7
  %9 = load i8, i8* %8, align 1, !tbaa !6
  %10 = add nsw i32 %6, 1
  store i32 %10, i32* %1, align 4, !tbaa !2
  %11 = load i32, i32* %2, align 4, !tbaa !2
  %12 = icmp eq i32 %10, %11
  br i1 %12, label %13, label %15

13:                                               ; preds = %5
  store i32 0, i32* %1, align 4, !tbaa !2
  %14 = tail call i32 @FillWithEvents(i8* nonnull %0, i32 %3, i8* %4)
  store i32 %14, i32* %2, align 4, !tbaa !2
  br label %15

15:                                               ; preds = %5, %13
  %16 = add i8 %9, -9
  %17 = icmp ult i8 %16, 2
  ret i1 %17
}

; Function Attrs: alwaysinline uwtable mustprogress
define dso_local zeroext i1 @ValidateString(i8* %0, i32* nocapture %1, i32* nocapture %2, i32 %3, i8* %4) local_unnamed_addr #5 {
  %6 = load i32, i32* %1, align 4, !tbaa !2
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i8, i8* %0, i64 %7
  %9 = load i8, i8* %8, align 1, !tbaa !6
  %10 = add nsw i32 %6, 1
  store i32 %10, i32* %1, align 4, !tbaa !2
  %11 = load i32, i32* %2, align 4, !tbaa !2
  %12 = icmp eq i32 %10, %11
  br i1 %12, label %13, label %15

13:                                               ; preds = %5
  store i32 0, i32* %1, align 4, !tbaa !2
  %14 = tail call i32 @FillWithEvents(i8* nonnull %0, i32 %3, i8* %4)
  store i32 %14, i32* %2, align 4, !tbaa !2
  br label %15

15:                                               ; preds = %5, %13
  %16 = add i8 %9, -5
  %17 = icmp ult i8 %16, 2
  ret i1 %17
}

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i1 @IsBeginArray(i8* nocapture readonly %0, i32* nocapture readonly %1) local_unnamed_addr #4 {
  %3 = load i32, i32* %1, align 4, !tbaa !2
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds i8, i8* %0, i64 %4
  %6 = load i8, i8* %5, align 1, !tbaa !6
  %7 = icmp eq i8 %6, 0
  ret i1 %7
}

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i1 @IsEndArray(i8* nocapture readonly %0, i32* nocapture readonly %1) local_unnamed_addr #4 {
  %3 = load i32, i32* %1, align 4, !tbaa !2
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds i8, i8* %0, i64 %4
  %6 = load i8, i8* %5, align 1, !tbaa !6
  %7 = icmp eq i8 %6, 1
  ret i1 %7
}

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable willreturn mustprogress
define dso_local zeroext i1 @IsNull(i8* nocapture readonly %0, i32* nocapture readonly %1) local_unnamed_addr #4 {
  %3 = load i32, i32* %1, align 4, !tbaa !2
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds i8, i8* %0, i64 %4
  %6 = load i8, i8* %5, align 1, !tbaa !6
  %7 = icmp eq i8 %6, 7
  ret i1 %7
}

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_llvm_jsoncons_helpers.cpp() #6 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull dereferenceable(1) @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #7
  ret void
}

attributes #0 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind }
attributes #3 = { alwaysinline norecurse nounwind readnone uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { alwaysinline norecurse nounwind readonly uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { alwaysinline uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!4, !4, i64 0}
