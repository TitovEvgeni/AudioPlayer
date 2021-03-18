import Foundation

class MusicService: MusicServiceProtocol {
    func fetchMusic(_ closure: (([Music]) -> Void)?) {
        FirebaseHandler().read(closure: { (response: [String: MusicFirebase]?) in
            let music = (response ?? [:]).map {
                Music(name: $0.value.name,
                      album: $0.value.album,
                      url: $0.value.url,
                      imageUrl: $0.value.imageUrl)
            }
            
            closure?(music)
        })
    }
}
