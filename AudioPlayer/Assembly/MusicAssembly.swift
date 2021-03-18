import UIKit
import Swinject

class MusicAssembly {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }

    func assembly() -> UIViewController? {
        return container.resolve(MusicViewController.self)
    }
}
