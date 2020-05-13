//
//  addViewController.swift
//  ClassProjectHardik-V2
//
//  Created by Hardik Gupta on 4/21/20.
//  Copyright © 2020 Hardik Gupta. All rights reserved.
//

import UIKit
import MapKit

class addViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var obj:PlacesModel = PlacesModel()
    
    var namePlace : String = ""
    var  city : String = ""
    var country : String =  ""
    var yDistance:CGFloat = 0
    let picker = UIImagePickerController()
    var image: UIImage?
    var det : String = ""
    var coordinate: CLLocationCoordinate2D?
    var  pN :String?
    
    @IBOutlet weak var mapOfPlace: MKMapView!
    
 
    @IBOutlet weak var infoInput: UITextField!
    
    
    @IBAction func addPicButton(_ sender: Any) {
        
        if selectedSegment.selectedSegmentIndex == 0{
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.allowsEditing = false
                self.picker.sourceType = UIImagePickerController.SourceType.camera
                self.picker.cameraCaptureMode = .photo
                self.picker.modalPresentationStyle = .fullScreen
                
                self.present(self.picker, animated: true, completion: nil)
                
            } else {
                print("No camera")
            }
        }else {
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.picker.modalPresentationStyle = .popover
            self.present(self.picker, animated: true, completion: nil)
        }
        
    }
    
    @IBOutlet weak var imageInput: UIImageView!
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageInput.contentMode = .scaleToFill
            self.imageInput.image = pickedImage
            self.image = imageInput.image!
        }
          dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        
        
    }
    
    @IBOutlet weak var selectedSegment: UISegmentedControl!
    
    override func viewDidLoad() {
         pN = namePlace + ", " + city + ", " + country
        super.viewDidLoad()
        picker.delegate = self
        infoInput.delegate = self
        

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

                     self.mapOfPlace.setRegion(region, animated: true)

                 }
             }

        
        
        let request = MKLocalSearch.Request()
               request.naturalLanguageQuery = namePlace + " " + city + " " + country
        
               request.region = mapOfPlace.region
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
                       
                       self.mapOfPlace.addAnnotations(ani)
                   } else {
                       print("no place exists")
                   }
               }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.det = infoInput.text!
        
    }
    
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
}
