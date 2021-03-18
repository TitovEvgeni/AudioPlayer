import Swinject

class MusicContainer: ContainerProtocol {
    let mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(MusicViewController.self) { resolver -> MusicViewController in
            let viewController = MusicViewController()
            viewController.presenter = resolver.resolve(MusicPresenter.self, argument: viewController)
            return viewController
        }
        
        rootContainer.register(MusicRouter.self) { (resolver, viewController: MusicViewController) -> MusicRouter in
            let router = MusicRouter()
            router.viewController = viewController
            return router
        }
        
        rootContainer.register(MusicPresenter.self) { (resolver, viewController: MusicViewController) -> MusicPresenter in
            let presenter = MusicPresenter()
            presenter.view = viewController
            presenter.router = resolver.resolve(MusicRouter.self, argument: viewController)
            presenter.musicService = resolver.resolve(MusicServiceProtocol.self)
            return presenter
        }
    }
    
    
}
