import Foundation


class ApiRestaurantRepository: RestaurantRepository {

    func findAll(completion: (Result<[Restaurant]>) -> (Void)){
        /*return [Restaurant(id: 1, title: "qqdqsd", address: "qsdqsdnqs", city: "qsdjqoisjd", country: "qsiodjqs", latitude: 12.898989, longitude: 12.89898, photo: "soidosifjds", cuisine: "djodijqsd", horaire: "dqdqsdqsd", note: 3, distance: 12.5)]*/
    }
    
    func find(id: String, completion: (Result<Restaurant>) -> (Void)){
    
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
