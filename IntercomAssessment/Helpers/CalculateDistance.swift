


import Foundation

struct CalculateDistance {
    //Calculating distance using the spherical law of cosines formula
    func fromIntercomDublin( _ latitude:String, _ longitude: String) -> Double? {

        let intercomLat = Converter().degreesToRadians(Constants.intercomLatitude)
        let intercomLong = Converter().degreesToRadians(Constants.intercomLongitude)
        guard let customerLat = Converter().degreesToRadians(latitude) else {
            return nil
        }
        guard let customerLong = Converter().degreesToRadians(longitude) else {
            return nil
        }

        let longDifference = abs(intercomLong - customerLong)
        let sinIntercomLat = sin(intercomLat)
        let sinCustomerLat = sin(customerLat)
        let cosIntercomLat = cos(intercomLat)
        let cosCustomerLat = cos(customerLat)
        let cosLongDiff = cos(longDifference)
        let sinProduct = sinCustomerLat * sinIntercomLat
        let cosProduct = cosCustomerLat * cosIntercomLat * cosLongDiff
        let sum = sinProduct + cosProduct
        let centralAngle = acos(sum)
        let distance = Constants.earthRadius * centralAngle

        return distance
        
    }

}
