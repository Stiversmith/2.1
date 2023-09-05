//
//  SignInVC.swift
//  SignInApp1.0
//
//  Created by Aliaksandr Yashchuk on 8/25/23.
//

import UIKit

class SignInVC: BaseViewController {
    
    @IBOutlet weak var emailTf1: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var errorLbl: UILabel!{
        didSet {errorLbl.isHidden = true}
    }
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = UserDefaultsService.getUserModel() {
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        emailTf1.text = ""
        passwordTf.text = ""
    }
    
    @IBAction func signInBtb() {
        guard let email = emailTf1.text,
              !email.isEmpty,
              let pass = passwordTf.text,
              !pass.isEmpty,
              let userModel = UserDefaultsService.getUserModel(),
              email == userModel.email,
              pass == userModel.pass
        else {
            errorLbl.isHidden = false
            return
        }
        performSegue(withIdentifier: "goMain", sender: UserDefaultsService.getUserModel())
    }
    
    private func goToTabBarController() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           guard let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController
        else { return }
           navigationController?.pushViewController(vc, animated: true)
       }
    
//    private func setupUI() {
//        signInBtn.isEnabled = true
//    }
}
    
    
    
  
    

