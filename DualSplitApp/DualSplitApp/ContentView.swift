import SwiftUI

/// Luôn chia đôi màn hình theo tỷ lệ cố định 50:50, không cho kéo giãn,
/// hoạt động đúng ở cả hai chiều xoay của iPad mini.
struct ContentView: View {
    private let dividerWidth: CGFloat = 1

    var body: some View {
        GeometryReader { geo in
            let paneWidth = (geo.size.width - dividerWidth) / 2

            HStack(spacing: 0) {
                NotesPaneView()
                    .frame(width: paneWidth, height: geo.size.height)

                Divider()
                    .frame(width: dividerWidth)
                    .background(Color.gray.opacity(0.4))

                TodoPaneView()
                    .frame(width: paneWidth, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    ContentView()
}
