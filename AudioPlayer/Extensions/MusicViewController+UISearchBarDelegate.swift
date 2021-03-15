//
//  MusicViewController+UISearchBarDelegate.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 11.03.21.
//

import UIKit

extension MusicViewController: UISearchBarDelegate {

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let trimmingSearchText = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        searchBar.text = ""
        
        if trimmingSearchText == ""  {
            musicShowModel = musicModel
            reloadTableData()
            noResultsStackView.isHidden = true
            return
        }
               
        let searchResult = musicModel?.filter { $0.name?.lowercased() == trimmingSearchText }
        
        noResultsStackView.isHidden = searchResult?.count == 0 ? false : true
        
        musicShowModel = searchResult
        reloadTableData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
