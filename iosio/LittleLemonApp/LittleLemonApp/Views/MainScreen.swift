import SwiftUI

struct MainScreen: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationStack {
            VStack {
                Header()
                    .padding(.bottom, 10)
                    .background(Color.primaryColor1)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                Menu()
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Main Screen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Action for menu button
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .accessibilityLabel("Menu")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Little Lemon")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .accessibilityLabel("Main Screen")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action for profile button
                    }) {
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                            .accessibilityLabel("Profile")
                    }
                }
            }
        }
        .accentColor(.primaryColor1) // Custom accent color
        .onAppear {
            // Additional setup if needed
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
