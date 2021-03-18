import UIKit

class Assembly {
    static let shared = Assembly()
    private init() {}
    
    private let mainContainer = MainContainer()
    private lazy var containersController = ContainersController(mainContainer: mainContainer)
    
    func configContainers() {
        containersController.configure()
    }
    
    func assemblyMusicModule() -> UIViewController? {
        let musicAssembly = MusicAssembly(container: mainContainer.rootContainer)
        guard let viewController = musicAssembly.assembly() else { return nil }
        return viewController
    }
    
    func assemblyPlayerModule(_ music: Music) -> UIViewController? {
        let playerAssembly = PlayerAssembly(container: mainContainer.rootContainer)
        guard let viewController = playerAssembly.assembly(music) else { return nil }
        return viewController
    }
}
