import Foundation

protocol MusicViewProtocol: class {
    func viewLoaded()
    func hideNoResultStackView()
    func showNoResultStackView()
    func reloadTableData()
}
