import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private(set) weak var noResultsStackView: UIStackView!
    
    private let searchBarBorderWidth: CGFloat = 1
    
    var presenter: MusicPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }

    private func setUpElements() {
        table.backgroundColor = .clear
        table.register(UINib(nibName: MusicTableViewCell.reuseIndetifier, bundle: nil), forCellReuseIdentifier: MusicTableViewCell.reuseIndetifier)
        table.tableFooterView = UIView()
        searchBar.layer.borderWidth = searchBarBorderWidth
        searchBar.layer.borderColor = UIColor.white.cgColor
    }
}

//MARK: - UITableViewDataSource
extension MusicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = presenter?.choseCurrentModel() else { return .zero }
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.reuseIndetifier, for: indexPath) as? MusicTableViewCell,
              let model = presenter?.choseCurrentModel() else {
            return UITableViewCell()
        }
        let cellViewModel = model[indexPath.row]
        cell.set(cellViewModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MusicViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = presenter?.choseCurrentModel() else { return }
        let cellViewModel = model[indexPath.row]
        let playerViewController = PlayerAssembly.assembly(cellViewModel)
        playerViewController.modalPresentationStyle = .fullScreen
        present(playerViewController, animated: true, completion: nil)
    }
}

//MARK: - MusicViewProtocol
extension MusicViewController: MusicViewProtocol {
    func hideNoResultStackView() {
        noResultsStackView.hideView()
        reloadTableData()
    }
    
    func showNoResultStackView() {
        noResultsStackView.showView()
        reloadTableData()
    }
    
    func reloadTableData() {
        table.reloadData()
    }
}
