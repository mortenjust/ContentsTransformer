//
//  ContentsTransformer.swift
//  offsettest
//
//  Created by Morten Just on 3/29/22.
//

import Foundation
import SceneKit

public class ContentsTransformer {
    private var _rotationDegrees : CGFloat?
    private var _scaleX : CGFloat?
    private var _scaleY : CGFloat?
    private var _offsetY : CGFloat?
    private var _offsetX : CGFloat?
    public var _baseTranslateY : CGFloat?
    
    public func reset() -> Self {
        _rotationDegrees = nil
        _scaleX = nil
        _offsetY = nil
        _scaleY = nil
        _baseTranslateY = nil
        return self
    }
    
    
    public var debugDescription : String {
        "ct: rot: \(_rotationDegrees ?? -1), scalex: \(_scaleX ?? -1), scaleY: \(_scaleY ?? -1), offsetY: \(_offsetY ?? -1), offsetX: \(_offsetX ?? -1)"
    }
    
    public init() { }
    
    public var current : SCNMatrix4 {
        
        var final = SCNMatrix4Identity
        
        print("current: ----")
        
        if let scaleX = _scaleX {
            print("current: scaleX:", scaleX)
            let scaleX = SCNMatrix4MakeScale(scaleX, 1, 1)
            final = SCNMatrix4Mult(final, scaleX)
        }
        
        if let scaleY = _scaleY {
            print("current: scaley", scaleY)
            let scaleY = SCNMatrix4MakeScale(1, scaleY, 1)
            final = SCNMatrix4Mult(final, scaleY)
        }
        
        if let baseTranslateY = _baseTranslateY {
            print("current: Base y ", baseTranslateY)
            let translate = SCNMatrix4MakeTranslation(0, baseTranslateY, 0)
            final = SCNMatrix4Mult(final, translate)
        }
        
        if let offsetY = _offsetY {
            print("current: offsety", offsetY)
            let offset = SCNMatrix4MakeTranslation(0, offsetY, 0)
            final = SCNMatrix4Mult(final, offset)
        }
        
        if let offsetX = _offsetX {
            print("current: offsetx", offsetX)
            let offset = SCNMatrix4MakeTranslation(offsetX, 0, 0)
            final = SCNMatrix4Mult(final, offset)
        }
        
        if let rotationDegrees = _rotationDegrees {
            print("current: degs", rotationDegrees)
            let rotation = SCNMatrix4MakeRotation(rotationDegrees * .pi / 180.0, 0, 0, 1)
            final = SCNMatrix4Mult(final, rotation)
        }
        
 
        
        print("current: ----")
        
        return final
    }

    
    public func rotation(_ degrees : CGFloat) -> Self {
        self._rotationDegrees = degrees
        return self
    }
    
    public func scaleX(_ scale : CGFloat?) -> Self {
        guard let scale = scale else {
            return self
        }

        self._scaleX = scale
        return self
    }
    
    public func scaleY(_ scale : CGFloat?) -> Self {
        guard let scale = scale else {
            return self
        }

        self._scaleY = scale
        return self
    }
    
    public func translateY(_ offset : CGFloat?) -> Self {
        guard let offset = offset else {
            return self
        }

        self._offsetY = offset
        return self
    }
    
    public func baseTranslateY(_ offset : CGFloat?) -> Self {
        guard let offset = offset else {
            return self
        }
        
        self._baseTranslateY = offset
        
        return self

    }
    
    public func translateX(_ offset : CGFloat?) -> Self {
        guard let offset = offset else {
            return self
        }
        self._offsetX = offset
        return self
    }
    
    
    
    
}
