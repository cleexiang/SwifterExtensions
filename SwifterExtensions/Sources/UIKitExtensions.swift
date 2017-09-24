//
//  UIKitExtensions.swift
//  SwiftExtensions
//
//  Created by LiXiang on 2017/9/20.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

import UIKit

/*
 usage: screen.width, screen.height
 */
public extension UIScreen {
    public static var width: CGFloat { return UIScreen.main.bounds.size.width }
    public static var height: CGFloat { return UIScreen.main.bounds.size.height }
}

public extension UIColor {
    public convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat = 1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
}

/*
 useage: view.x, view.y, view.width, view.height
 */
public extension UIView {
    
    public var x: CGFloat {
        return self.frame.origin.x
    }
    
    public var y: CGFloat {
        return self.frame.origin.y
    }
    
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
}

public extension UIView {
    /// Add border
    ///
    /// - Parameters:
    ///   - borderWidth: width of border
    ///   - borderColor: color of border
    public func addBorder(borderWidth: CGFloat = 1, borderColor: UIColor = UIColor.clear) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    public func addShadow(shadowOffset: CGSize = CGSize(width: 0, height: 0), shadowColor: UIColor = UIColor.black.withAlphaComponent(0.5), shadowRadius: CGFloat = 5, shadowOpacity: Float = 1.0) {
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }
    
    public func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    public func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    public func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview()}
    }
    
    public func setBgImage(image: UIImage, transparent: Bool = true) {
        self.layer.contents = image.cgImage
        if transparent {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
}

public extension UIAlertController {
    public class func showAlert(_ msg: String = "", title: String = "", confirmButtonTitle: String = "Done", base: UIViewController?) {
        var basevc = base
        if basevc == nil {
            basevc = UIApplication.shared.keyWindow?.rootViewController
            if let root = basevc {
                if let root = root as? UINavigationController {
                    basevc = root.visibleViewController
                }
            }
        }
        let alert = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: confirmButtonTitle, style: .default, handler: nil)
        alert.addAction(action)
        basevc?.present(alert, animated: true, completion: nil)
    }
    
    public class func showAlert(_ msg: String = "", title: String = "", cancelButtonTitle: String = "Cancel", confirmButtonTitle: String = "Done", base: UIViewController? = nil, confirmAction:@escaping ()->(), cancelAction:@escaping ()->()) {
        var basevc = base
        if basevc == nil {
            basevc = UIApplication.shared.keyWindow?.rootViewController
            if let root = basevc {
                if let root = root as? UINavigationController {
                    basevc = root.visibleViewController
                }
            }
        }
        let alert = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        let action1 = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: { action in
            cancelAction()
        })
        alert.addAction(action1)
        let action2 = UIAlertAction(title: confirmButtonTitle, style: .default, handler: { action in
            confirmAction()
        })
        
        alert.addAction(action2)
        basevc?.present(alert, animated: true, completion: nil)
    }
}

public extension UIEdgeInsets {
    public init(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) {
        self.init(top: top, left: left, bottom: bottom, right: right)
    }
}

public extension UIApplication {
    
    /// 当前应用是否是扩展
    public class func isAppExtension() -> Bool {
        return Bundle.main.executablePath!.contains(".appex")
    }
    
    /// 判断当前是否在UnitTest模式下运行
    public class func isRunningUnitTests() -> Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
    
    /// App是否正在调试中
    public class func isAppUnderDebugging() -> Bool {
        let once: Bool = {
            var info = kinfo_proc()
            var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
            var size = MemoryLayout.stride(ofValue: info)
            let junk = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
            Swift.assert(junk == 0, "sysctl failed")
            return (info.kp_proc.p_flag & P_TRACED) != 0
        }()
        return once
    }
}
