//
//  MapSceneViewController.swift
//  midterm_Dhrupal_Desai
//
//  Created by user204862 on 3/12/22.
//

import UIKit
import MapKit

class MapSceneViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
  
    }
    // locatioManager captures current location and calls render function to display loacation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
        if let location = location.first {
            manager.startUpdatingLocation()
            render (location)
            
            
            
        }
    }
    
    //Render function will take locational data longitude and latitude and tie them to a fixed varable named coordiate
    // span determines the scale of our zooming into the map
    // region is a compounding variable to include bothe coordinate and span
    // render then updates based on all the captured details.
    func render (_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D (latitude: location.coordinate.latitude, longitude: location.coordinate.longitude )
        //span settings determine how much to zoom into the map - defined details
        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
        let region = MKCoordinateRegion(center: coordinate, span: span)
       
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
      //  myloc.showsCompass = true
        
       // myloc.addAnnotation(pin)
        
     
        
    }
    
    @IBAction func goToInitialScene(_ sender: Any) {
        let page = storyboard?.instantiateViewController(withIdentifier : "InitialScene")as! InitialSceneViewController; page.modalPresentationStyle = .fullScreen
        present(page, animated: true)
    }
    
    @IBAction func goToButtonScene(_ sender: Any) {
        let page = storyboard?.instantiateViewController(withIdentifier : "ButtonScene")as! ButtonSceneViewController; page.modalPresentationStyle = .fullScreen
        present(page, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
