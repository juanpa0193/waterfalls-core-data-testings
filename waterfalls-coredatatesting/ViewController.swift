//
//  ViewController.swift
//  waterfalls-coredatatesting
//
//  Created by JuanPa Villa on 7/18/16.
//  Copyright © 2016 JuanPa Villa. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var waterfalls = [Waterfalls]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        fetchAndSetResults()
        tableView.reloadData()
        
    }
    
    
    func fetchAndSetResults() {
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Waterfalls")
        
        //because a fetch requet may fail, we need to make a do block to catch the problem
        
        do {
            
            let results = try context.executeFetchRequest(fetchRequest)
            self.waterfalls = results as! [Waterfalls]
            
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return waterfalls.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("WaterfallCell") as? WaterfallCell {
            
            let waterfall = waterfalls[indexPath.row]
            cell.configureCell(waterfall)
            
            return cell
        } else {
            return WaterfallCell()
        }
        
    }
    
    


}

