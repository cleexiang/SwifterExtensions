//
//  CoreGraphicsExtensions.swift
//  SwiftExtensions
//
//  Created by LiXiang on 2017/9/20.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

import Foundation

public extension CGPoint {
    /*
     Simplest init (x, y)
     */
    public init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y:y)
    }
}

public extension CGRect {
    /*
     Simplest init (x, y , width, height)
     */
    public init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    /// X value of CGRect's origin
    public var x: CGFloat {
        get {
            return self.origin.x
        } set(value) {
            self.origin.x = value
        }
    }
    
    /// Y value of CGRect's origin
    public var y: CGFloat {
        get {
            return self.origin.y
        } set(value) {
            self.origin.y = value
        }
    }
    
    /// Width of CGRect's size
    public var w: CGFloat {
        get {
            return self.size.width
        } set(value) {
            self.size.width = value
        }
    }
    
    /// Height of CGRect's size
    public var h: CGFloat {
        get {
            return self.size.height
        } set(value) {
            self.size.height = value
        }
    }
}

public extension CGFloat {
    public func toRadians() -> CGFloat {
        return (.pi * self) / 180.0
    }
    public func toDegrees() -> CGFloat {
        return (180 * self) / .pi
    }
    
    @discardableResult
    public mutating func mutateToRadians() -> CGFloat {
        self = (.pi * self) / 180.0
        return self
    }
    
    @discardableResult
    public mutating func mutateToDegrees() -> CGFloat {
        self = (180 * self) / .pi
        return self
    }
}

public extension CGSize {
    /// Simplest init (width, height)
    public init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
    
}
