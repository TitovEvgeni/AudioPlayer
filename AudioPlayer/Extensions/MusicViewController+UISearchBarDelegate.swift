//
//  MusicViewController+UISearchBarDelegate.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 11.03.21.
//

import UIKit

extension MusicViewController: UISearchBarDelegate {

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let presenter = presenter else { return }
        presenter.checkSearchField(searchBar.text)
        searchBar.text = .none
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
