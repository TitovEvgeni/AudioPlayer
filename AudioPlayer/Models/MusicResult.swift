import Foundation

struct MusicResult: Codable {
    var tracks: [TracksResult]
}

struct TracksResult: Codable {
    var title: String?
    var description: String?
    var urlSound: String?
    var urlToImage: String?
}
