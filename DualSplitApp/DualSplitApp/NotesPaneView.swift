import SwiftUI

/// Khung bên trái: một "mini app" ghi chú độc lập, tự lưu vào UserDefaults.
struct NotesPaneView: View {
    @AppStorage("notes.pane.text") private var text: String = ""

    var body: some View {
        NavigationStack {
            TextEditor(text: $text)
                .font(.body)
                .padding(8)
                .scrollContentBackground(.hidden)
                .background(Color(.systemBackground))
                .navigationTitle("Ghi chú")
                .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.orange)
    }
}

#Preview {
    NotesPaneView()
}
