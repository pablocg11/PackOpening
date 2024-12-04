
import SwiftUI

struct PackCarouselView: View {
    @State var packs: [Pack]
    @State private var selectedPack: UUID?
    @Binding var backgroundColor: Color

    var body: some View {        
        VStack {
            Text("Pokemon TGCP")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(LinearGradient(colors: [.red, .orange, .yellow],
                                                startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
                )
            
            HStack(spacing: 20) {
                PackSelectorButton(action: {
                    self.packs = Pack.getCharizardMocks()
                    self.backgroundColor = .red
                }, packName: "Charizard", packColor: .red)
                
                PackSelectorButton(action: {
                    self.packs = Pack.getMewtwoMocks()
                    self.backgroundColor = .purple
                }, packName: "Mewtwo", packColor: .purple)
                
                PackSelectorButton(action: {
                    self.packs = Pack.getPikachuMocks()
                    self.backgroundColor = .yellow
                }, packName: "Pikachu", packColor: .yellow)
            }
            .padding()
            
            ScrollViewReader { reader in
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(packs) { pack in
                                GeometryReader { proxy in
                                    PackView(
                                        pack: pack,
                                        isSelected: selectedPack == pack.id,
                                        onSelect: {
                                            withAnimation {
                                                selectedPack = (selectedPack == pack.id) ? nil : pack.id
                                                if let selectedPack = selectedPack {
                                                    reader.scrollTo(selectedPack, anchor: .center)
                                                }
                                            }
                                        }
                                    )
                                    .offset(y: calculateOffset(proxy: proxy, geometry: geometry))
                                    .id(pack.id)
                                }
                                .frame(width: 160)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func calculateOffset(proxy: GeometryProxy, geometry: GeometryProxy) -> CGFloat {
        let midX = proxy.frame(in: .global).midX
        let screenWidth = geometry.size.width
        let progress = (midX - screenWidth / 2) / screenWidth
        let maxOffset: CGFloat = 80
        return abs(progress) * maxOffset
    }
    
    func calculateOffset(for id: UUID) -> CGFloat {
        if let selectedPack = selectedPack, selectedPack == id {
            return -40
        }
        return 0
    }
}
