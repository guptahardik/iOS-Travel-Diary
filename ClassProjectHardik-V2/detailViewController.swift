//
//  detailViewController.swift
//  ClassProjectHardik-V2
//
//  Created by Hardik Gupta on 4/21/20.
//  Copyright © 2020 Hardik Gupta. All rights reserved.
//

import UIKit
import MapKit

class detailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
    
    
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var mapLabel: MKMapView!
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func changeDesButton(_ sender: Any) {
        
        let newAlert = UIAlertController(title: "Enter new descriptions", message: "", preferredStyle: .alert)
        
        newAlert.addTextField { (description) in
            description.placeholder = "Enter the new city description here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let OK = UIAlertAction(title: "OK", style: .default) { (action) in
            self.descriptionLabel.text = newAlert.textFields![0].text!
        }
        
        newAlert.addAction(cancelAction)
        newAlert.addAction(OK)
        
        present(newAlert, animated: true)
        
    }
    
    @IBOutlet weak var segmentLabel: UISegmentedControl!
    
    
    @IBAction func changeImageButton(_ sender: Any) {
        if segmentLabel.selectedSegmentIndex == 0{
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.allowsEditing = false
                self.picker.sourceType = UIImagePickerController.SourceType.camera
                self.picker.cameraCaptureMode = .photo
                self.picker.modalPresentationStyle = .fullScreen
                
                self.present(self.picker, animated: true, completion: nil)
                
            } else {
                print("No camera")
            }
        }else{
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.picker.modalPresentationStyle = .popover
            self.present(self.picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButtonPress(_ sender: Any) {
        obj.updatePlace(nameS: placeString!, infoS: descriptionLabel.text!, picture1: (imageLabel.image?.pngData())!)
    }
    
    var placeString : String?
    var coordinate: CLLocationCoordinate2D?
    
    let picker = UIImagePickerController()
     var obj:PlacesModel = PlacesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        let array = placeString!.components(separatedBy: ", ")
        placeLabel.text  =  array[0]
        cityLabel.text  = array[1]
        countryLabel.text = array[2]
        
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(array[1] ?? "Tempe") { (placemark, error) in

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

        
        
        let request = MKLocalSearch.Request()
               request.naturalLanguageQuery = array[0] + " " + array[1] + " " + array[2]
        
               request.region = mapLabel.region
               let search = MKLocalSearch(request: request)
               search.start { (response, error) in
                   
                   var ani: [MKPointAnnotation] = []
                   
                   if error != nil {
                       print("Error: ", error!.localizedDescription)
                   } else if response != nil {
                      let matchingItems = response!.mapItems
                      
                       for item in matchingItems {
                           let places = item.placemark
                           
                           let coordinates = places.location?.coordinate
                       
                           let annotation = MKPointAnnotation()
                           
                           annotation.title = places.name
                           annotation.coordinate = coordinates!
                           
                           ani.append(annotation)
                       }
                       
                       self.mapLabel.addAnnotations(ani)
                   } else {
                       print("no place exists")
                   }
               }
        
        let image1 : UIImage = UIImage(data: obj.getPlaceObject(eyeDee: placeString!).photo!)!
        
        imageLabel.image = image1
        descriptionLabel.text = obj.getPlaceObject(eyeDee: placeString!).info
        

        // Do any additional setup after loading the view.
    }
    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           dismiss(animated: true, completion: nil)
       }
       
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           
           if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
               self.imageLabel.contentMode = .scaleToFill
               self.imageLabel.image = pickedImage
           }
           dismiss(animated: true, completion: nil)
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
