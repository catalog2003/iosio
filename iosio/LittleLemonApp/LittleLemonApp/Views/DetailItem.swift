import SwiftUI

struct DetailItem: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(minHeight: 150)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .transition(.opacity.combined(with: .scale))
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(minHeight: 150)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
                
                Text(dish.title ?? "")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding(.bottom, 10)
                
                Text(dish.descriptionDish ?? "")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
                
                Text("$" + (dish.price ?? ""))
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.bottom, 20)
                
                if let dietaryInformation = dish.dietaryInformation, !dietaryInformation.isEmpty {
                    Text("Dietary Information: \(dietaryInformation)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 20)
                }
                
                if let isAvailable = dish.isAvailable {
                    Text(isAvailable ? "Available" : "Not Available")
                        .font(.footnote)
                        .foregroundColor(isAvailable ? .green : .red)
                        .padding(.bottom, 20)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(15)
            .shadow(radius: 10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea()
    }
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailItem(dish: PersistenceController.oneDish())
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
