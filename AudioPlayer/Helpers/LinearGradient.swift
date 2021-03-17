import UIKit

class LinearGradient: UIView {
    
    private let gradient = CAGradientLayer()
    
    private let startXPosition: Double = 0
    private let startYPosition: Double = 0.5
    private let endXPosition: Double = 1
    private let endYPosition: Double = 0.5
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            addGradientColors()
        }
    }
    
    @IBInspectable private var endColor: UIColor? {
        didSet {
            addGradientColors()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLinearGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = self.bounds
    }
    
    private func setLinearGradient() {
        self.layer.addSublayer(gradient)
        addGradientColors()
        addGradientPoints()
    }

    private func addGradientPoints() {
        gradient.startPoint = CGPoint(x: startXPosition, y: startYPosition)
        gradient.endPoint = CGPoint(x: endXPosition, y: endYPosition)
    }

    private func addGradientColors() {
        guard let startColor = startColor,
              let endColor = endColor
        else {
            return
        }
        gradient.colors = [startColor.cgColor, endColor.cgColor]
    }
}
