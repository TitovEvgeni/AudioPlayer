import Foundation

class MusicManager {
    static let shared = MusicManager()
            
    private init() {}
    
    func fetchMusic(closure: @escaping ((MusicResult?) -> Void)) {
        RequestHandler().response(closure)
    }
    
    func fetchImage(url: String, closure: @escaping ((Data) -> Void)) {
        RequestHandler(hostUrl: url).getImage(closure)
    }
}
