
import Foundation

struct Pack: Identifiable {
    let id = UUID()
    let type: String
    let image: URL
    
    static func generateMocks(type: String, image: URL, count: Int = 20) -> [Pack] {
        return (0..<count).map { _ in
            Pack(type: type, image: image)
        }
    }
    
    static func getCharizardMocks() -> [Pack] {
        return generateMocks(type: PackTypes.charizard.rawValue, image: PackImages.charizard.url!)
    }
    
    static func getMewtwoMocks() -> [Pack] {
        return generateMocks(type: PackTypes.mewtwo.rawValue, image: PackImages.mewtwo.url!)
    }
    
    static func getPikachuMocks() -> [Pack] {
        return generateMocks(type: PackTypes.pikachu.rawValue, image: PackImages.pikachu.url!)
    }
}
