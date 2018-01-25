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
        do {
            self.distance = try restaurant.decode(Float.self, forKey: .distance)
        } catch {
            self.distance = 0
        }
    }
}

extension Restaurant: Encodable {
    func encode(to encoder: Encoder) throws {
        var restaurant = encoder.container(keyedBy: RestaurantKeys.self)
        try restaurant.encode(self.id, forKey: .id)
        try restaurant.encode(self.title, forKey: .title)
        try restaurant.encode(self.address, forKey: .address)
        try restaurant.encode(self.city, forKey: .city)
        try restaurant.encode(self.country, forKey: .country)
        try restaurant.encode(self.latitude, forKey: .latitude)
        try restaurant.encode(self.longitude, forKey: .longitude)
        try restaurant.encode(self.photo, forKey: .photo)
        try restaurant.encode(self.cuisine, forKey: .cuisine)
        try restaurant.encode(self.horaire, forKey: .horaire)
        try restaurant.encode(self.note, forKey: .note)
        try restaurant.encode(self.distance, forKey: .distance)
    }
}
