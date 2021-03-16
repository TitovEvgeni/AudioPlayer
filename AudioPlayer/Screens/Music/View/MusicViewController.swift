//
//  MusicViewController.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 11.03.21.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private(set) weak var noResultsStackView: UIStackView!
    
    var presenter: MusicPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }

    private func setUpElements() {
        table.backgroundColor = .clear
        table.register(UINib(nibName: MusicTableViewCell.reuseIndetifier, bundle: nil), forCellReuseIdentifier: MusicTableViewCell.reuseIndetifier)
        table.tableFooterView = UIView()
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
    }
}

//MARK: - UITableViewDataSource
extension MusicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.musicToShow?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.reuseIndetifier, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = presenter.musicToShow?[indexPath.row]
        cell.set(cellViewModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MusicViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = presenter.musicToShow?[indexPath.row]
        let playerViewController = PlayerViewController(cellViewModel)
        playerViewController.modalPresentationStyle = .fullScreen
        present(playerViewController, animated: true, completion: nil)
    }
}

//MARK: - MusicViewProtocol
extension MusicViewController: MusicViewProtocol {
    func reloadTableData() {
        table.reloadData()
    }
}
