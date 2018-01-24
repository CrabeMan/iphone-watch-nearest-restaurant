import Foundation

protocol RestaurantRepository : Repository{
    
    func findAll(limit: Int, offset: Int, completion: @escaping (Result<[Restaurant]>) -> (Void))
    
    func find(id: String, completion: (Result<Restaurant>) -> (Void))
    
    func getNearest(lat: String, long: String, completion: @escaping (Result<[Restaurant]>) -> (Void)) 
}
