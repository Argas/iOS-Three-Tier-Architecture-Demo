//
//  ViewController.swift
//  SOADemo
//
//  Created by a.y.zverev on 12.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import UIKit
import PKHUD

enum StoreSegments: Int {
    case new = 0
    case topFree
    case topPaid
}

class DemoViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: [CellDisplayModel] = []
    private let model: IDemoModel
    
    init(model: IDemoModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        
    }

    private func dataSourceLoaded(dataSource: [CellDisplayModel]?, error: String?) {
        DispatchQueue.main.async {
            HUD.flash(.success, onView: self.view)
            self.dataSource = dataSource ?? []
            dataSource?.forEach({ print($0.title )})
        }
    }

    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        guard let segmentIndex = StoreSegments(rawValue: sender.selectedSegmentIndex) else {
            assertionFailure("unknown segment index: \(sender.selectedSegmentIndex)")
            return
        }
        
        HUD.show(.progress, onView: view)
        switch segmentIndex {
        case .new:
            model.fetchNewApps(completionHandler: dataSourceLoaded)
        case .topFree:
            model.fetchNewApps(completionHandler: dataSourceLoaded)
        case .topPaid:
            model.fetchTopTracks(completionHandler: dataSourceLoaded)
        }
    }
}

