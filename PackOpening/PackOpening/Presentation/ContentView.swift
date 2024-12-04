import SwiftUI

struct ContentView: View {
    @State var backgroundColor: Color = .red
    var body: some View {
        ZStack {
            VStack {
                Color(backgroundColor.opacity(0.4))
                    .frame(height: 100)
                Spacer()
                Color(backgroundColor.opacity(0.4))
                    .frame(height: 100)
            }
            .ignoresSafeArea()
            
            PackCarouselView(packs: Pack.getCharizardMocks(),
                             backgroundColor: $backgroundColor)
        }
    }
}
