//
//  LoginViewController.swift
//  Quantum IT Project
//
//  Created by Sneh on 20/09/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var enterEmail: UITextField!
    
    
    @IBOutlet weak var enterPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if let email = enterEmail.text ,  let password = enterPassword.text{
            
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error{
                    print (e)
                    
                }else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)


                }

            }
            
            func showError(message: String){
                
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
