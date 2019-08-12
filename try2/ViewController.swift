//
//  ViewController.swift
//  try2
//
//  Created by user157026 on 8/12/19.
//  Copyright © 2019 user157026. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getContactsData()
    }
    
    func getContactsData(){
        Alamofire.request("https://api.barcodelookup.com/v2/products?barcode=9780140157376&formatted=y&key=7iyoqlxypi5zxw3j3penn7o868admm",method: .get).responseJSON {
            response in
            if response.result.isSuccess
            {
                print("Success")
                let jsonObject: JSON = JSON(response.result.value!)
                //     print(jsonObject)
                if let storesArray = jsonObject["products"][0]["stores"].array {
                    for i in 0...(storesArray.count-1) {
                        var store_price = storesArray[i]["store_price"]
                        print(store_price)
                    }
                }
            }
                /*
                 if let jsonArray = jsonObject["contacts"].array{
                 
                 var mobiles = [String]()
                 for i in 0...(jsonArray.count-1) {
                 // in each person
                 var mobile = jsonArray[i]["phone"]["mobile"];
                 print(mobile)
                 
                 }
                 }
                 }
                 */
                
                
                
            else {
                print("Error \(response.result.error)")
            }
            
            
        }
    }
    
}
