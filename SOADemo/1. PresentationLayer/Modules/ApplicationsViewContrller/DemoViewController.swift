//
//  ViewController.swift
//  SOADemo
//
//  Created by a.y.zverev on 12.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import UIKit
import PKHUD
import Kingfisher

enum StoreSegments: Int {
    case newApps = 0
    case topTracks
}

class DemoViewController: UIViewController, IDemoModelDelegate, UITableViewDataSource, UITableViewDelegate {

    // UI
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    // Dependencies
    private let presentationAssembly: IPresentationAssembly
    private let model: IDemoModel

    // DeisplayModel
    private var dataSource: [CellDisplayModel] = []
    
    init(model: IDemoModel, presentationAssembly: IPresentationAssembly) {
        self.model = model
        self.presentationAssembly = presentationAssembly
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureSegmentCotnrol()
    }
    
    // MARK: - IDemoModelDelegate
    
    func setup(dataSource: [CellDisplayModel]) {
        self.dataSource = dataSource

        DispatchQueue.main.async {
            HUD.flash(.success, onView: self.view)
            self.tableView.reloadData()
        }
    }
    
    func show(error message: String) {
        DispatchQueue.main.async {
            HUD.flash(.labeledError(title: message, subtitle: nil), onView: self.view)
        }
    }

    // MARK: - Private methods
    
    private func configureSegmentCotnrol() {
        let items = ["New Apps", "Top Tracks"]
        segmentControl.removeAllSegments()
        items.forEach({
            self.segmentControl.insertSegment(withTitle: $0,
                                              at: self.segmentControl.numberOfSegments,
                                              animated: false)
        })
        segmentControl.selectedSegmentIndex = 0
        segmentControlAction(segmentControl)
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
    }
    
    // MARK: - IB ACTIONS
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        guard let segmentIndex = StoreSegments(rawValue: sender.selectedSegmentIndex) else {
            assertionFailure("unknown segment index: \(sender.selectedSegmentIndex)")
            return
        }
        
        HUD.show(.progress, onView: view)
        switch segmentIndex {
        case .newApps:
            model.fetchNewApps()
        case .topTracks:
            model.fetchTopTracks()
        }
    }
    
    // MARK: - Table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].title
        
        if let imageView = cell.imageView,
            let url = URL(string: dataSource[indexPath.row].imageUrl) {
            imageView.kf.setImage(with: url,
                                  placeholder: UIImage(named: "placeholder"),
                                  options: nil,
                                  progressBlock: nil,
                                  completionHandler: nil)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pinguinViewController = presentationAssembly.pinguinViewController()
        self.navigationController?.pushViewController(pinguinViewController, animated: true)
    }
}

