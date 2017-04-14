//
//  ViewController.swift
//  SOADemo
//
//  Created by a.y.zverev on 12.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private let model: IDemoModel = DemoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.loadNewApps { (apps, error) in
            apps?.forEach({ print($0.title )})
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

