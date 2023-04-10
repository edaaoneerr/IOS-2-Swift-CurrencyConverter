//
//  ViewController.swift
//  currency-converter
//
//  Created by Edanur Oner on 11.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cad: UILabel!
    
    @IBOutlet weak var chf: UILabel!
    
    @IBOutlet weak var gbp: UILabel!
    
    @IBOutlet weak var jpy: UILabel!
    
    @IBOutlet weak var usd: UILabel!
    
    @IBOutlet weak var TRY: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        let url =  URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) {
            (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
            else {
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)as! Dictionary<String, Any>
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String: Any]{
                                if let cad = rates["CAD"] as? Double {
                                                                    self.cad.text = "CAD: \(cad)"
                                                                }
                                                                
                                                                if let chf = rates["CHF"] as? Double {
                                                                    self.chf.text = "CHF: \(chf)"
                                                                }
                                                                
                                                                if let gbp = rates["GBP"] as? Double {
                                                                    self.gbp.text = "GBP: \(gbp)"
                                                                }
                                                                
                                                                if let jpy = rates["JPY"] as? Double {
                                                                    self.jpy.text = "JPY: \(jpy)"
                                                                }
                                                                
                                                                if let usd = rates["USD"] as? Double {
                                                                    self.usd.text = "USD: \(usd)"
                                                                }
                                                                
                                                                if let turkish = rates["TRY"] as? Double {
                                                                    self.TRY.text = "TRY: \(turkish)"
                                                                }
                                    
                            }
                        }
                        
                    }
                    catch {
                        print("Error")
                    }
                }
            }
            
        }
        task.resume()
    }
    
    
}

