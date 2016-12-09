//
//  UIView+Category.swift
//  Pods
//
//  Created by 黄海龙 on 16/12/9.
//
//

import UIKit

public extension UIView {
    
    public var width:CGFloat! {
        
        get {
            return self.frame.width
        }
        
        set(newValue) {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var height:CGFloat! {
        
        get {
            return self.frame.height
        }
        
        set (newValue) {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var x:CGFloat! {
        
        get {
            return self.frame.origin.x
        }
        
        set(newValue) {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y:CGFloat! {
        
        get {
            return self.frame.origin.y
        }
        
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    
    public var centerY:CGFloat! {
        
        get {
            return self.center.y
        }
        
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var origin:CGPoint! {
        
        get {
            return self.frame.origin
        }
        
        set(newValue) {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }

}
