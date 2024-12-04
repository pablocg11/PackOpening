
import Foundation

enum PackImages: String {
    case charizard = "https://www.serebii.net/tcgpocket/geneticapex/charizard.jpg"
    case mewtwo = "https://www.serebii.net/tcgpocket/geneticapex/mewtwo.jpg"
    case pikachu = "https://www.serebii.net/tcgpocket/geneticapex/pikachu.jpg"
    
    var url: URL? {
        return URL(string: self.rawValue)
    }
}
