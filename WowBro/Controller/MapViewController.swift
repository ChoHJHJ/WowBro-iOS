//
//  MapViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/24.
//

import UIKit

class MapViewController: UIViewController, MTMapViewDelegate {
    var mapView: MTMapView!
    var mapList: [Tour]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MTMapView(frame: self.view.frame)
        mapView.delegate = self
        mapView.baseMapType = .standard
        for place in mapList! {
            let poiItem = MTMapPOIItem()
            poiItem.markerType = MTMapPOIItemMarkerType.customImage
            poiItem.customImageName = "thumb"
            poiItem.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: place.latitude, longitude: place.longitude))
            poiItem.itemName = place.tourName
            
            mapView.addPOIItems([poiItem])
        }
        
        mapView.fitAreaToShowAllPOIItems()
        self.view.addSubview(mapView)
        
        
        
    }
}
