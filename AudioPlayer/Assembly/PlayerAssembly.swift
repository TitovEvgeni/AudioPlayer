import UIKit
import Swinject

class PlayerAssembly {
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func assembly(_ music: Music) -> UIViewController? {
        return container.resolve(PlayerViewController.self, argument: music)
    }
}

