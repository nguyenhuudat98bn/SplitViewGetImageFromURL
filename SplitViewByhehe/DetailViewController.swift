//
//  DetailViewController.swift
//  SplitViewByhehe
//
//  Created by nguyễn hữu đạt on 5/31/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIImagePickerControllerDelegate,UIScrollViewDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var index : Int?
    var dataService = DataService.share
    var monster: Model? {
        didSet {
            refreshUI()
        }
    }

    func configureView() {
       scrollView.delegate = self
        scrollView.maximumZoomScale = 8
        scrollView.minimumZoomScale = 1
        if let indexx = index{
            
            nameLabel.text = dataService.nyc[indexx].data
            imageView.download(from: dataService.nyc[indexx].photo)
        }
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancel(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MasterViewController") as! MasterViewController
        navigationController?.pushViewController(vc, animated: true)
//        navigationController?.pushViewController(vc, animated: true)
    }
    func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = monster?.data
        
    }

    
}


