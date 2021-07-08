//
//  UserInfomation.swift
//  SignUpGit
//
//  Created by PSJ on 2021/07/08.
//

import Foundation
import UIKit

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var image: UIImage?
    var id: String?
    var pw: String?
    var intro: String?
    
    var phoneNumber: String?
    var date: Date?
    
}
