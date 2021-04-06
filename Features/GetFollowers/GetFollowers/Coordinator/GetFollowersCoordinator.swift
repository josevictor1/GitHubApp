//
//  GetFollowersCoordinator.swift
//  SearchFollowers
//
//  Created by José Victor Pereira Costa on 27/03/20.
//  Copyright © 2020 José Victor Pereira Costa. All rights reserved.
//

import Foundation
import Commons
import Core
import UIKit

public protocol GetFollowersCoordinatorDelegate: AnyObject {
    func getFollowersDidOpenUserInformation(withLogin login: String)
}

public final class GetFollowersCoordinator: NavigationCoordinator {
    public var parent: Coordinator?
    public var children: [Coordinator] = []
    public var navigationController: UINavigationController?
    public weak var delegate: GetFollowersCoordinatorDelegate?

    public required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {
        navigateToGetFollowers()
        setUpNavigationLayout()
    }

    private func setUpNavigationLayout() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .chateauGreen
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func navigateToGetFollowers() {
        let viewController: GetFollowersViewController = .makeGetFollowers(delegate: self)
        navigationController?.pushViewController(viewController, animated: false)
    }

    func navigateToFollowers(with userFollowers: UserInformation) {
        let viewController: FollowersCollectionViewController = .makeFollowers(with: userFollowers, coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToUserInformation(with follower: String) {
        delegate?.getFollowersDidOpenUserInformation(withLogin: follower)
    }
    
    func reloadFollowers(withLogin login: String) {
        let viewController = navigationController?.topViewController
        guard let followersViewController = viewController as? FollowersCollectionViewController else { return }
        
    }
}
