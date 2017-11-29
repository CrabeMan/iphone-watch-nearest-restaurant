import Foundation

struct Restaurant {
    let id: Int
    let name: String
    let price: String? = nil
    let address: String
    let zipCode: String
    let country: String
    let latitude: String
    let longitude: String
    let description: String
    let distance: Float
    
    enum CodingKeys: String, CodingKey {
        case restaurant
    }
    
    enum RestaurantKeys: String, CodingKey {
        case id, name, price, address, zipCode, country, latitude, longitude, description, distance
    }
}

extension Restaurant: Decodable {
    init(from decoder: Decoder) throws {
        let restaurant = try decoder.container(keyedBy: RestaurantKeys.self)
        
        self.id          = try restaurant.decode(Int.self, forKey: .id)
        self.name        = try restaurant.decode(String.self, forKey: .name)
        self.address     = try restaurant.decode(String.self, forKey: .address)
        self.zipCode     = try restaurant.decode(String.self, forKey: .zipCode)
        self.country     = try restaurant.decode(String.self, forKey: .country)
        self.latitude    = try restaurant.decode(String.self, forKey: .latitude)
        self.longitude   = try restaurant.decode(String.self, forKey: .longitude)
        self.description = try restaurant.decode(String.self, forKey: .description)
        self.distance    = try restaurant.decode(Float.self, forKey: .distance)
    }
}
