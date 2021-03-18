import Swinject

class PlayerContainer: ContainerProtocol {
    let mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(PlayerViewController.self) { (resolver, music: Music) -> PlayerViewController in
            let viewController = PlayerViewController()
            viewController.presenter = resolver.resolve(PlayerPresenter.self, arguments: viewController, music)
            return viewController
        }
        
        rootContainer.register(PlayerRouter.self) { (resolver, viewController: PlayerViewController) -> PlayerRouter in
            let router = PlayerRouter()
            router.viewController = viewController
            return router
        }
        
        rootContainer.register(PlayerPresenter.self) { (resolver, viewController: PlayerViewController, music: Music) -> PlayerPresenter in
            let presenter = PlayerPresenter(music: music)
            presenter.view = viewController
            presenter.router = resolver.resolve(PlayerRouter.self, argument: viewController)
            return presenter
        }
    }
}
