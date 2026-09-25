# DualSplitApp

Ứng dụng iPadOS (SwiftUI) luôn chia màn hình cố định theo tỷ lệ **50:50**, không thể kéo giãn — tối ưu cho iPad mini.

- Khung trái: **Ghi chú** (`NotesPaneView.swift`) — ghi chú tự do, tự lưu vào máy.
- Khung phải: **Việc cần làm** (`TodoPaneView.swift`) — thêm/đánh dấu/xoá việc cần làm, tự lưu vào máy.
- `ContentView.swift` dùng `GeometryReader` để chia đúng một nửa chiều rộng cho mỗi khung, giữ nguyên tỷ lệ 50:50 ở cả chiều dọc lẫn chiều ngang của iPad mini.

## Vì sao không thể "ép" 2 app khác vào Split View?

iOS/iPadOS không cung cấp API công khai để một app tự ép 2 app độc lập khác (ví dụ 2 app tải từ App Store) mở cùng lúc theo Split View. Đây là do người dùng/hệ thống điều khiển thủ công. Vì vậy cách khả thi là gộp 2 tính năng vào **chung một app** như project này — mỗi khung hoạt động độc lập như một "mini app" riêng.

## Cách chạy

1. Cần máy Mac có cài **Xcode 15** trở lên.
2. Mở `DualSplitApp.xcodeproj` bằng Xcode.
3. Vào tab **Signing & Capabilities** của target `DualSplitApp`, chọn Team của bạn (Apple ID cá nhân là đủ để chạy trên thiết bị/simulator của bạn), có thể cần đổi `PRODUCT_BUNDLE_IDENTIFIER` nếu bị trùng.
4. Chọn simulator **iPad mini** (hoặc thiết bị iPad mini thật) làm đích chạy, rồi bấm Run (⌘R).

## Tuỳ biến thêm

- Muốn thay nội dung 1 trong 2 khung bằng trang web: thay `NotesPaneView`/`TodoPaneView` bằng một `View` bọc `WKWebView` (dùng `UIViewRepresentable`) load URL mong muốn.
- Muốn đổi tỷ lệ khác 50:50: sửa công thức `paneWidth` trong `ContentView.swift`.
