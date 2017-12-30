import Foundation

class ApiService {
    static func formatPostData(params:[String:Any]) -> String {
        var data = [String]()
        for (key, value) in params {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    static func callPost(url:URL, params:[String:Any], finish: @escaping ((message:String, data:Data?)) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
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
}
