//
//  WeatherView.swift
//  bad-menu-volume
//
//  Created by Louis Tur on 6/10/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Cocoa

class WeatherViewController: NSViewController {
  var weatherView = WeatherView(coder: NSCoder())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.displayIfNeeded()
  }
  override func viewWillAppear() {
    super.viewWillAppear()
    
  }
}

class WeatherView: NSView {
  
  @IBOutlet weak var imageView: NSImageView!
  @IBOutlet weak var temperatureText: NSTextField!
  @IBOutlet weak var tempMinMax: NSTextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    let newNib = NSNib(nibNamed: "MainMenu", bundle: Bundle(for: type(of: self)))
    newNib?.instantiate(withOwner: self, topLevelObjects: nil)
  }
  
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
  }
  
  func update(_ weather: Weather) {
    
    DispatchQueue.main.async {
//      self.temperatureText.stringValue = "\(weather.temperature)"
//      self.tempMinMax.stringValue = "\(weather.temp_min) / \(weather.temp_max)"
    }
  }
  
}
