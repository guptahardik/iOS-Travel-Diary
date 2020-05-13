var entities = [{
  "id": 1,
  "typeString": "class",
  "properties": [
    {
  "name": "var yDistance:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mainImageLabel: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cityColumn: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var countryColumn: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var coordinate: CLLocationCoordinate2D?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var manager: CLLocationManager!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var inputCity : String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var inputCountry : String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var locationImage: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var saveImage: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "keyboardWillShow(_ sender: Notification)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldShouldReturn(_ textField: UITextField) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "keyboardWillHide(_ sender: Notification)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "locationNeed(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "proceedPress(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "isLocationServiceEnabled() -> Bool",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "locationManager(_ manager: CLLocationManager, didFailWithError error: Error)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "unwindToVC(sender: UIStoryboardSegue)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    16
  ],
  "name": "ViewController",
  "superClass": 15
},{
  "id": 2,
  "typeString": "class",
  "properties": [
    {
  "name": "var cities:[city]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "getCount() -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getCityObject(item:Int) -> city",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "location(s : String) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "removeCityObject(item:Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "addCityObject(name:String) -> city",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "cities"
},{
  "id": 3,
  "typeString": "class",
  "properties": [
    {
  "name": "var cityName:String?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(fn:String)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "city"
},{
  "id": 4,
  "typeString": "class",
  "properties": [
    {
  "name": "var yDistance:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var obj:PlacesModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var textOut: UITextView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mapLabel: MKMapView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var city : String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var country : String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var resultCity : [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var counter : Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ans : String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var inputPlace: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var coordinate: CLLocationCoordinate2D?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "keyboardWillShow(_ sender: Notification)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldShouldReturn(_ textField: UITextField) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "keyboardWillHide(_ sender: Notification)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "continuePress(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "apiCall()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "unwindToLVC(sender: UIStoryboardSegue)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "listViewController",
  "superClass": 15
},{
  "id": 5,
  "typeString": "class",
  "properties": [
    {
  "name": "var fetchResults",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let managedObjectContext",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "addPlaceInfo(pName:String, det:String, picture1: Data)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberofrecords() -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getPlaceObject(eyeDee:String) -> Places",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "doesPlaceInfoExist(eyeDee:String) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "delete(x : Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updatePlace(nameS:String, infoS:String, picture1: Data)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "PlacesModel"
},{
  "id": 6,
  "typeString": "class",
  "properties": [
    {
  "name": "var obj:PlacesModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var namePlace : String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var city : String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var country : String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var yDistance:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let picker",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var image: UIImage?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var det : String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var coordinate: CLLocationCoordinate2D?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var pN :String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mapOfPlace: MKMapView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var infoInput: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageInput: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selectedSegment: UISegmentedControl! @objc @objc",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "addPicButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "imagePickerControllerDidCancel(_ picker: UIImagePickerController)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldDidEndEditing(_ textField: UITextField)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "keyboardWillShow(_ sender: Notification)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldShouldReturn(_ textField: UITextField) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "keyboardWillHide(_ sender: Notification)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "addViewController",
  "superClass": 15
},{
  "id": 7,
  "typeString": "class",
  "properties": [
    {
  "name": "var yDistance:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var placeLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cityLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var countryLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mapLabel: MKMapView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageLabel: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var descriptionLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var segmentLabel: UISegmentedControl!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var placeString : String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var coordinate: CLLocationCoordinate2D?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let picker",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var obj:PlacesModel",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "keyboardWillShow(_ sender: Notification)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldShouldReturn(_ textField: UITextField) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "keyboardWillHide(_ sender: Notification)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "changeDesButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "changeImageButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveButtonPress(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "imagePickerControllerDidCancel(_ picker: UIImagePickerController)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "detailViewController",
  "superClass": 15
},{
  "id": 8,
  "typeString": "class",
  "name": "Places",
  "superClass": 17,
  "extensions": [
    9
  ]
},{
  "id": 10,
  "typeString": "class",
  "properties": [
    {
  "name": "var obj:PlacesModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tableViewObj: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell.EditingStyle",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "tableViewController",
  "superClass": 15
},{
  "id": 11,
  "typeString": "class",
  "methods": [
    {
  "name": "awakeFromNib()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setSelected(_ selected: Bool, animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "listTableViewCell",
  "superClass": 18
},{
  "id": 12,
  "typeString": "class",
  "properties": [
    {
  "name": "var placeLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "awakeFromNib()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setSelected(_ selected: Bool, animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "savedTableViewCell",
  "superClass": 18
},{
  "id": 13,
  "typeString": "class",
  "properties": [
    {
  "name": "var persistentContainer: NSPersistentContainer",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let container",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let error",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveContext ()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    20
  ],
  "name": "AppDelegate",
  "superClass": 19
},{
  "id": 14,
  "typeString": "class",
  "properties": [
    {
  "name": "var window: UIWindow?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "sceneDidDisconnect(_ scene: UIScene)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "sceneDidBecomeActive(_ scene: UIScene)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "sceneWillResignActive(_ scene: UIScene)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "sceneWillEnterForeground(_ scene: UIScene)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "sceneDidEnterBackground(_ scene: UIScene)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SceneDelegate",
  "superClass": 19
},{
  "id": 15,
  "typeString": "class",
  "name": "UIViewController"
},{
  "id": 16,
  "typeString": "protocol",
  "name": "CLLocationManagerDelegate"
},{
  "id": 17,
  "typeString": "class",
  "name": "NSManagedObject"
},{
  "id": 18,
  "typeString": "class",
  "name": "UITableViewCell"
},{
  "id": 19,
  "typeString": "class",
  "name": "UIResponder"
},{
  "id": 20,
  "typeString": "protocol",
  "name": "UIApplicationDelegate"
},{
  "id": 9,
  "typeString": "extension",
  "properties": [
    {
  "name": "var namePlace: String? @NSManaged",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var photo: Data? @NSManaged",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var info: String?",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "methods": [
    {
  "name": "fetchRequest() -> NSFetchRequest<Places>",
  "type": "type",
  "accessLevel": "public"
}
  ]
}] 