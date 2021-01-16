//
//  FoundationExtensions.swift
//  SwiftExtensions
//
//  Created by LiXiang on 2017/9/20.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

import Foundation

public extension Bundle {
    class func mainBundlePath(_ withFileName: String) -> String? {
        return Bundle.main.path(forResource: withFileName, ofType: nil)
    }
    
    func path(_ fileName: String) -> String? {
        return self.path(forResource: fileName, ofType: nil)
    }
    
    class func path(inBundle: String, withFileName: String) -> String? {
        var path = Bundle.main.path(forResource: inBundle, ofType: "bundle")
        path?.append("/\(withFileName)")
        return path
    }
    
    class func identifier() -> String {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            return ""
        }
        return bundleIdentifier
    }
}

public extension FileManager {
    class func document(_ path: String) -> String {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return dir.appendingFormat("/%@", path)
    }
    
    class func lib(_ path: String) -> String {
        let dir = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
        return dir.appendingFormat("/%@", path)
    }
    
    class func cache(_ path: String) -> String {
        let dir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        return dir.appendingFormat("/%@", path)
    }
    
    class func temp(_ path: String) -> String {
        let dir = NSTemporaryDirectory()
        return dir.appendingFormat("%@", path)
    }
    
    class func randomPathToDocument(suffix: String) -> String {
        return FileManager.document(ProcessInfo().globallyUniqueString.appendingFormat(".%@", suffix))
    }
    
    class func randomPathToLib(suffix: String) -> String {
        return FileManager.lib(ProcessInfo().globallyUniqueString.appendingFormat(".%@", suffix))
    }
    
    class func randomPathToTemp(suffix: String) -> String {
        return FileManager.temp(ProcessInfo().globallyUniqueString.appendingFormat(".%@", suffix))
    }
}

public extension Bool {
    /// Converts Bool to Int.
    var toInt: Int { return self ? 1 : 0}
    
    /// Toggle boolean value.
    @discardableResult
    mutating func toggle() -> Bool {
        self = !self
        return self
    }
    
    /// Return inversed value of bool.
    var toggled: Bool {
        return !self
    }
    
    /// Return "true" if true, or "false" if false.
    var string: String {
        return description
    }
    
}

public extension NSRange {
    /// Simplest init (location, length)
    init(_ location: Int, _ length: Int) {
        self.init(location: location, length:length)
    }
}

public extension NSError {
    convenience init(domain: String = "\(#file)_\(#line)", code: Int = 0, description: String) {
        self.init(domain: domain, code: code, userInfo: [NSLocalizedDescriptionKey:description])
    }
}

public extension String {
    static func generateIdentifier(file: String = #file, line: Int = #line) -> String {
        return "\(file)_\(line)"
    }
}

public extension Date {
    func longStyleString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    func shortStyleString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        return formatter.string(from: self)
    }
}

