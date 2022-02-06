//
//  ViewController.swift
//  FireBaseApp
//
//  Created by Agustin Chinchilla on 31/01/2022.
//

import UIKit
import FirebaseAuth
import Foundation

class AuthViewController: UIViewController {

    
    @IBOutlet weak var emailTexField: UITextField!
    @IBOutlet weak var passwordTextFild: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButtonAction(_ sender: Any) {
        if let email = emailTexField.text , let password = passwordTextFild.text {
            Auth.auth().createUser(withEmail: email, password: password){ (result , error) in
                self.userProcessPresenter(result: result,error: error)
            }
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if let email = emailTexField.text , let password = passwordTextFild.text {
            Auth.auth().signIn(withEmail: email, password: password){ (result , error) in
                    self.userProcessPresenter(result: result,error: error)  
            }
        }
    }
    
    func userProcessPresenter(result:AuthDataResult?, error:Error?){
       if let  result = result{
            self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
        }else{
            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }

    
}

