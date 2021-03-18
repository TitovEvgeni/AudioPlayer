import Foundation

protocol MusicServiceProtocol {
    func fetchMusic(_ closure: (([Music]) -> Void)?)
}
