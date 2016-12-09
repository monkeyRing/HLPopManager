//
//  ViewController.swift
//  HLPopManager
//
//  Created by monkeyRing on 12/09/2016.
//  Copyright (c) 2016 monkeyRing. All rights reserved.
//

import UIKit
import HLPopManager

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    lazy var titles:[String] = {
        let titles = ["TransitionFromLeft","TransitionFromRight","TransitionFromTop","TransitionFromBottom","微信样式底部弹出","微信样式3D效果","分享界面底部弹出","分享界面3D效果","TransitionFromNone"]
        return titles
    }()

}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let adImageView = UIImageView(image: UIImage(named: "pic"))
        adImageView.frame = CGRect(x: 0, y: 0, width: 638 / 3, height: 988 / 3)
        adImageView.contentMode = .scaleAspectFill
        adImageView.isUserInteractionEnabled = true
        
        let actionSheet = Bundle.main.loadNibNamed("ActionSheet", owner: nil, options: nil)?[0] as! ActionSheet
        actionSheet.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 185)
        
        let shareView = Bundle.main.loadNibNamed("ShareView", owner: nil, options: nil)?[0] as! ShareView
        shareView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 225)
        
        switch indexPath.row {
        case 0:
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: adImageView, animStyle: .transitionLeft)
        case 1:
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: adImageView, animStyle: .transitionRight)
        case 2:
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: adImageView, animStyle: .transitionTop)
        case 3:
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: adImageView, animStyle: .transitionBottom)
        case 4:
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: actionSheet, animStyle: .transition2D)
        case 5:
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: actionSheet, animStyle: .transition3D)
        case 6:
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: shareView, animStyle: .transition2D)
        case 7 :
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: shareView, animStyle: .transition3D)
        case 8:
            PopManager.shared.present(inView: (self.navigationController?.view)!, containerView: adImageView, animStyle: .transitionNone)
            
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}


