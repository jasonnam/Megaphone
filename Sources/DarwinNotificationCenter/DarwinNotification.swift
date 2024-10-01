//
//  DarwinNotification.swift
//  DarwinNotificationCenter
//
//  Created by Семён C. Осипов on 27.09.2024.
//

import Foundation

/// A Darwin notification payload. It does not contain any userInfo, a Darwin notification is purely event handling.
public struct DarwinNotification {
    
    /// The Darwin notification name
    public struct Name: Equatable {
        var rawValue: String
    }
    
    /// The Darwin notification name
    var name: Name

    /// Initializes the notification based on the name.
    fileprivate init(_ name: Name) {
        self.name = name
    }
}

extension DarwinNotification.Name {
    /// Initializes a new Notification Name, based on a custom string. This string should be identifying for not only this notification, but for the full system. Therefore, you should include a bundle identifier to the string.
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// Initialize a new Notification Name, based on a CFNotificationName.
    init(_ cfNotificationName: CFNotificationName) {
        rawValue = cfNotificationName.rawValue as String
    }
    
    public static func == (lhs: DarwinNotification.Name, rhs: DarwinNotification.Name) -> Bool {
        return (lhs.rawValue) == (rhs.rawValue)
    }
}

