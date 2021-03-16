//
//  MusicPresenterProtocol.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 16.03.21.
//

import Foundation

protocol MusicPresenterProtocol: class {
    var music: [Music]? { get set }
    var filteredMusic: [Music]? { get set }
    
    init(view: MusicViewProtocol)
    
    func loadMusic()
    func checkSearchField(_ songTitle: String?)
    func choseCurrentModel() -> [Music]?
}
