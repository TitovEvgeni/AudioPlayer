//
//  MusicPresenter.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 16.03.21.
//

import Foundation

class MusicPresenter: MusicPresenterProtocol {
    
    private weak var view: MusicViewProtocol?
    
    var music: [Music]?
    var filteredMusic: [Music]?
    
    private var isFiltered: Bool = false
    
    required init(view: MusicViewProtocol) {
        self.view = view
        
        loadMusic()
    }
    
    func loadMusic() {
        FirebaseHandler().read(closure: { [weak self] (response: [String: MusicFirebase]?) in
            guard let self = self else { return }
            self.music = (response ?? [:]).map {
                Music(name: $0.value.name,
                      album: $0.value.album,
                      url: $0.value.url,
                      imageUrl: $0.value.imageUrl)
            }
            self.view?.reloadTableData()
        })
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
    
    private func generateCurrentMusicModel(_ result: String) {
        let searchResult = music?.filter { $0.name?.lowercased() == result }
        
        if searchResult?.count == .zero {
            filteredMusic?.removeAll()
            isFiltered = true
            view?.showNoResultStackView()
        } else {
            filteredMusic = searchResult
            isFiltered = true
            view?.hideNoResultStackView()
        }
    }
}
