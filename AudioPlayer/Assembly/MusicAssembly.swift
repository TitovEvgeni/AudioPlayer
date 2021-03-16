//
//  MusicAssembly.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 16.03.21.
//

import UIKit

class MusicAssembly {
    static func assembly() -> UIViewController {
        let musicViewController = MusicViewController()
        let presenter = MusicPresenter(view: musicViewController)
        musicViewController.presenter = presenter
        return musicViewController
    }
}
