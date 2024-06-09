import CoreData
import SwiftUI

struct FetchedObjects<T, Content>: View where T : NSManagedObject, Content : View {
    
    @FetchRequest var results: FetchedResults<T>
    let content: ([T]) -> Content
    
    init(
        predicate: NSPredicate = NSPredicate(value: true),
        sortDescriptors: [NSSortDescriptor] = [],
        @ViewBuilder content: @escaping ([T]) -> Content
    ) {
        self._results = FetchRequest(
            entity: T.entity(),
            sortDescriptors: sortDescriptors,
            predicate: predicate
        )
        self.content = content
    }
    
    var body: some View {
        self.content(Array(results))
    }
}
