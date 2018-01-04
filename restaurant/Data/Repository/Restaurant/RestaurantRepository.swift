import Foundation

protocol RestaurantRepository : Repository{
    
    func findAll(completion: (Result<[Restaurant]>) -> (Void))
    
    func find(id: String, completion: (Result<Restaurant>) -> (Void))
    
    func getNearest(lat: String, long: String, completion: @escaping (Result<[Restaurant]>) -> (Void)) 
}
