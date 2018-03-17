//
//  FoundationExtensions.swift
//  SwiftExtensions
//
//  Created by LiXiang on 2017/9/20.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

import Foundation

public extension Bundle {
    public class func mainBundlePath(_ withFileName: String) -> String? {
        return Bundle.main.path(forResource: withFileName, ofType: nil)
    }
    
    public func path(_ fileName: String) -> String? {
        return self.path(forResource: fileName, ofType: nil)
    }
    
    public class func path(inBundle: String, withFileName: String) -> String? {
        var path = Bundle.main.path(forResource: inBundle, ofType: "bundle")
        path?.append("/\(withFileName)")
        return path
    }
    
    public class func identifier() -> String {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            return ""
        }
        return bundleIdentifier
    }
}

public extension FileManager {
    public class func document(_ path: String) -> String {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return dir.appendingFormat("/%@", path)
    }
    
    public class func lib(_ path: String) -> String {
        let dir = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
        return dir.appendingFormat("/%@", path)
    }
    
    public class func cache(_ path: String) -> String {
        let dir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        return dir.appendingFormat("/%@", path)
    }
    
    public class func temp(_ path: String) -> String {
        let dir = NSTemporaryDirectory()
        return dir.appendingFormat("%@", path)
    }
    
    public class func randomPathToDocument(suffix: String) -> String {
        return FileManager.document(ProcessInfo().globallyUniqueString.appendingFormat(".%@", suffix))
    }
    
    public class func randomPathToLib(suffix: String) -> String {
        return FileManager.lib(ProcessInfo().globallyUniqueString.appendingFormat(".%@", suffix))
    }
    
    public class func randomPathToTemp(suffix: String) -> String {
        return FileManager.temp(ProcessInfo().globallyUniqueString.appendingFormat(".%@", suffix))
    }
}

public extension Bool {
    /// Converts Bool to Int.
    public var toInt: Int { return self ? 1 : 0}
    
    /// Toggle boolean value.
    @discardableResult
    public mutating func toggle() -> Bool {
        self = !self
        return self
    }
    
    /// Return inversed value of bool.
    public var toggled: Bool {
        return !self
    }
    
    /// Return "true" if true, or "false" if false.
    public var string: String {
        return description
    }
    
}

public extension NSRange {
    /// Simplest init (location, length)
    public init(_ location: Int, _ length: Int) {
        self.init(location: location, length:length)
    }
}

public extension NSError {
    public convenience init(domain: String = "\(#file)_\(#line)", code: Int = 0, description: String) {
        self.init(domain: domain, code: code, userInfo: [NSLocalizedDescriptionKey:description])
    }
}

public extension String {
    public static func generateIdentifier(file: String = #file, line: Int = #line) -> String {
        return "\(file)_\(line)"
    }
}

public extension Date {
    public func longStyleString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    public func shortStyleString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        return formatter.string(from: self)
    }
}

