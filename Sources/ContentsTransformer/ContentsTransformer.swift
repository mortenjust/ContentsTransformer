//
//  ContentsTransformer.swift
//  offsettest
//
//  Created by Morten Just on 3/29/22.
//

import Foundation
import SceneKit

public class ContentsTransformer {
    private var rotationDegrees : CGFloat?
    private var scaleX : CGFloat?
    private var scaleY : CGFloat?
    private var offsetY : CGFloat?
    
    public func reset() -> Self {
        rotationDegrees = nil
        scaleX = nil
        offsetY = nil
        scaleY = nil
        return self
    }
    
    public init() { }
    
    public var current : SCNMatrix4 {
        
        var final = SCNMatrix4Identity
        
        print("current: ----")
        
        if let rotationDegrees = rotationDegrees {
            print("current: degs", rotationDegrees)
            let rotation = SCNMatrix4MakeRotation(rotationDegrees * .pi / 180.0, 0, 0, -1)
            final = SCNMatrix4Mult(final, rotation)
        }
        
        if let scaleX = scaleX {
            print("current: scaleX:", scaleX)
            let scaleX = SCNMatrix4MakeScale(scaleX, 1, 1)
            final = SCNMatrix4Mult(final, scaleX)
        }
        
        if let scaleY = scaleY {
            print("current: scaley", scaleY)
            let scaleY = SCNMatrix4MakeScale(1, scaleY, 1)
            final = SCNMatrix4Mult(final, scaleY)
        }
        
        if let offsetY = offsetY {
            print("current: offsety", offsetY)
            let offset = SCNMatrix4MakeTranslation(0, offsetY, 0)
            final = SCNMatrix4Mult(final, offset)
        }
        
        print("current: ----")
        
        return final
    }

    
    public func rotation(_ degrees : CGFloat) -> Self {
        self.rotationDegrees = degrees
        return self
    }
    
    public func scaleX(_ scale : CGFloat) -> Self {
        self.scaleX = scale
        return self
    }
    
    public func scaleY(_ scale : CGFloat) -> Self {
        self.scaleY = scale
        return self
    }
    
    public func translateY(_ offset : CGFloat) -> Self {
        self.offsetY = offset
        return self
    }
    
    
    
    
}
