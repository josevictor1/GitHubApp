//
//  GetFollowersViewMock.swift
//  GetFollowersTests
//
//  Created by José Victor Pereira Costa on 14/01/21.
//  Copyright © 2021 José Victor Pereira Costa. All rights reserved.
//

import XCTest
@testable import GetFollowers

final class GetFollowersViewMock: UIView, GetFollowersViewProtocol {
    weak var delegate: GetFollowersViewDelegate?
    var scrollUpCalled = false
    
    func scrollUpGetFollowersButton(at height: CGFloat) {
        scrollUpCalled = true
    }
    
    func getFllowersButtonTapped() {
        delegate?.viewController(didSelectFollower: "test")
    }
}
