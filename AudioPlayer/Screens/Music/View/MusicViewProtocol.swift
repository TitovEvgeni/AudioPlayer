//
//  MusicViewProtocol.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 16.03.21.
//

import Foundation

protocol MusicViewProtocol: class {
    func hideNoResultStackView()
    func showNoResultStackView()
    func reloadTableData()
}
