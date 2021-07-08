//
//  ThirdViewController.swift
//  SignUpGit
//
//  Created by PSJ on 2021/07/08.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberField: UITextField?
    
    @IBOutlet weak var datePicker: UIDatePicker?
    @IBOutlet weak var dateLabel: UILabel?
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBOutlet weak var joinButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        informationView()
    }
    
    @IBAction func phoneNumberValueChanged(_ sender: UITextField)
    {
        UserInformation.shared.phoneNumber = sender.text
        informationView()
    }
    
    @IBAction func dataPickerValueChanged(_sender: UIDatePicker)
    {
        UserInformation.shared.date = _sender.date
        informationView()
    }
    
    @IBAction func touchUpCancle() {
        informationReset()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpJoin() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func fillCheck() -> Bool {

        guard UserInformation.shared.phoneNumber != nil else {
            print("phonenumber empty")
            return false
        }
        
        guard UserInformation.shared.date != nil else {
            print("date empty")
            return false
        }

        return true
    }
    
    func joinButtonStateChange(_ state: Bool) {
        self.joinButton?.isEnabled = state
    }
    
    func informationView() {

        if let phoneNumber = UserInformation.shared.phoneNumber {
            self.phoneNumberField?.text = phoneNumber
        }
        
        if let date = UserInformation.shared.date {
            self.datePicker?.date = date
            let dateString: String = self.dateFormatter.string(from: date)
            
            self.dateLabel?.text = dateString
        }

        
        let state = fillCheck()
        joinButtonStateChange(state)
    }
    
    func informationReset() {
        UserInformation.shared.image = nil
        UserInformation.shared.id = nil
        UserInformation.shared.pw = nil
        UserInformation.shared.intro = nil
        UserInformation.shared.phoneNumber = nil
        UserInformation.shared.date = nil
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
