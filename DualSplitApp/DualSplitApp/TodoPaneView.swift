import SwiftUI

private struct TodoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var done: Bool
}

/// Khung bên phải: một "mini app" việc cần làm độc lập, tự lưu vào UserDefaults.
struct TodoPaneView: View {
    @State private var items: [TodoItem] = []
    @State private var newItemTitle: String = ""

    private let storageKey = "todo.pane.items"

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    ForEach(items) { item in
                        Button {
                            toggle(item)
                        } label: {
                            HStack {
                                Image(systemName: item.done ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(item.done ? .green : .secondary)
                                Text(item.title)
                                    .strikethrough(item.done)
                                    .foregroundStyle(item.done ? .secondary : .primary)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    .onDelete(perform: delete)
                }
                .listStyle(.plain)

                HStack {
                    TextField("Thêm việc cần làm...", text: $newItemTitle)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit(addItem)
                    Button(action: addItem) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                    .disabled(newItemTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(8)
            }
            .navigationTitle("Việc cần làm")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.blue)
        .onAppear(perform: load)
    }

    private func addItem() {
        let title = newItemTitle.trimmingCharacters(in: .whitespaces)
        guard !title.isEmpty else { return }
        items.append(TodoItem(id: UUID(), title: title, done: false))
        newItemTitle = ""
        save()
    }

    private func toggle(_ item: TodoItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index].done.toggle()
        save()
    }

    private func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) else { return }
        items = decoded
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }
}

#Preview {
    TodoPaneView()
}
