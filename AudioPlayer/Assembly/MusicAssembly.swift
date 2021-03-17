import UIKit

class MusicAssembly {
    static func assembly() -> UIViewController {
        let viewController = MusicViewController()
        let presenter = MusicPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
