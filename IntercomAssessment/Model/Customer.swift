


import Foundation

class Customer: Codable {
    //To make my Customer model map to the JSON provided with codable I had to have the same data types
    //would have preferred to have lat and long as double, not string though
    var name: String!
    var userId: Int!
    var latitude: String!
    var longitude: String!
    var distanceFromIntercom: Double!

    enum CodingKeys: String, CodingKey {
        case name
        case userId = "user_id"
        case latitude
        case longitude
    }
}
