import MapKit
import DesignSystem
import HomeFeatureInterface

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    @Published var mapView: MKMapView = .init()
    @Published var isChanging: Bool = false // 지도의 움직임 여부를 저장하는 프로퍼티
    @Published var title: String = ""
    @Published var subTitle: String = ""

    private var manager: CLLocationManager = .init()
    private var currentGeoPoint: CLLocationCoordinate2D? // 현재 위치를 저장하는 프로퍼티

    override init() {
        super.init()

        self.configureLocationManager()
    }

    // MARK: - 사용자의 위치 권한 여부를 확인하고 요청하거나 현재 위치 MapView를 이동하는 메서드
    func configureLocationManager() {
        mapView.delegate = self
        manager.delegate = self

        let status = manager.authorizationStatus

        if status == .notDetermined {
            manager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            mapView.showsUserLocation = true // 사용자의 현재 위치를 확인할 수 있도록
            self.locationManagerDidChangeAuthorization()
        }
    }

    // MARK: - MapView에서 화면이 이동하면 호출되는 메서드
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        DispatchQueue.main.async {
            self.isChanging = true
        }
    }

    // MARK: - MapView에서 화면 이동이 종료되면 호출되는 메서드
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated: Bool) {
        let location: CLLocation = CLLocation(
            latitude: mapView.centerCoordinate.latitude,
            longitude: mapView.centerCoordinate.longitude
        )

        self.convertLocationToAddress(location: location)

        DispatchQueue.main.async {
            self.isChanging = false
        }
    }

    // MARK: - 특정 위치로 MapView의 Focus를 이동하는 메서드
    func mapViewFocusChange() {
        print("[SUCCESS] Map Focus Changed")
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(
            center: self.currentGeoPoint ??
            CLLocationCoordinate2D(
                latitude: 37.394776,
                longitude: 127.11116
            ),
            span: span
        )
        mapView.setRegion(region, animated: true)
    }

    // MARK: - 사용자에게 위치 권한이 변경되면 호출되는 메서드 (LocationManager 인스턴스가 생성될 때도 호출)
    func locationManagerDidChangeAuthorization() {
        if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
            guard let location = manager.location else {
                print("[ERROR] No Location")
                return
            }

            self.currentGeoPoint = location.coordinate // 현재 위치를 저장하고
            self.mapViewFocusChange() // 현재 위치로 MapView를 이동
            self.convertLocationToAddress(location: location)
        }
    }

    // MARK: - 사용자의 위치가 변경되면 호출되는 메서드
    /// startUpdatingLocation 메서드 또는 requestLocation 메서드를 호출했을 때에만 이 메서드가 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("[SUCCESS] Did Update Locations")
    }

    // MARK: - 사용자의 현재 위치를 가져오는 것을 실패했을 때 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    // MARK: - location을 도로명 주소로 변환해주는 메서드
    func convertLocationToAddress(location: CLLocation) {
        let geocoder = CLGeocoder()

        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if error != nil {
                return
            }

            guard let placemark = placemarks?.first else { return }

            self.title = placemark.name ?? ""

            self.subTitle = ""
            let locality = placemark.locality
            let subLocality = placemark.administrativeArea
            let thoroughfare = placemark.subThoroughfare
            self.subTitle = [locality, subLocality, thoroughfare].map { $0 ?? "" }.joined(separator: " ")
        }
    }
}

extension LocationManager {
    func addPin(type: LocationType) {
        removePin(type: type)
        let pin = ORIAnnotation(type: type, coordinate: mapView.centerCoordinate )
        mapView.addAnnotation(pin)
    }

    func removePin(type: LocationType) {
        mapView.annotations.filter { ($0 as? ORIAnnotation)?.type == type }.forEach {
            mapView.removeAnnotation($0)
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard let annotation = annotation as? ORIAnnotation else { return nil }

        var annotationView = self.mapView.dequeueReusableAnnotationView(
            withIdentifier: "oriMapID!"
        )

        if annotationView == nil {
            annotationView = MKAnnotationView(
                annotation: annotation,
                reuseIdentifier: "oriMapID!"
            )
            annotationView?.canShowCallout = false
            annotationView?.contentMode = .scaleAspectFit

        } else {
            annotationView?.annotation = annotation
        }

        let image: UIImage!
        let size = CGSize(width: 32, height: 48)
        UIGraphicsBeginImageContext(size)

        switch annotation.type {
        case .start:
            image = DesignSystemAsset.Icons.startPin.image
        case .end:
            image = DesignSystemAsset.Icons.endPin.image
        }

        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        annotationView?.image = resizedImage

        return annotationView
    }
}

class ORIAnnotation: NSObject, MKAnnotation {
    let type: LocationType
    let coordinate: CLLocationCoordinate2D

    init(
        type: LocationType,
        coordinate: CLLocationCoordinate2D
    ) {
        self.type = type
        self.coordinate = coordinate

        super.init()
    }
}
