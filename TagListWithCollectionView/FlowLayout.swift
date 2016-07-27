//
//  FlowLayout.swift
//  TagFlowLayout
//
//  Created by Ambrish Kumar on 7/30/15.
//  Copyright (c) 2015 Ambrish. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesForElementsInRect = super.layoutAttributesForElementsInRect(rect)
        var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
        
        var leftMargin: CGFloat = 0.0;
        
        for attributes1 in attributesForElementsInRect! {
            let attributes = attributes1.copy() as! UICollectionViewLayoutAttributes

            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attributes.frame = newLeftAlignedFrame
                if leftMargin + attributes.frame.size.width > 320 {
                    print("cell max --->>\(CGRectGetMaxX(attributes.frame))  section left -->\(self.sectionInset.left)--->right ")
                    //leftMargin = 0.0
                    var newLeftAlignedFrame = attributes.frame
                    newLeftAlignedFrame.origin.x = 0.0
                    attributes.frame = newLeftAlignedFrame
                    
                }

            }
            leftMargin += attributes.frame.size.width + 8.0

            
            
            newAttributesForElementsInRect.append(attributes)
        }
        
        return newAttributesForElementsInRect
    }
}