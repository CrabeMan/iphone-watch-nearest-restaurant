import Foundation


class ApiRestaurantRepository: RestaurantRepository {
    
    
    func findAll(limit: Int, offset: Int, completion: @escaping (Result<[Restaurant]>) -> (Void)){
        ApiService.callGet(url: Configuration.environment + "restaurant?limit=" + String(limit) + "&offset=" + String(offset)) { (message,data) in
            let result = Result<[Restaurant]>()
            do {
                if let jsonData = data {
                    
                    if let restaurant = try JSONDecoder().decode([Restaurant].self, from: jsonData) as [Restaurant]? {
                        
                        result.success = restaurant;
                        completion(result)
                    }
                }
            } catch {
                result.error = error
                completion(result)
            }
        }
    }
    
    
    func find(id: String, completion: (Result<Restaurant>) -> (Void)) {
        
    }
    
    func getNearest(lat: String, long: String, completion: @escaping (Result<[Restaurant]>) -> (Void)) {
        
        let params:[String : Any] = [
            "lat": lat,
            "lon": long]
    
        ApiService.callPost(url: Configuration.environment + "restaurant/nearest", params: params) { (message, data) in
            
            let result = Result<[Restaurant]>()
            do {
                if let jsonData = data {
                    if let restaurant = try JSONDecoder().decode([Restaurant].self, from: jsonData) as [Restaurant]? {
                        result.success = restaurant;
                        completion(result)
                    }
                }
            } catch {
                result.error = error
                completion(result)
            }
        }
        
    }
    
    
 
}
