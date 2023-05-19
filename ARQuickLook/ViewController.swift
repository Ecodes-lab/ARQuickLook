//
//  ViewController.swift
//  ARQuickLook
//
//  Created by Eco Dev System on 19/05/2023.
//

import UIKit
import QuickLook

class ViewController: UIViewController {
    
    @IBOutlet weak var panelImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentQuicklook))
        panelImage.addGestureRecognizer(tapGesture)
    }

    @objc func presentQuicklook() {
        let previewViewController = QLPreviewController()
        previewViewController.dataSource = self
        previewViewController.delegate = self
        present(previewViewController, animated: true, completion: nil)
    }

}

extension ViewController: QLPreviewControllerDelegate {
    func previewController(_ controller: QLPreviewController, transitionViewFor item: QLPreviewItem) -> UIView? {
        return panelImage
    }
}

extension ViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let fileUrl = Bundle.main.url(forResource: "solar_panels", withExtension: "usdz")!
        return fileUrl as QLPreviewItem
    }
}

