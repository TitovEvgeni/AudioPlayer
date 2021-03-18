import Foundation

class MusicPresenter: MusicPresenterProtocol {
   
    weak var view: MusicViewProtocol?
    var router: MusicRouterProtocol?
    var musicService: MusicServiceProtocol?
    
    var music: [Music]?
    var filteredMusic: [Music]?
    
    private var isFiltered: Bool = false
    
    func loadMusic() {
        musicService?.fetchMusic { [weak self] music in
            guard let self = self else { return }
            self.music = music
            self.view?.reloadTableData()
        }
    }
    
    func checkSearchField(_ songTitle: String?) {
        guard let songTitle = songTitle else { return }
        isFiltered = false
        
        let trimmingSearchText = songTitle.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmingSearchText == ""  {
            view?.hideNoResultStackView()
            return
        }
        
        generateCurrentMusicModel(trimmingSearchText)
    }
    
    func choseCurrentModel() -> [Music]? {
        if isFiltered == true {
            return filteredMusic
        } else {
            return music
        }
    }
    
    func instantiatePlayerModule(with music: Music) {
        router?.showPlayerModule(with: music)
    }
    
    private func generateCurrentMusicModel(_ result: String) {
        let searchResult = music?.filter { $0.name?.lowercased() == result }
        isFiltered = true
        
        if searchResult?.count == .zero {
            filteredMusic?.removeAll()
            view?.showNoResultStackView()
        } else {
            filteredMusic = searchResult
            view?.hideNoResultStackView()
        }
    }
}
