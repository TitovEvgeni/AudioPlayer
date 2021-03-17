import Foundation

protocol MusicPresenterProtocol: class {
    var music: [Music]? { get set }
    var filteredMusic: [Music]? { get set }
    
    init(view: MusicViewProtocol)
    
    func loadMusic()
    func checkSearchField(_ songTitle: String?)
    func choseCurrentModel() -> [Music]?
}
