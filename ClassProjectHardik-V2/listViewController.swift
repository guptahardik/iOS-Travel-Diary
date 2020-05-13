//
//  listViewController.swift
//  ClassProjectHardik-V2
//
//  Created by Hardik Gupta on 4/21/20.
//  Copyright © 2020 Hardik Gupta. All rights reserved.
//

import UIKit
import Foundation
import MapKit

class listViewController: UIViewController {
    
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
    
    var obj:PlacesModel = PlacesModel()
    
    @IBOutlet weak var textOut: UITextView!
    
    
    @IBOutlet weak var mapLabel: MKMapView!
    var city : String?
    var country : String?
    var resultCity : [String] = []
    var counter : Int = 0
    var ans : String = ""
    
    @IBAction func continuePress(_ sender: Any) {
    }
    
    @IBOutlet weak var inputPlace: UITextField!
    var coordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(city ?? "Tempe") { (placemark, error) in

                 if error != nil {
                     print("Geocode failed:", error!.localizedDescription as Any)
                    
                 } else if placemark!.count > 0 {
                     let placemark = placemark![0]
                     let location = placemark.location
                    let coord = location?.coordinate

                     self.coordinate = coord


                     let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
                     let region = MKCoordinateRegion(center: self.coordinate!, span: span)

                     self.mapLabel.setRegion(region, animated: true)

                 }
             }

        
        
        
        
        apiCall()
        
        // Do any additional setup after loading the view.
        
    }
    
    func apiCall(){
        
        
        
        var string1: String = "https://maps.googleapis.com/maps/api/place/textsearch/json?query="
        let addCity : String = city!
        let addCountry : String = country!
        let plusString : String = "+"
        let string2: String = "point+of+interest&language=en&key=AIzaSyDtxvH40r7ODrOhUf_OT7e6VpS-SIeRhKE"
        let array1 = addCity.components(separatedBy: " ")
        let array2 = addCountry.components(separatedBy: " " )
        for x in array1{
            string1 = string1 + x + plusString
        }
        for x in array2{
            string1 = string1 + x + plusString
        }
        string1 = string1 + string2
        
        //let finalString = string1 + addCity + plusString + addCountry + string2
        print(string1)
        let jsonData = URLSession.shared.dataTask(with: URL(string: string1)!) { (data, response, error) in
            
            if error != nil {
                print("API Call Failed:", error!.localizedDescription as Any)
            } else {
                
                let jsonResult = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let results = jsonResult as? [String : Any]
               // print(results!)
                
                let Dictionary = results!["results"]! as? [[String: Any]]
                
                
                for x in Dictionary!{
                    if let nameOfPlace = x["name"]! as? String{
                        DispatchQueue.main.async {
                            //self.myCityList.addCityObject(name: nameOfPlace)
                           // self.ans = self.ans  + " " + nameOfPlace
                            self.textOut.text += "\(nameOfPlace)\n"
                        }
                        
                    }
                }
            }
            
        }
        jsonData.resume()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
       if segue.identifier == "continueSeg"{
        let des = segue.destination as! addViewController
        
        if (inputPlace!.text!.isEmpty){
            let alertController = UIAlertController(title: "Stop, Error here", message: "Missing Fields", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel) {
                (action) in
            }
            
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            des.city = city!
            des.country = country!
            des.namePlace = inputPlace.text!
        }
        }
    
    }
    
    @IBAction func unwindToLVC(sender: UIStoryboardSegue) {
        
        if let source = sender.source as? addViewController {
                          
            if let name = source.pN,
                let description1 = source.infoInput.text,
                              let image = source.image {
                              
                obj.addPlaceInfo(pName: name, det: description1, picture1: image.pngData()!)
                            

                          } else {
                              
                              let ac = UIAlertController(title: "Information missing", message: "Try Again", preferredStyle: .alert)
                              
                              let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                              
                              ac.addAction(action)
                              present(ac, animated: true)
                          }
                      }
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
