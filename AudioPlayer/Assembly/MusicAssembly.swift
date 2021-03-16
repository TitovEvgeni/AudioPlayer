import UIKit

class MusicAssembly {
    static func assembly() -> UIViewController {
        let musicViewController = MusicViewController()
        let presenter = MusicPresenter(view: musicViewController)
        musicViewController.presenter = presenter
        return musicViewController
    }
}
