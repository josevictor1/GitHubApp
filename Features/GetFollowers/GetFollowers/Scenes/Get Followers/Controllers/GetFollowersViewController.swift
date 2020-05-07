//
//  GetFollowersViewController.swift
//  GitHub
//
//  Created by José Victor Pereira Costa on 26/02/20.
//  Copyright © 2020 José Victor Pereira Costa. All rights reserved.
//

import UIKit
import Commons

protocol GetFollowersViewControllerDelegate: AnyObject {

    /// Method called when `GetFollowersViewController` finishes to fetch users.
    /// - Parameter user: User fetched
    func viewControllerDidGotFollowers(_ followers: [Follower])
}

class GetFollowersViewController: UIViewController {

    // MARK: - Properties

    var logicController: GetFollowersLogicProtocol?
    var presenter: GetFollowersAlertPresenterProtocol?
    weak var delegate: GetFollowersViewControllerDelegate?

    private lazy var getFollowersView: GetFollowersView = {
        let view = GetFollowersView()
        view.onGetFollowersButtonTapped = onGetFollowersButtonTapped
        return view
    }()

    // MARK: - Actions

    lazy var onGetFollowersButtonTapped: ((String?) -> Void) = { [unowned self] username in
        self.fetchUser(with: username)
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = getFollowersView
    }

    // MARK: - Business Logic

    private func fetchUser(with username: String?) {
        
        guard let username = username, !username.isEmpty else { return }
        
        logicController?.getFollowers(of: username) { [unowned self] result in
            switch result {
            case .success(let followers):
                self.delegate?.viewControllerDidGotFollowers(followers)
            case .failure(let error):
                self.presenter?.present(error)
            }
        }
    }
}

extension GetFollowersViewController {

    static func makeGetFollowers() -> GetFollowersViewController {
        let viewController = GetFollowersViewController()
        viewController.presenter = GetFollowersAlertPresenter(viewController: viewController)
        return viewController
    }
}
