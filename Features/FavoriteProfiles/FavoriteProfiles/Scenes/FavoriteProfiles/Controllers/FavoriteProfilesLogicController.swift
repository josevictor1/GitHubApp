//
//  FavoriteProfilesLogicController.swift
//  FavoriteProfiles
//
//  Created by José Victor Pereira Costa on 03/06/21.
//  Copyright © 2021 José Victor Pereira Costa. All rights reserved.
//

import Commons

protocol FavoriteProfilesLogicControllerProtocol {
    func loadProfiles()
    func add(selectedUser: SelectedUserInformation)
    func deleteProfile(atIndex index: Int)
    func searchProfile(byFilter filter: String)
}

protocol FavoriteProfilesLogicControllerOutput {
    func didUpdateFavoriteProfiles(_ favoriteUserProfiles: [FavoriteProfile])
    func didFailOnUpdateFavoriteProfiles()
}

final class FavoriteProfilesLogicController: FavoriteProfilesLogicControllerProtocol {
    
    var viewController: FavoriteProfilesLogicControllerOutput?
    private var favoriteProfiles = [FavoriteProfile]()
    private let provider: FavoriteProfilesProvider
    
    init(provider: FavoriteProfilesProvider) {
        self.provider = provider
    }
    
    func loadProfiles() {
        provider.loadProfiles { [weak self] result in
            switch result {
            case .success(let profiles):
                self?.updateFavoriteProfiles(profiles)
            case .failure:
                self?.handleLoadProfileFailure()
            }
        }
    }
    
    private func updateFavoriteProfiles(_ profiles: [FavoriteProfile]) {
        favoriteProfiles = profiles
        viewController?.didUpdateFavoriteProfiles(profiles)
    }
    
    private func handleLoadProfileFailure() {
        viewController?.didFailOnUpdateFavoriteProfiles()
    }
    
    func add(selectedUser: SelectedUserInformation) {
        let favoriteProfile = FavoriteProfile(selectedUser: selectedUser)
        favoriteProfiles.append(favoriteProfile)
        viewController?.didUpdateFavoriteProfiles(favoriteProfiles)
    }
    
    func deleteProfile(atIndex index: Int) {
        guard !favoriteProfiles.isEmpty,
              favoriteProfiles.count > index else { return }
        favoriteProfiles.remove(at: index)
        viewController?.didUpdateFavoriteProfiles(favoriteProfiles)
    }
    
    func searchProfile(byFilter filter: String) {
        let filteredProfiles = filterProfiles(byFilter: filter)
        viewController?.didUpdateFavoriteProfiles(filteredProfiles)
    }
    
    private func filterProfiles(byFilter filter: String) -> [FavoriteProfile] {
        favoriteProfiles.filter {
            $0.name.contains(filter) || $0.login.contains(filter)
        }
    }
}

