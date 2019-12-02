//
//  ViewController.swift
//  JSON2-Swift-Demo
//
//  Created by Ermias Ghebrezgiabiher on 11/27/19.
//  Copyright © 2019 Ermias Ghebrezgiabiher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.duckduckgo.com/?q=simpsons+characters&format=json")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let relatedTopics = myJson["RelatedTopics"] as? NSArray
                        {
//                            let firstContent = [relatedTopics[0]]
                            print(relatedTopics[0]) as? String
                            
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

