import Foundation
import IQKeyboardManagerSwift
import Firebase

final class AppConfigure {
    func configure() {
        configureFirebase()
        configureIqKeyboard()
    }
    
    private func configureFirebase() {
        FirebaseApp.configure()
    }
    
    private func configureIqKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarManageBehaviour = .byTag
    }
}
