import UIKit

protocol Delegate: class {
    func update(_ music: Music?) -> UIViewController?
}
class Singletone {
    static let shared = Singletone()
    
    
    weak var delegate: Delegate?
    
    private init() {}
    
    func change(_ music: Music?) -> UIViewController? {
        let vc = delegate?.update(music)
        return vc
    }
}
