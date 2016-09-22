//
//  ZoomControls.swift
//  Mapa turystyczna
//
//  Created by Roman Barzyczak on 22.09.2016.
//  Copyright © 2016 Mapa Turystyczna. All rights reserved.
//

import Foundation
import GoogleMaps

@IBDesignable
class ZoomControls: UIView {
    @IBOutlet weak var heightSeperatorConstant: NSLayoutConstraint!
    weak var mapView: GMSMapView?

    // MARK: init methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    fileprivate func loadViewFromNib() -> UIView {
        let viewBundle = Bundle(for: type(of: self))
        if let view = viewBundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)![0] as? UIView {
            return view
        }
        return UIView()
    }

    fileprivate func commonSetup() {
        let nibView = loadViewFromNib()
        nibView.frame = bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        nibView.cornerDecorate()
        self.heightSeperatorConstant.constant = self.heightSeperatorConstant.constant /  UIScreen.main.scale
        addSubview(nibView)
    }
    
    
    @IBOutlet weak var zoomInButton: UIButton!
    @IBOutlet weak var zoomOutButton: UIButton!
    
    @IBAction func zoomOut(_ sender: AnyObject) {
        guard let mapView = self.mapView
        else {
            print("Set mapView variable")
            return
        }
        let zoomOutValue = mapView.camera.zoom - 1.0
        mapView.animate(toZoom: zoomOutValue)
    }
    
    @IBAction func zoomIn(_ sender: AnyObject) {
        guard let mapView = self.mapView
            else {
                print("Set mapView variable")
                return
        }
        let zoomInValue = mapView.camera.zoom + 1.0
        mapView.animate(toZoom: zoomInValue)
    }
    
}

extension UIView {
    func cornerDecorate() {
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.borderColor().cgColor
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
    }
}
