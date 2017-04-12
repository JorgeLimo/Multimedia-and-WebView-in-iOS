//
//  WebViewViewController.swift
//  Multimedia
//
//  Created by Alumno on 11/04/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var web: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //let url = URL(string: "https://www.ourlimm.com/")
        //let request = URLRequest(url: url!)
        
        //cargar html
        //var htmlString = "<h1>HolamuNDO</h1>"
        //web.loadHTMLString(htmlString, baseURL: <#T##URL?#>)
        
        //web.loadRequest(request)
       
        
        //HTML Local
        
        let path = Bundle.main.path(forResource: "hola.html", ofType: nil)
        
        let url2 = URL(fileURLWithPath : path!)
        
        let requests2 = URLRequest(url: url2)
        
        web.loadRequest(requests2s2)
        
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
