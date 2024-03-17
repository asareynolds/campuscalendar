//
//  Swizzler.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import UIKit.UIColor

private var color: UIColor?
private var originalTintColor: IMP?

private enum swizzleColor: CFIndex {
    case orange = 1
    case green = 2
    case teal = 3
    case red = 4
    case purple = 5
    case indigo = 6
    case blue = 0

    var systemColor: UIColor {
        switch self {
        case .orange:
            return .systemOrange
        case .green:
            return .systemGreen
        case .teal:
            return .systemTeal
        case .red:
            return .systemRed
        case .purple:
            return .systemPurple
        case .indigo:
            return .systemIndigo
        case .blue:
            return .systemBlue
        }
    }
}


private func customColorFunction(_ self: UIView, _ _cmd: Selector) -> UIColor! {
    if self is UIImageView {
        let orig = unsafeBitCast(originalTintColor, to: (@convention(c) (UIView, Selector) -> UIColor).self)
        return orig(self, _cmd)
    }
    return color
}

/// On first call, swizzles [UIView tintColor] to return a custom color selector,
/// which this function assigns by getting the customTintColor integer property
/// from the current application's preferences
func swizzleCustomTintColor() {
    if originalTintColor == nil {
        let method = class_getInstanceMethod(UIView.self, #selector(getter: UIView.tintColor)).unsafelyUnwrapped
        let newMethodImp = unsafeBitCast(customColorFunction as (@convention(c) (UIView, Selector) -> UIColor?), to: IMP.self)
        originalTintColor = method_setImplementation(method, newMethodImp)
    }

    let num = CFPreferencesGetAppIntegerValue("customTintColor" as CFString, kCFPreferencesCurrentApplication, nil)
    color = swizzleColor(rawValue: num)?.systemColor ?? .systemBlue
}
