import Foundation

struct Configuration {
    
    #if DEBUG
    
    enum Environment: String {
        case Dev = "http://mustache.labite.win:5000/"
    }
    
    static let environment = Environment.Dev.rawValue//we can change this at any time
    
    #else
    static let environment = NSBundle.mainBundle().infoDictionary!  ["API_BASE_URL_ENDPOINT"] as! String
    #endif
}
