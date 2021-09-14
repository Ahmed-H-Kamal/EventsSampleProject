//
//  MapViewCell.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation
import UIKit
import MapKit

class MapViewCell: UITableViewCell, CellConfigurable{
        
    @IBOutlet var map: MKMapView!

    var viewModel: MapViewModel?
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? MapViewModel else { return }
        self.viewModel = viewModel
        showMapCoordinates(lat: viewModel.event.latitude ?? "",
                           long: viewModel.event.longitude ?? "")
    }
    
    func showMapCoordinates(lat: String, long: String) {
        
        var coordinate = CLLocationCoordinate2D()
        if let latitude = CLLocationDegrees(lat), let longitude = CLLocationDegrees(long)
        {
            coordinate.latitude = latitude
            coordinate.longitude = longitude
            
            let point = MKPointAnnotation()
            point.coordinate = coordinate
            
            var region = MKCoordinateRegion()
            var span = MKCoordinateSpan()
            span.latitudeDelta = 0.2
            span.longitudeDelta = 0.2
            
            
            region.span = span;
            region.center = coordinate;
            map.setRegion(region, animated: true)
            map.regionThatFits(region)
            
            
            map.addAnnotation(point)
        }

    }
}
