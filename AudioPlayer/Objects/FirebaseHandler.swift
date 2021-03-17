import Foundation
import FirebaseDatabase

struct FirebaseHandler {
    
    private let value: Codable?
    private var children: [String] = []
    
    init(_ value: Codable? = nil) {
        self.value = value
    }
    
    private var actualReference: DatabaseReference {
        var ref = Database.database().reference()
        for child in children {
            ref = ref.child(child)
        }
        return ref
    }
    
    @discardableResult
    func read<T: Codable>(closure: ((T?) -> Void)?) -> FirebaseHandler {
        actualReference.observeSingleEvent(of: .value) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let model = try? T(from: dict)
                closure?(model)
            } else {
                closure?(nil)
            }
        }
        
        return self
    }
    
    func to(_ value: String) -> FirebaseHandler {
        var new = self
        new.children.append(value)
        return new
    }
    
    func autoUUID() -> FirebaseHandler {
        return to(UUID().uuidString)
    }
    
    func setValue() -> FirebaseHandler {
        let dictionary = value?.dictionary
        actualReference.setValue(dictionary)
        return self
    }
}
