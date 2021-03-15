//
//  MusicViewController.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 11.03.21.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private(set) weak var noResultsStackView: UIStackView!
    
    var musicModel: [Music]?
    var musicShowModel: [Music]?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        loadMusicData()
    }

    private func setUpElements() {
        table.backgroundColor = .clear
        table.register(UINib(nibName: MusicTableViewCell.reuseIndetifier, bundle: nil), forCellReuseIdentifier: MusicTableViewCell.reuseIndetifier)
        table.tableFooterView = UIView()
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
    }
    
    func loadMusicData() {
        FirebaseHandler().read { [weak self] (response: [String: MusicFirebase]?) in
            guard let self = self else { return }
            self.musicModel = (response ?? [:]).map {
                Music(name: $0.value.name,
                      album: $0.value.album,
                      url: $0.value.url,
                      imageUrl: $0.value.imageUrl)
            }
            self.musicShowModel = self.musicModel
            self.reloadTableData()
        }
    }
    
    func reloadTableData() {
        table.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension MusicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicShowModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.reuseIndetifier, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = musicShowModel?[indexPath.row]
        cell.set(cellViewModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MusicViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = musicShowModel?[indexPath.row]
        let playerViewController = PlayerViewController(cellViewModel)
        playerViewController.modalPresentationStyle = .fullScreen
        present(playerViewController, animated: true, completion: nil)
    }
}
