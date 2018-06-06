//
//  MasterViewController.swift
//  SplitViewByhehe
//
//  Created by nguyễn hữu đạt on 5/31/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var filtered : [Model] = []

    @IBAction func buttonAdd(_ sender: UIBarButtonItem) {
        let getdata = "hehe"
        let getPhoto = "http://streaming1.danviet.vn/upload/4-2016/images/2016-10-10/147608135456731-jang-mi-16.jpg"
        DataService.share.nyc.append(Model(data: getdata, photo: getPhoto))
        filtered = DataService.share.nyc
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .bottom)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtered = DataService.share.nyc
        self.splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.automatic
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detaiViewController = (segue.destination as? UINavigationController)?.topViewController as? DetailViewController{
            if let indexpath = tableView.indexPathForSelectedRow{
                detaiViewController.index = indexpath.row
            }
        }
        
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NYCTableViewCell
        if cell.dateLabel != nil{
        
            cell.dateLabel.text = filtered[indexPath.row].data
            cell.photo.download(from: filtered[indexPath.row].photo)
        }
        return cell
    
    }
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            filtered.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

