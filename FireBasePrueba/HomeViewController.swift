//
//  HomeViewController.swift
//  FireBasePrueba
//
//  Created by Tardes on 10/1/25.
//

import UIKit
import FirebaseAuth

enum ProviderType:String{
    case basic
}

class HomeViewController: UIViewController {

    @IBOutlet weak var UserLabel: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var CloseButton: UIButton!
    
    private let email:String
    private let provider:ProviderType
    
    
    init(email:String, provider:ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserLabel.text = email
        PasswordLabel.text = provider.rawValue

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CloseSession(_ sender: Any) {
        
        switch provider{
            
        case .basic:
            do{
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch{
                
            }
        }
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
