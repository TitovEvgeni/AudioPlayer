import UIKit
import AVFoundation

class PlayerManager {
    
    static let shared = PlayerManager()
    
    private init() {}
    
    var player = AVPlayer()
    var soundUrl: String?

    func initPlayer(_ url: String?) {
        soundUrl = url
        guard let stringUrl = url, let url = URL(string: stringUrl) else { return }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
    }
    
    func playerAction() -> PlayerRate? {
        let currentRate = PlayerRate(rawValue: player.rate)
        switch currentRate {
        case .play:
            player.play()
        case .pause:
            player.pause()
        default:
            return nil
        }
        return currentRate
    }
}
