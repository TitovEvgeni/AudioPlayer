import Swinject

class MusicServiceContainer: ContainerProtocol {
    var mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(MusicServiceProtocol.self) { resolver -> MusicServiceProtocol in
            return MusicService()
        }
    }
    
    
}
