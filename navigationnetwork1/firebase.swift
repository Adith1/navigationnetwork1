//
//  firebase.swift
//  navigationnetwork1
//
//  Created by Adith Sundram on 5/25/19.
//  Copyright © 2019 Adith Sundram. All rights reserved.
//

import UIKit
import Firebase
class firebase: UIViewController {

    var ref: DatabaseReference! = Database.database().reference()
    

    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func createParkingSpots(){
        
        for n in 1...3 {
            for i in 1...8 {
                self.ref.child("Parking").child("\("Spot"), \(n),\(i)").setValue(["Car": nil])
            }
        }
        
    }
    
    func addcar(carname: String, carxpos: Int, carypos:Int){
        self.ref.child("Car Name").child(carname).child("xpos").setValue(carxpos)
        self.ref.child("Car Name").child(carname).child("ypos").setValue(carypos)
        self.ref.child("Parking").child("\("Spot"), \(carxpos),\(carypos)").setValue(["Car": carname])
    }
    
    func removecar(carname: String){
        var refHandle1 = ref.child("Car Name").child(carname).child("xpos").observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [Int : AnyObject] ?? [:]
            // ...
        })
        var refHandle2 = ref.child("Car Name").child(carname).child("ypos").observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [Int : AnyObject] ?? [:]
            // ...
        })
        self.ref.child("Parking").child("\("Spot"), \(refHandle1),\(refHandle2)").setValue(["Car": nil])
        self.ref.child("Car Name").child(carname).child("ypos").setValue(nil)
        self.ref.child("Car Name").child(carname).child("xpos").setValue(nil)
 
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
