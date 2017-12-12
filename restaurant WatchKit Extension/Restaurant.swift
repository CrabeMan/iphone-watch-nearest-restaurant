import Foundation

struct Restaurant {
    let id: Int
    let title: String
    let address: String
    let city: String
    let country: String
    let latitude: Float
    let longitude: Float
    let photo: String
    let cuisine: String
    let horaire: String
    let note: Double
    let distance: Float
    
    enum CodingKeys: String, CodingKey {
        case restaurant
    }
    
    enum RestaurantKeys: String, CodingKey {
        case id, title, address, city, country, latitude, longitude, photo, cuisine, horaire, note, distance
    }
}

extension Restaurant: Decodable {
    init(from decoder: Decoder) throws {
        let restaurant = try decoder.container(keyedBy: RestaurantKeys.self)
        
        self.id          = try restaurant.decode(Int.self, forKey: .id)
        self.title       = try restaurant.decode(String.self, forKey: .title)
        self.address     = try restaurant.decode(String.self, forKey: .address)
        self.city        = try restaurant.decode(String.self, forKey: .city)
        self.country     = try restaurant.decode(String.self, forKey: .country)
        self.latitude    = try restaurant.decode(Float.self, forKey: .latitude)
        self.longitude   = try restaurant.decode(Float.self, forKey: .longitude)
        self.photo       = try restaurant.decode(String.self, forKey: .photo)
        self.cuisine     = try restaurant.decode(String.self, forKey: .cuisine)
        self.horaire     = try restaurant.decode(String.self, forKey: .horaire)
        self.note        = try restaurant.decode(Double.self, forKey: .note)
        self.distance    = try restaurant.decode(Float.self, forKey: .distance)
    }
}
