import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet private weak var songNameLabel: UILabel!
    @IBOutlet private weak var navigationBar: UINavigationBar!
    @IBOutlet private weak var trackImage: ImageViewWeb!
    @IBOutlet private weak var albumLabel: UILabel!
    
    private var musicModel: Music?
    
    convenience init(_ model: Music?) {
        self.init()
        self.musicModel = model
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        setMusicModel()
    }
    
    private func setUpElements() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
    private func setMusicModel() {
        songNameLabel.text = musicModel?.name
        navigationBar.topItem?.title = musicModel?.name
        albumLabel.text = musicModel?.album
        
        if let stringUrl = musicModel?.imageUrl {
            trackImage.setImage(from: stringUrl)
            trackImage.setHidden(false)
        } else {
            trackImage.setHidden(true)
        }
    }

    @IBAction func dismissViewController(_ sender: UIBarItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func activateMusic(_ sender: UIButton) {
        if musicModel?.url != PlayerManager.shared.soundUrl {
            PlayerManager.shared.initPlayer(musicModel?.url)
        }
        PlayerManager.shared.playerAction() == PlayerRate.play
            ? sender.setTitle(R.string.localizable.playerPauseButton(), for: .normal)
            : sender.setTitle(R.string.localizable.playerPlayButton(), for: .normal)
    }
}
