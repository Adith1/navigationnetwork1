//
//  firebase.swift
//  navigationnetwork1
//
//  Created by Adith Sundram on 5/25/19.
//  Copyright © 2019 Adith Sundram. All rights reserved.
//

import UIKit
import Firebase
 var ref: DatabaseReference! = Database.database().reference()
func createParkingSpots(){
    
    for n in 1...24 {
        ref.child("Parking").child("\("Spot"), \(n)").setValue(["Car": nil])
        
    }
    
}

func addcar(carname: String, carpos: Int){
    ref.child("Car Name").child(carname).child("pos").setValue(carpos)
    ref.child("Parking").child("\("Spot"), \(carpos)").setValue(["Car": carname])
}

func removecar(carname: String){
    var refHandle1 = ref.child("Car Name").child(carname).child("pos").observe(DataEventType.value, with: { (snapshot) in
        let postDict = snapshot.value as? [Int : AnyObject] ?? [:]
        // ...
    })
    
  ref.child("Parking").child("\("Spot"), \(refHandle1)").setValue(["Car": nil])
  ref.child("Car Name").child(carname).child("pos").setValue(nil)
    
    
}

func removecarbypos(carpos: Int){
    var refHandle1 = ref.child("Parking").child("\("Spot"), \(carpos)").child("Car").observe(DataEventType.value, with: { (snapshot) in
        let postDict = snapshot.value as? [Int : AnyObject] ?? [:]
        // ...
    })
    
    ref.child("Parking").child("\("Spot"), \(carpos)").setValue(["Car": nil])
    //ref.child("Car Name").child(refHandle1).child("pos").setValue(nil)
    
    
}

func checkForCar(position: String) -> Bool {
    
    var refHandle = ref.child("Parking").child(position).child("Car").observe(DataEventType.value, with: { (snapshot) in
        let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        // ...
        
    })
    
    if(refHandle == nil){
        return false
    }
    else{
        return true
    }
}
class firebase: UIViewController {

   
    

    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    /*
    // MARK: - Navigation
9lo90989kii.lop0--------------------9877888888887
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
