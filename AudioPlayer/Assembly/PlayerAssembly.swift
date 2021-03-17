import UIKit

class PlayerAssembly {
    static func assembly(_ music: Music?) -> UIViewController {
        let viewController = PlayerViewController()
        let presenter = PlayerPresenter(view: viewController, music: music)
        viewController.presenter = presenter
        return viewController
    }
}

