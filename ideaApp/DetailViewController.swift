//
//  DetailViewController.swift
//  ideaApp
//
//  Created by Omar Baradei on 1/21/17.
//  Copyright © 2017 Omar Baradei. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBAction func returnToIdeas(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
