


import Foundation

struct Converter {
    //For degrees in Double
    //I've stored the Intercom office cooridinates as Double
    //since it doesn't make sense for me store them as String
    //The range for latidues is -90 to 90
    //and the range for longitude is -180 to 180
    //this is easily covered by a Double
    //also to convert it to radians I would have had to convert it to Double anyway
    func degreesToRadians(_ degrees: Double) -> Double {
        return degrees * .pi / 180
    }

    //For degrees in String
    //in the customer object
    func degreesToRadians(_ degrees: String) -> Double? {
        if let degrees = Double(degrees) {
            return degrees * .pi / 180
        }
       return nil
    }

}
