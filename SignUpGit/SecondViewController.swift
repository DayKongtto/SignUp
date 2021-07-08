//
//  SecondViewController.swift
//  SignUpGit
//
//  Created by PSJ on 2021/07/08.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var idTextField: UITextField?
    @IBOutlet weak var pwTextField: UITextField?
    @IBOutlet weak var pwConfirmTextField: UITextField?
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var introTextView: UITextView?
    
    @IBOutlet weak var nextButton: UIButton?
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        informationView()
    }
    
    @IBAction func idEditingEnd(_ sender: UITextField)
    {
        UserInformation.shared.id = sender.text
        informationView()
    }
    
    @IBAction func pwEditingEnd(_ sender: UITextField)
    {
        UserInformation.shared.pw = sender.text
        informationView()
    }
    
    @IBAction func pwConfirmEditingEnd(_ sender: UITextField)
    {
        informationView()
    }
    
    @IBAction func touchUpCancle() {
        informationReset()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSelectImageView(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            UserInformation.shared.image = originalImage
            informationView()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func fillCheck() -> Bool {

//        guard UserInformation.shared.image != nil else {
//            return false
//        }

        guard UserInformation.shared.id != nil else {
            return false
        }
        
        guard UserInformation.shared.pw != nil else {
            return false
        }
        
        guard self.pwConfirmTextField?.text != nil else {
            return false
        }

//        guard UserInformation.shared.intro != nil else {
//            return false
//        }

        if let pw: String = UserInformation.shared.pw {
            if pw != pwConfirmTextField?.text {
                return false
            }
        }

        return true
    }
    
    func nextButtonStateChange(_ state: Bool) {
        self.nextButton?.isEnabled = state
    }
    
    func informationView() {
        if let image = UserInformation.shared.image {
            self.imageView?.image = image
        }

        if let id = UserInformation.shared.id {
            self.idTextField?.text = id
        }

        if let pw = UserInformation.shared.pw {
            self.pwTextField?.text = pw
            //self.pwConfirmTextField?.text = pw
        }

        if let intro = UserInformation.shared.intro {
            self.introTextView?.text = intro
        }
        
        let state = fillCheck()
        nextButtonStateChange(state)
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
