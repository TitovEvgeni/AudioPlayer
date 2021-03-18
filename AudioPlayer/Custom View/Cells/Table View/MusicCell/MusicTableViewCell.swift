import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet private weak var songNameLabel: UILabel!
    @IBOutlet private weak var albumNameLabel: UILabel!
    @IBOutlet private weak var trackImage: ImageViewWeb!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        trackImage.setHidden(true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpElements()
    }

    private func setUpElements() {
        backgroundColor = .clear
        selectionStyle = .none
    }

    func set(_ model: Music?) {
        songNameLabel.text = model?.name
        albumNameLabel.text = model?.album
        
        if let stringUrl = model?.imageUrl {
            trackImage.setImage(from: stringUrl)
            trackImage.setHidden(false)
        } else {
            trackImage.setHidden(true)
        }
    }
}

