
import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var drinks: FetchedResults<Drink>

    var body: some View {
        NavigationView {
            List {
                ForEach(drinks) { item in
                    NavigationLink {
                        Text(item.brokenDate ?? Date(), format: .dateTime)
                    } label: {
                        Text(item.drinkName ?? "?")
                    }
                }
            }
        }
    }
}

//
//var formatter = DateFormatter()
//formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//var current_date_string = formatter.string(from: Date())

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

