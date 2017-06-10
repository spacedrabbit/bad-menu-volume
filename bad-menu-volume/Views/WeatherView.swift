//
//  WeatherView.swift
//  bad-menu-volume
//
//  Created by Louis Tur on 6/10/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Cocoa

class WeatherView: NSView {
  
  @IBOutlet weak var imageView: NSImageView!
  @IBOutlet weak var temperatureText: NSTextField!
  @IBOutlet weak var tempMinMax: NSTextField!
  
  func update(_ weather: Weather) {
    
    DispatchQueue.main.async {
      self.temperatureText.stringValue = "\(weather.temperature)"
      self.tempMinMax.stringValue = "\(weather.temp_min) / \(weather.temp_max)"
    }
  }
  
}
