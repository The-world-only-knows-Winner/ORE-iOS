import Foundation
import CoreLocation

public struct LocationModel {
    public let name: String
    public let coodinate: CLLocationCoordinate2D

    public init(name: String, coodinate: CLLocationCoordinate2D) {
        self.name = name
        self.coodinate = coodinate
    }
}
