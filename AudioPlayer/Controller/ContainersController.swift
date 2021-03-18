import Swinject

class ContainersController {
    
    private let mainContainer: MainContainer
    
    init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func configure() {
        let containers: [ContainerProtocol] = [MusicContainer(mainContainer: mainContainer),
                                               PlayerContainer(mainContainer: mainContainer),
                                               MusicServiceContainer(mainContainer: mainContainer)]
        
        mainContainer.register(containers: containers)
    }
}
