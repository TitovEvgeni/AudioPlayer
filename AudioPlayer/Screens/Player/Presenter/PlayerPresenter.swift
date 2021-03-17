import Foundation

class PlayerPresenter: PlayerPresenterProtocol {

    weak var view: PlayerViewProtocol?
    var music: Music?
    
    required init(view: PlayerViewProtocol, music: Music?) {
        self.view = view
        self.music = music
    }
    
    func setMusicModel() {
        view?.set(music: music)
    }
    
    func initTrack() {
        if music?.url != PlayerManager.shared.soundUrl {
            PlayerManager.shared.initPlayer(music?.url)
        }
        trackAction()
    }
    
    private func trackAction() {
        PlayerManager.shared.playerAction() == PlayerRate.play
            ? view?.setPauseTitle()
            : view?.setPlayTitle()
    }
}
