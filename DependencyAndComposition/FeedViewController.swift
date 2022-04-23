//
//  FeedViewController.swift
//  DependencyAndComposition
//
//  Created by Jigneshkumar Patil on 2022/04/23.
//

import UIKit

protocol FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void)
}

class FeedViewController: UIViewController {

    var loader: FeedLoader!
    
    convenience init (loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader.loadFeed { loadedItems in
            // update UI
        }
    }
}

class RemoteFeedLoader : FeedLoader {
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // do something here
    }
}
