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
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var container: UIView!
    
    var shelter: Shelter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        view.isOpaque = false
        
        self.name.text = self.shelter.title!
        self.phone.text = self.shelter.phone!
        self.hours.text = self.shelter.hours!
        self.street.text = self.shelter.street1!
        self.city.text = self.shelter.city!
        
        self.closeBtn.layer.cornerRadius = 5
        self.container.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.viewDidAppear(animated)
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
