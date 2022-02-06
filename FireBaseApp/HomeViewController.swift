//
//  HomeViewController.swift
//  FireBaseApp
//
//  Created by Agustin Chinchilla on 31/01/2022.
//

import UIKit
import FirebaseAuth

enum ProviderType:String{
    case basic
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var SignOutButton: UIButton!
    
    private let email:String
    private let provider:ProviderType
    
    init(email:String, provider:ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailLabel.text = email
        self.providerLabel.text = provider.rawValue
    }
    
    
    @IBAction func signOutAppAction(_ sender: Any) {
         
        switch provider {
        case .basic:
            do{
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch{
                print(error)
            }
        }
    }
    

}
