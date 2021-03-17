import Foundation
import Alamofire
import SwiftyJSON

struct RequestHandler {
    
    private let hostUrl: String
    private let path: String
    private let headers: HTTPHeaders = ["api-key" : "api-key"]
    private let method: HTTPMethod
    private var parameters: Parameters?
    
    private var completeUrl: String {
        return hostUrl + path
    }
    
    init(hostUrl: String = "defaultUrl", path: String = "", method: HTTPMethod = .get, parameters: Parameters? = nil) {
        self.hostUrl = hostUrl
        self.path = path
        self.method = method
        self.parameters = parameters
    }
    
    func response<T: Codable>(_ closure: @escaping ((T?) -> Void)) {
        responseJSON { json in
            let model = T.from(json)
            closure(model)
        }
    }

    func responseJSON(_ closure: @escaping ((JSON) -> Void)) {
        AF.request(completeUrl, method: method, parameters: parameters, headers: headers)
            .responseData { response in
                if let data = response.data, let json = try? JSON(data: data) {
                    closure(json)
                } else {
                    closure(JSON())
                }
        }
    }
    
    func getImage(_ closure: @escaping ((Data) -> Void)) {
        AF.request(completeUrl, method: method).responseData { response in
            if let data = response.data {
                closure(data)
            }
        }
    }
}
