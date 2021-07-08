//
//  ViewController.swift
//  SignUpGit
//
//  Created by PSJ on 2021/07/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let id: String = UserInformation.shared.id {
            idTextField?.text = id
        }
    }
    
    @IBAction func touchUpSignUp()
    {
        informationReset()
    }
    
    func informationReset() {
        UserInformation.shared.image = nil
        UserInformation.shared.id = nil
        UserInformation.shared.pw = nil
        UserInformation.shared.intro = nil
        UserInformation.shared.phoneNumber = nil
        UserInformation.shared.date = nil
    }
}

