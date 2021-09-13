//
//  LoadingIndicator.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 12/09/2021.
//

import Foundation
import SVProgressHUD

class LoadingIndicator {
    static let shared = LoadingIndicator()
    
    func showLoading() {
        SVProgressHUD.show()
    }
    func hideLoading() {
        SVProgressHUD.dismiss()
    }

}

func appLoader()->LoadingIndicator{
    return LoadingIndicator.shared
}
