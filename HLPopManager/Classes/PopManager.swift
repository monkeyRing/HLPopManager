//
//  TransformTool.swift
//  Trans
//
//  Created by 黄海龙 on 16/12/6.
//  Copyright © 2016年 qianwang. All rights reserved.
//
//  暂未充分测试   目前待写 : 是否显示动画 close(animated:Bool)  close(completion: ((Bool) -> Swift.Void)? = nil) 关闭完成回调
//  点击弹出视图后,跳转控制器是否有问题.etc
//
import UIKit

public enum AnimationStyle:Int {
    
    case transitionLeft
    
    case transitionRight
    
    case transitionTop
    
    case transitionBottom
    
    case transitionScale
    
    case transition3D
    
    case transition2D

    case transitionNone
}


let screenSize = UIScreen.main.bounds.size

open class PopManager: NSObject {

    // 单例
    public class var shared : PopManager {
        struct Static {
            static let instance : PopManager = PopManager()
        }
        return Static.instance
    }
    
    var maskView: UIView!
    var presentView: UIView!
    var superView:UIView!
    var animationStyle:AnimationStyle?
    let closeAnimDurtion = 0
    
    // show
    open func present(inView:UIView,containerView:UIView , animStyle:AnimationStyle) {
        
        superView = inView
        presentView = containerView
        animationStyle = animStyle
        
        // 背景遮罩
        maskView = UIView(frame: inView.bounds)
        maskView.backgroundColor = UIColor.black
        maskView.alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(close(animated:)))
        maskView.isUserInteractionEnabled = true
        maskView.addGestureRecognizer(tap)
        inView.addSubview(maskView)
        
        UIView.animate(withDuration: 0.05, animations: {
            self.maskView.alpha = 0.4
        }) { (finished) in
            self.setAnimationStyle(animStyle)
        }
    }
    
    // MARK: 计算坐标
    func setAnimationStyle(_ animStyle:AnimationStyle) {
        
        animationStyle = animStyle

        switch animStyle {
            
            case .transitionLeft:
            
                presentView.origin = CGPoint(x: -presentView.width , y: superView.centerY - presentView.height / 2)
            
            case .transitionRight:
                
                presentView.origin = CGPoint(x: screenSize.width , y: self.superView.centerY - presentView.height / 2)

            case .transitionTop:
                
                presentView.origin = CGPoint(x: (screenSize.width - presentView.width) / 2 , y: -presentView.height)

            case .transitionBottom:
                
                presentView.origin = CGPoint(x: (screenSize.width - presentView.width) / 2 , y: screenSize.height)

            case .transitionNone:
                
                presentView?.center = superView.center
            
            default: break
        }
        
        animatype(animStyle)
    }
    
    // MARK: 怎样执行动画
    func animatype(_ type:AnimationStyle) {
        
        if type == .transition2D {
            
            presentView.y = screenSize.height

            UIView.animate(withDuration: 0.25, animations: {
                
                var rect = self.presentView.frame
                rect.origin.y = screenSize.height - rect.size.height
                
                self.presentView.frame = rect
                UIApplication.shared.windows[0].addSubview(self.presentView)
            })
        } else if  type == .transition3D {
            
            presentView.y = screenSize.height
            
            UIView.animate(withDuration: 0.1, animations: {
                
                self.superView.layer.transform = self.firstTran()
            }) { (finish: Bool) in
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.superView.layer.transform = self.secondTran()
                    
                    var rect = self.presentView.frame
                    rect.origin.y = screenSize.height - rect.size.height
                    
                    self.presentView.frame = rect
                    UIApplication.shared.windows[0].addSubview(self.presentView)
                }, completion:nil)
            }
        } else {
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.presentView?.center = self.maskView.center
            }) { (finished) in   }
            
            UIApplication.shared.windows[0].addSubview(presentView)
        }
    }

    /// 3D
    open func firstTran() -> CATransform3D {
        var transform = CATransform3DIdentity
        //        transform = CATransform3DScale(transform, 0.8, 0.8, 1)
        transform.m34 = -1 / 1000
        return transform
    }
    
    open func secondTran() -> CATransform3D {
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, self.superView.frame.size.height * (-0.08), 0)
        transform = CATransform3DScale(transform, 0.75, 0.75, 1)
        return transform
    }
    
    
//    open func close(completion: ((Bool) -> Swift.Void)? = nil) {
//          completion: ((Bool) -> Swift.Void)? = nil  // 参数
//    }
    
    open func close(animated:Bool) {
        
        
        if animationStyle == .transition2D || animationStyle == .transition3D {
            var rect = self.presentView.frame
            rect.origin.y = UIScreen.main.bounds.size.height
            UIView.animate(withDuration: 0.3, animations: {
                self.superView.layer.transform = self.firstTran()
                self.presentView.frame = rect
                self.maskView.alpha = 0.0
            }) { (finish: Bool) in
                self.presentView.removeFromSuperview()
                UIView.animate(withDuration: 0.3, animations: {
                    self.superView.layer.transform = CATransform3DIdentity
                }, completion: nil)
            }
        } else if animationStyle == .transitionNone {
            self.presentView.removeFromSuperview()
            self.maskView.removeFromSuperview()
        } else {
            
            UIView.animate(withDuration: 0.5, animations: {
    
                switch (self.animationStyle)! {
                case .transitionLeft:
    
                    self.presentView.origin = CGPoint(x: screenSize.width, y: self.superView.centerY - self.presentView.height / 2)
                    
                case .transitionRight:
    
                    self.presentView.origin = CGPoint(x: -self.presentView.width, y: self.superView.centerY - self.presentView.height / 2)
    
                case .transitionTop:
                    
                    self.presentView.origin = CGPoint(x: (screenSize.width - self.presentView.width) / 2, y: screenSize.height)
    
                case .transitionBottom:
                    
                    self.presentView.origin = CGPoint(x: (screenSize.width - self.presentView.width) / 2, y: -self.presentView.height)

                case .transitionScale:
    
                    self.presentView?.center = self.superView.center
                    self.presentView?.transform = CGAffineTransform().scaledBy(x: 0.01, y: 0.01)
                default:
                    break
                }
                
                self.maskView.alpha = 0
            }) { (finished) in
                
               self.presentView.removeFromSuperview()
               self.maskView.removeFromSuperview()
            }
        }
    }
}
