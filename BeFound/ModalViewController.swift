//
//  ModalViewController.swift
//  BeFound
//
//  Created by Jordan Hubbard on 4/20/17.
//  Copyright © 2017 dev. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var city: UILabel!
    
    var shelter = Int()
    let shelters = Shelter.getShelters()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
        self.name.text = shelters[shelter].title
        self.phone.text = shelters[shelter].phone
        self.hours.text = shelters[shelter].hours
        self.street.text = shelters[shelter].street1
        self.city.text = shelters[shelter].city
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.view.removeFromSuperview()
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
