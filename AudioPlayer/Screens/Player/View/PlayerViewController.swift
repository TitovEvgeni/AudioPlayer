import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet private weak var songNameLabel: UILabel!
    @IBOutlet private weak var navigationBar: UINavigationBar!
    @IBOutlet private weak var trackImage: ImageViewWeb!
    @IBOutlet private weak var albumLabel: UILabel!
    @IBOutlet private weak var playerButton: UIButton!
    
    var presenter: PlayerPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        presenter?.setMusicModel()
    }
    
    private func setUpElements() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }

    @IBAction func dismissViewController(_ sender: UIBarItem) {
        presenter?.instantiateMusicModule()
    }
    
    @IBAction func activateMusic(_ sender: UIButton) {
        presenter?.initTrack()
    }
}

extension PlayerViewController: PlayerViewProtocol {
    func set(music: Music?) {
        guard let music = music else { return }
        songNameLabel.text = music.name
        navigationBar.topItem?.title = music.name
        albumLabel.text = music.album
        
        if let stringUrl = music.imageUrl {
            trackImage.setImage(from: stringUrl)
            trackImage.showView()
        } else {
            trackImage.hideView()
        }
    }
    
    func setPlayTitle() {
        playerButton.setTitle(R.string.localizable.playerPlayButton(), for: .normal)
    }
    
    func setPauseTitle() {
        playerButton.setTitle(R.string.localizable.playerPauseButton(), for: .normal)
    }
}
