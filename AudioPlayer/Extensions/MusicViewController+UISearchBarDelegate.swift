import UIKit

extension MusicViewController: UISearchBarDelegate {

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let trimmingSearchText = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        searchBar.text = .none
        
        if trimmingSearchText == ""  {
            musicShowModel = musicModel
            reloadTableData()
            noResultsStackView.setHidden(true)
            return
        }
               
        let searchResult = musicModel?.filter { $0.name?.lowercased() == trimmingSearchText }
        
        noResultsStackView.setHidden(searchResult?.count != .zero)
                
        musicShowModel = searchResult
        reloadTableData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
