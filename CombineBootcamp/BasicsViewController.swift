//
//  ViewController.swift
//  CombineBootcamp
//
//  Created by Marco Alonso Rodriguez on 27/03/23.
//

import UIKit
import Combine

class StringSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3))
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
    
    
    
    func receive(_ input: Input) -> Subscribers.Demand {
        print("Received Value: \(input)")
        return .unlimited
//        return .none
    }
}

typealias Input = String
typealias Failure = Never

class BasicsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        implementingSubscriber()
        
//        publisherAndSubscriber()
//        sinkMethod()
    }
    
    func implementingSubscriber() {
        let publiser = ["A","B","C","D","E","F"].publisher
        
        let subscriber = StringSubscriber()
        
        publiser.subscribe(subscriber)
    }
    
    func sinkMethod() {
        let notification = Notification.Name("MyNotification")
        let publisher = NotificationCenter.default.publisher(for: notification)
        
        let subscription = publisher.sink { _ in
            print("Notification Received")
        }
        NotificationCenter.default.post(name: notification, object: nil)
        
        subscription.cancel()
        
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

