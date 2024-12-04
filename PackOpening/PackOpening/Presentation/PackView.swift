
import SwiftUI

struct PackView: View {
    let pack: Pack
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            AsyncImage(url: pack.image) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: isSelected ? 300 : 240,
                   maxHeight: isSelected ? 300 : 240)
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation {
                    onSelect()
                }
            }
            Ellipse()
                .fill(Color.black.opacity(0.2))
                .frame(width: isSelected ? 150 : 120, height: isSelected ? 50 : 40)
                .blur(radius: 10)
        }
        .animation(.easeInOut, value: isSelected)
        .frame(maxHeight: .infinity)
    }
}
