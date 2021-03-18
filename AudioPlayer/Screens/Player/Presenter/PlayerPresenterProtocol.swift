import Foundation

protocol PlayerPresenterProtocol {
    init(music: Music?)
    
    func setMusicModel()
    func initTrack()
    func instantiateMusicModule()
}
