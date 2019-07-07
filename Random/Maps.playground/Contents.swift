import Foundation
import CoreLocation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true



let longitude = CLLocationDegrees("18.4240553" )!
let latitude = CLLocationDegrees("-33.9248685" )!

func retreiveCityName(lattitude: Double, longitude: Double, completionHandler: @escaping (String?) -> Void)
{
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(CLLocation(latitude: lattitude, longitude: longitude), completionHandler:
        {
            placeMarks, error in
            
            completionHandler(placeMarks?.first?.locality)
    })
}

retreiveCityName(lattitude: latitude, longitude: longitude) { (cityNme) in
    print(cityNme ?? "City not found")
}

//let location = CLLocation(latitude: 37.3321, longitude: -122.0318)
//CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
//
//    guard let placemark = placemarks?.first else {
//        let errorString = error?.localizedDescription ?? "Unexpected Error"
//        print("Unable to reverse geocode the given location. Error: \(errorString)")
//        return
//    }
//
//    let reversedGeoLocation = ReversedGeoLocation(with: placemark)
//    print(reversedGeoLocation.formattedAddress)
//    // Apple Inc.,
//    // 1 Infinite Loop,
//    // Cupertino, CA 95014
//    // United States
//}

struct ReversedGeoLocation {
    let name: String            // eg. Apple Inc.
    let streetName: String      // eg. Infinite Loop
    let streetNumber: String    // eg. 1
    let city: String            // eg. Cupertino
    let state: String           // eg. CA
    let zipCode: String         // eg. 95014
    let country: String         // eg. United States
    let isoCountryCode: String  // eg. US
    
    var formattedAddress: String {
        return """
        \(name),
        \(streetNumber) \(streetName),
        \(city), \(state) \(zipCode)
        \(country)
        """
    }
    
    // Handle optionals as needed
    init(with placemark: CLPlacemark) {
        self.name           = placemark.name ?? ""
        self.streetName     = placemark.thoroughfare ?? ""
        self.streetNumber   = placemark.subThoroughfare ?? ""
        self.city           = placemark.locality ?? ""
        self.state          = placemark.administrativeArea ?? ""
        self.zipCode        = placemark.postalCode ?? ""
        self.country        = placemark.country ?? ""
        self.isoCountryCode = placemark.isoCountryCode ?? ""
    }
}
