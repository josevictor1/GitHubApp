//
//  UIImage+ImageDownloader.swift
//  ImageDownloader
//
//  Created by José Victor Pereira Costa on 27/01/21.
//

import UIKit

public extension UIImageView {
    private static let imageDownloader = ImageDownloader()
    
    func loadImage(forULR url: String, placeHolder: UIImage, withAnimation animation: Bool = true) {
        image = placeHolder
        loadImage(forURL: url, withAnimation: animation)
    }
    
    private func loadImage(forURL url: String, withAnimation animation: Bool) {
        DispatchQueue.global(qos: .background).async {
            UIImageView.imageDownloader.loadImage(fromURL: url) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        self?.setImage(image, withAnimation: animation)
                    case .failure:
                        break
                    }
                }
            }
        }
    }
    
    private func setImage(_ image: UIImage, withAnimation animation: Bool) {
        if animation {
            setImageWithAnimation(image)
        } else {
            setImageWithoutAnimation(image)
        }
    }
    
    private func setImageWithAnimation(_ image: UIImage) {
        UIView.transition(with: self,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.image = image })
    }
    
    private func setImageWithoutAnimation(_ image: UIImage) {
        self.image = image
    }
}
