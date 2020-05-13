//
//  ViewController.swift
//  ClassProjectHardik-V2
//
//  Created by Hardik Gupta on 4/21/20.
//  Copyright © 2020 Hardik Gupta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    var yDistance:CGFloat = 0
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y -= yDistance/10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
              view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y += yDistance/10
    }
    
    @IBOutlet weak var mainImageLabel: UIImageView!
    
    @IBOutlet weak var cityColumn: UITextField!
    
    @IBOutlet weak var countryColumn: UITextField!
    
    var coordinate: CLLocationCoordinate2D?
    var manager: CLLocationManager!
    
    var inputCity : String?
    var inputCountry : String?
    
    
    @IBAction func locationNeed(_ sender: Any) {
        
        cityColumn.text = inputCity
        countryColumn.text = inputCountry
    }
    
    @IBAction func proceedPress(_ sender: Any) {
        
    }
    
    @IBOutlet weak var locationImage: UIImageView!
    
    @IBOutlet weak var saveImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainImageLabel.image = UIImage(named: "mainImg.jpg")
        locationImage.image = UIImage(named: "location.jpg")
        saveImage.image = UIImage(named: "save.png")
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    class func isLocationServiceEnabled() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                return false
            case .authorizedAlways, .authorizedWhenInUse:
                return true
            default:
                print("Something wrong with Location services")
                return false
            }
        } else {
            print("Location services are not enabled")
            return false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    
        
        //userLocation - there is no need for casting, because we are now using CLLocation object

        let userLocation:CLLocation = locations[0]
        
        let lat = Double(userLocation.coordinate.latitude)
        let long = Double(userLocation.coordinate.longitude)
        
        let location = CLLocation(latitude: lat, longitude: long)
        CLGeocoder().reverseGeocodeLocation(location){(placemarks, error) in
              if let error = error {
                  print("Unable to Reverse Geocode Location (\(error))")
                
            }
              else{
                 if (placemarks?.count)! > 0  {
                    self.inputCountry =  (placemarks?[0].country)!
                    self.inputCity = (placemarks?[0].locality)!
                }
            }
        }
        

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToVC(sender: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
       if segue.identifier == "proceedSeg"{
        let des = segue.destination as! listViewController
        if (cityColumn.text!.isEmpty || countryColumn.text!.isEmpty){
            let alertController = UIAlertController(title: "Stop, Error here", message: "Missing Fields", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel) {
                (action) in
            }
            
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            des.city = cityColumn.text
            des.country = countryColumn.text
        }
    }
    }
    

}

