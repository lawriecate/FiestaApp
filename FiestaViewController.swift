//
//  FiestaViewController.swift
//  MapsEjemplo
//
//  Created by Lawrie Cate on 14/02/2017.
//  Copyright © 2017 LawrieCate. All rights reserved.
//

import UIKit
import MapKit

class FiestaViewController: UIViewController  {

    @IBOutlet weak var fiestaTitle: UILabel!
    var fiesta:Fiesta!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // fiestaTitle.text = (viaSegue.annotation?.title)!
       //
   //     print(fiesta.title)
        navigationItem.title = fiesta.title
         self.fiestaTitle.text = String(fiesta.coordinate.latitude) + "\n" + String(fiesta.coordinate.longitude)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
