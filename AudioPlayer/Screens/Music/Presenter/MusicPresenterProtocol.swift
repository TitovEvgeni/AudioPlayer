import Foundation

protocol MusicPresenterProtocol {
    var music: [Music]? { get set }
    var filteredMusic: [Music]? { get set }
        
    func loadMusic()
    func checkSearchField(_ songTitle: String?)
    func choseCurrentModel() -> [Music]?
    func instantiatePlayerModule(with music: Music)
}
