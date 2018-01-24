import Foundation

class ApiService {
    static func formatPostData(params:[String:Any]) -> String {
        var data = [String]()
        for (key, value) in params {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    static func callGet(url:URL, finish: @escaping ((message:String, data:Data?)) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(url.absoluteURL)
        
        var result:(message:String, data:Data?) = (message: "Fail", data: nil)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if (error != nil) {
                result.message = "Fail Error not null : \(error.debugDescription)"
            } else {
                result.message = "Success"
                result.data = data
            }
            
            finish(result)
        }
        task.resume()
    }
    
    static func callPost(url:URL, params:[String:Any], finish: @escaping ((message:String, data:Data?)) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        print(url.absoluteURL)
        
        let postString = self.formatPostData(params: params)
        request.httpBody = postString.data(using: .utf8)
        
        var result:(message:String, data:Data?) = (message: "Fail", data: nil)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if (error != nil) {
               
                result.message = "Fail Error not null : \(error.debugDescription)"
            } else {
                result.message = "Success"
                result.data = data
            }
            
            finish(result)
        }
        task.resume()
    }
    
    static func callPost(url:String, params:[String:Any], finish: @escaping ((message:String, data:Data?)) -> Void) {
        if let url_ = URL(string: url) as URL? {
            ApiService.callPost(url: url_, params: params, finish: finish)
        }
    }
    
    static func callGet(url:String, finish: @escaping ((message:String, data:Data?)) -> Void) {
        print("String")
        if let url_ = URL(string: url) as URL? {
            ApiService.callGet(url: url_, finish: finish)
        }
    }
    
}
