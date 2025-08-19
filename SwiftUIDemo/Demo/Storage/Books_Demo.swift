import SwiftData
import SwiftUI

@Model
class SwiftBook {
    var name: String

    init(name: String) {
        self.name = name
    }
}

struct Books_Demo: View {
    var body: some View {
        BooksInternal()
            .modelContainer(for: SwiftBook.self)
    }
}

struct BooksInternal: View {
    @Query var books: [SwiftBook]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
            List(books) { book in
                Text("Book: \(book.name)")
            }
            .toolbar {
                ToolbarItem {
                    Button("Add Sample Books") {
                        addSampleBooks()
                    }
                }
            }
        }
    }

    func addSampleBooks() {
        let books: [SwiftBook] = [
            SwiftBook(name: "SwiftUI"),
            SwiftBook(name: "Swift"),
            SwiftBook(name: "Concurrency")
        ]
        for book in books {
            modelContext.insert(book)
        }
    }
}

#Preview {
    Books_Demo()
}
