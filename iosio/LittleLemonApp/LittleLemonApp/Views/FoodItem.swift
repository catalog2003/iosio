import SwiftUI

struct FoodItem: View {
    
    let dish: Dish
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(dish.title ?? "")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(dish.descriptionDish ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text("$\(dish.price ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.green)
                
                if let rating = dish.rating {
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                }
                
                if let dietaryInformation = dish.dietaryInformation {
                    Text(dietaryInformation)
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
            .padding(.trailing, 8)
            
            AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 90, height: 90)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .transition(.opacity.combined(with: .scale))
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct FoodItem_Previews: PreviewProvider {
    static var previews: some View {
        FoodItem(dish: PersistenceController.oneDish())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
