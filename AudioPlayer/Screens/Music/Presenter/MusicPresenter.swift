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
    var musicToShow: [Music]?
    
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
            self.musicToShow = self.music
            self.view?.reloadTableData()
        })
    }
}
