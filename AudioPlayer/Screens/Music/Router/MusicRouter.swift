import Foundation

class MusicRouter: MusicRouterProtocol {
    weak var viewController: MusicViewController?
    
    func showPlayerModule(with music: Music) {
        guard let viewController = Assembly.shared.assemblyPlayerModule(music) else { return }
        viewController.modalPresentationStyle = .fullScreen
        self.viewController?.present(viewController, animated: true, completion: nil)
    }
}
