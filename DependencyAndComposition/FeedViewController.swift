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

// This will fetch data from cache or json file when there is no internet
class LocalFeedLoader : FeedLoader {
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // do something here
    }
}


struct Reachability {
    static let networkAvailable = false
}

class RemoveWithLocalFallbackFeedLoader : FeedLoader {
    let remote: RemoteFeedLoader
    let local: LocalFeedLoader
    
    init(remote: RemoteFeedLoader, local: LocalFeedLoader){
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        let load = Reachability.networkAvailable ?
            remote.loadFeed: local.loadFeed
        load(completion)
    }
}
