//
//  LoginViewController.swift
//  FiscalResponsibility
//
//  Created by Jonson Jin on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBAction func userLogin(_ sender: UIButton) {
        if username.text == "User" && password.text == "Pass" {
            performSegue(withIdentifier: "loginSegue", sender: sender)
        }
        else {
            labelMessage.text = "Invalid username or password"
        }
        
    }
    
    @IBAction func overrideLoging(_ sender: UIButton) {
		//MerchantRequest().getMerchants(<#T##geocode: Geocode?##Geocode?#>, rad: <#T##String?#>, completion: <#T##(Array<Merchant>?, NSError?) -> Void#>)
		
		
		func testGetMerchants() {
			MerchantRequest().getMerchants(completion: {(response, error) in
				
				if (error != nil) {
					print(error!)
				} else {
					if let array = response as Array<Merchant>? {
						var mlist = [String]()
						if array.count > 0 {
							let merchant = array[0] as Merchant?
						//	self.testGetMerchant(merchantId: merchant!.merchantId)
							for merch in array{
								if merch.category.count > 0{
									if !(mlist.contains(merch.category[0])){
									mlist.append(merch.category[0])
									}
								}
								
								
							}
							print(mlist)
						} else {
							print("No merchants found")
						}
					}
				}
			})
		}
		
		testGetMerchants()
		
		
//        let acctId = "5a563d195eaa612c093b0af6"
//        let merchId = "57cf75cea73e494d8675ec49" //Apple Merchant ID
//        AccountRequest().getAccount(acctId, completion: { (account, error) in
//            if let error = error{
//                print("There is an error: " + error.localizedFailureReason!)
//
//            }
//            else if let account = account {
//                print(account.nickname)
//                print()
//            }
//                    })
//
//
//
//        MerchantRequest().getMerchant(merchId) { (merchant, error) in
//            if let error = error {
//                print("There is an error: " + error.localizedFailureReason!)
//            }
//            else if let merchant = merchant{
//                let str = ""
//                for cat in merchant.category {
//
//                }
//                print("Merchant's Name:" + merchant.name)
//                print("Merchant's Address:" + merchant.address.streetNumber + merchant.address.streetName + merchant.address.city)
//                print("Merchant's Category:" + merchant.category[0])
//                print("Merchant's Geocode: \(merchant.geocode.lat) , \(merchant.geocode.lng)")
//                print("Merchant's Merchant ID:" + merchant.merchantId)
//            }
//        }
		

    
        
        
        
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
