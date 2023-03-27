//
//  ViewController.swift
//  CombineBootcamp
//
//  Created by Marco Alonso Rodriguez on 27/03/23.
//

import UIKit

class BasicsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        publisherAndSubscriber()
    }

    func publisherAndSubscriber() {
        let notification = Notification.Name("MyNotification")
        
        let center = NotificationCenter.default
        
        let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
            print("Notification received!")
        }
        
        ///Send notification
        center.post(name: notification, object: nil)
        
        ///Remove observer
        center.removeObserver(observer)
    }

}

