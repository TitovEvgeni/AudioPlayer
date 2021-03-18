import Foundation

class PlayerPresenter: PlayerPresenterProtocol {

    weak var view: PlayerViewProtocol?
    var router: PlayerRouterProtocol?
    var music: Music?
    
    required init(music: Music?) {
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
    
    func instantiateMusicModule() {
        router?.showMusicModule()
    }
    
    private func trackAction() {
        PlayerManager.shared.playerAction() == PlayerRate.play
            ? view?.setPauseTitle()
            : view?.setPlayTitle()
    }
}
