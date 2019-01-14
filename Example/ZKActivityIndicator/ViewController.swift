//
//  ViewController.swift
//  ZKActivityIndicator
//
//  Created by Nice on 01/14/2019.
//  Copyright (c) 2019 Nice. All rights reserved.
//

import UIKit
import ZKActivityIndicator
class ViewController: UIViewController {

    var activity  = ZKActivityIndicator()
    //var activity  = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorView.Style.whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(start)))
        activity.hidesWhenStopped = true
        activity.center = view.center
        view.addSubview(activity)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute:{
            self.activity.startAnimating()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute:{
//                self.activity.hidesWhenStopped = false
//                self.activity.stopAnimating()
//
//            })
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func start() -> Void {
        self.activity.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute:{
            self.activity.hidesWhenStopped = true
            self.activity.stopAnimating()
            
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

