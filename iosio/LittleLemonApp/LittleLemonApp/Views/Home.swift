import SwiftUI

struct Home: View {
    
    var body: some View {
        NavigationView {
            MainScreen()
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Home")
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
                            .accessibilityLabel("Home")
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
