//
//  DetailViewController.swift
//  CellTest
//
//  Created by JUN? on 2021/05/30.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var cellLabel:UILabel!
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var cellLabelCenterX: NSLayoutConstraint!
        
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
//        nameLabelCenterX.constant = view.bounds.width
//        cellLabelCenterX.constant = view.bounds.width
        
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        cellLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        cellLabel.alpha = 0
    }
    
    private func showAnimation() {
//        nameLabelCenterX.constant = 0
//        cellLabelCenterX.constant = 0
//
//        UIView.animate(withDuration: 0.5,
//                       delay: 0.2,
//                       usingSpringWithDamping: 0.6,
//                       initialSpringVelocity: 2,
//                       options: .allowUserInteraction,
//                       animations: {self.view.layoutIfNeeded()},
//                       completion: nil)
//
//        UIView.transition(with: imgView,
//                          duration: 0.3,
//                          options: .transitionFlipFromLeft,
//                          animations: nil,
//                          completion: nil)
        
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 2,
                       options: .allowUserInteraction,
                       animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
        },completion: nil)
        
        UIView.animate(withDuration: 1,
                       delay: 0.2,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 2,
                       options: .allowUserInteraction,
                       animations: {
            self.cellLabel.transform = CGAffineTransform.identity
            self.cellLabel.alpha = 1
        },completion: nil)

                UIView.transition(with: imgView,
                                  duration: 0.3,
                                  options: .transitionFlipFromLeft,
                                  animations: nil,
                                  completion: nil)
    }
    
    func updateUI() {        
        if let cellInfo = viewModel.cellInfo {
            imgView.image = cellInfo.image
            nameLabel.text = cellInfo.name
            cellLabel.text = "\(cellInfo.cell)"
        }

    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

class DetailViewModel {
    var cellInfo:CellInfo?
    
    func update(model: CellInfo?) {
        cellInfo = model
    }
    
}
