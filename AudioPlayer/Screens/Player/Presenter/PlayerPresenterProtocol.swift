import Foundation

protocol PlayerPresenterProtocol {
    init(view: PlayerViewProtocol, music: Music?)
    
    func setMusicModel()
    func initTrack()
}
