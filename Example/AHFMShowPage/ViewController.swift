//
//  ViewController.swift
//  AHFMShowPage
//
//  Created by Andy Tong on 10/6/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import AHServiceRouter

import AHFMDownloadListManager
import AHFMAudioPlayerVCManager
import AHFMEpisodeListVCManager
import AHFMHistoryVCManager
import AHFMAudioPlayerManager
import AHFMBottomPlayerManager
import AHFMAudioPlayerManager
import AHFMShowPageManger
import AHFMDownloadCenterManager
import AHFMDownloaderManager

import AHFMBottomPlayerServices
import AHFMShowPageServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AHFMDownloadListManager.activate()
        AHFMAudioPlayerVCManager.activate()
        AHFMEpisodeListVCManager.activate()
        AHFMHistoryVCManager.activate()
        AHFMAudioPlayerManager.activate()
        AHFMBottomPlayerManager.activate()
        AHFMAudioPlayerManager.activate()
        AHFMShowPageManger.activate()
        AHFMDownloadCenterManager.activate()
        AHFMDownloaderManager.activate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dict: [String: Any] = [AHFMBottomPlayerServices.keyShowPlayer: true, AHFMBottomPlayerServices.keyParentVC: self]
        AHServiceRouter.doTask(AHFMBottomPlayerServices.service, taskName: AHFMBottomPlayerServices.taskDisplayPlayer, userInfo: dict, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let info: [String : Any] = [AHFMShowPageServices.keyShowId: 722]
        AHServiceRouter.navigateVC(AHFMShowPageServices.service, taskName: AHFMShowPageServices.taskNavigation, userInfo: info, type: .push(navVC: self.navigationController!), completion: nil)
    }
    
}
