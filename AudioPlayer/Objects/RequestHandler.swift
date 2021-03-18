import Foundation
import Alamofire
import SwiftyJSON

struct RequestHandler {
    
    private let hostUrl: String
    private let path: String
    private var headers: HTTPHeaders = [:]
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
    
    func addHeader(name: String, value: String) -> RequestHandler {
       var new = self
       new.headers[name] = value
       return new
    }
    
    @discardableResult
    func response<T: Codable>(_ closure: @escaping ((T?) -> Void)) -> RequestHandler {
        responseJSON { json in
            let model = T.from(json)
            closure(model)
        }
        
        return self
    }

    @discardableResult
    func responseJSON(_ closure: @escaping ((JSON) -> Void)) -> RequestHandler {
        AF.request(completeUrl, method: method, parameters: parameters, headers: headers)
            .responseData { response in
                if let data = response.data, let json = try? JSON(data: data) {
                    closure(json)
                } else {
                    closure(JSON())
                }
        }
        
        return self
    }
    
    @discardableResult
    func getImage(_ closure: @escaping ((Data) -> Void)) -> RequestHandler {
        AF.request(completeUrl, method: method).responseData { response in
            if let data = response.data {
                closure(data)
            }
        }
        
        return self
    }
}
