//
//  CreditScoreView.swift
//  MagicScore
//
//  Created by Thecafremo on 11/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation
import UIKit

private let overlineLineWidth: CGFloat = 1
private let progressLineWidth: CGFloat = 10

private let progressShapeRadiusMargin: CGFloat = 5

private let animationDuration: Double = 1.5

class CreditScoreView: UIView, NibLoadable, Populatable {
    
    //MARK: - Properties.
    
    @IBOutlet weak var creditScoreCountingLabel: CountingLabel!
    @IBOutlet weak var outOfLabel: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    private var overlineShapeLayer: CAShapeLayer!
    private var progressShapeLayer: CAShapeLayer!
    private var gradientLayer: CAGradientLayer!
    
    private var progressPercentage: CGFloat = 0 {
        
        didSet {
         
            if (progressPercentage > 1) {
                self.progressPercentage = progressPercentage / 100
            }
            
            self.updateProgress(with: progressPercentage)
        }
    }

    
    //MARK: - LifeCycle's.
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.loadNibView()
        self.configureShapelayers()
    }
    
    
    //MARK: - Overriden.
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.overlineShapeLayer.path = self.path(for: 100, lineWidth: overlineLineWidth)
        self.progressShapeLayer.path = self.path(for: self.progressPercentage, lineWidth: progressLineWidth, radiusMargin: progressShapeRadiusMargin)
        
        self.gradientLayer.frame = self.bounds
    }
    
    
    //MARK: - Methods.
    
    private func configureShapelayers() {
        
        self.overlineShapeLayer = CAShapeLayer.init(withStrokeColor: UIColor.black.cgColor, lineWidth: overlineLineWidth)
        self.layer.addSublayer(self.overlineShapeLayer)
        
        self.progressShapeLayer = CAShapeLayer.init(withStrokeColor: UIColor.orange.cgColor, lineWidth: progressLineWidth)
        self.layer.addSublayer(self.progressShapeLayer)
        
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.colors = [UIColor.red.cgColor,
                                     UIColor.orange.cgColor,
                                     UIColor.yellow.cgColor]
        self.gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        self.gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.gradientLayer.mask = self.progressShapeLayer
        self.layer.addSublayer(self.gradientLayer)
    }
    
    
    private func updateProgress(with percentage: CGFloat, animated: Bool = true) {
        
        self.progressShapeLayer.path = self.path(for: percentage, lineWidth: progressLineWidth, radiusMargin: progressShapeRadiusMargin)
        
        if (animated == true) {
            
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = animationDuration
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            
            self.progressShapeLayer.add(animation, forKey: "animation")
        }
    }
    
    
    //MARK: - Populatable's.

    func populate(with creditReportInfo: CreditReportInfo) {
        
        self.progressPercentage = CGFloat((creditReportInfo.score * 100) / creditReportInfo.maxScoreValue)
        
        self.creditScoreCountingLabel.count(from: 0, to: Float(creditReportInfo.score), withDuration: animationDuration)
        self.outOfLabel.text = NSLocalizedString("out of ", comment: "") + String(creditReportInfo.maxScoreValue)

    }
    
    //MARK: - Helpers.
    
    private func path(for percentage: CGFloat, lineWidth: CGFloat, radiusMargin: CGFloat = 0) -> CGPath {
        
        let center = CGPoint.init(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
        let radius = self.bounds.width * 0.5 - lineWidth - radiusMargin
        let startAngle = CreditScoreView.percentageToRadians(0)
        let endAngle = CreditScoreView.percentageToRadians(percentage)
        
        return UIBezierPath.init(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
    }
    
    
    class func percentageToRadians(_ percentage: CGFloat) -> CGFloat {
        
        let degreess = 360 * percentage
        let radians = degreess * .pi / 180
        
        return radians - .pi * 0.5 //JP: Due to the Apple's coordinates system, 0 radians is at 90º. This "corrects" that.
    }

}


//MARK: - Helper Extension.

fileprivate extension CAShapeLayer {
    
    //MARK: - LifeCycle's.
    
    convenience init(withStrokeColor strokeColor: CGColor, lineWidth: CGFloat) {
        
        self.init()
        
        self.fillColor = UIColor.clear.cgColor
        self.strokeColor = strokeColor
        self.strokeStart = 0
        self.strokeEnd = 1
        self.lineWidth = lineWidth
        self.shouldRasterize = true
        self.rasterizationScale = UIScreen.main.scale
    }
}
