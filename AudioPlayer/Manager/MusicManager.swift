//
//  MusicManager.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 11.03.21.
//

import Foundation

class MusicManager {
    static let shared = MusicManager()
            
    private init() {}
    
    func fetchMusic(closure: @escaping ((MusicResult?) -> Void)) {
        RequestHandler().response(closure)
    }
    
    func fetchImage(url: String, closure: @escaping ((Data) -> Void)) {
        RequestHandler(hostUrl: url).getImage(closure)
    }
}
