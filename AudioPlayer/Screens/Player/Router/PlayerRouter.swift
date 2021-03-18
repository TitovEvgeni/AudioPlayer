import UIKit

class PlayerRouter: PlayerRouterProtocol {
    weak var viewController: PlayerViewController?
    
    func showMusicModule() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}
