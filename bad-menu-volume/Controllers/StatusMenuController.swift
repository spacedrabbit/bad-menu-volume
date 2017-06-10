//
//  StatusMenuController.swift
//  bad-menu-volume
//
//  Created by Louis Tur on 6/10/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
  
  @IBOutlet weak var statusMenu: NSMenu!
  @IBOutlet weak var weatherView: WeatherView!
  
  let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
  let weatherAPI = WeatherAPI()
  var weatherMenuItem: NSMenuItem!
  
  override func awakeFromNib() {
    let icon = #imageLiteral(resourceName: "StatusBarButtonImage")
    icon.isTemplate = true
    statusItem.image = icon
    statusItem.menu = statusMenu
    
    weatherMenuItem = statusMenu.item(withTitle: "Weather")
    weatherMenuItem.view = weatherView
    
//    updateWeather()
  }
  
  func updateWeather() {
    weatherAPI.getCurrentWeather("New York") { (weather: Weather?) in
      
      guard
        let validWeather = weather,
        let weatherMenuItm = self.statusMenu.item(withTitle: "Weather")
      else { return }
      
     self.weatherView.update(validWeather)
      
    }
  }
  
  @IBAction func didPressQuit(_ sender: NSMenuItem) {
    NSApplication.shared().terminate(self)
  }
  
  @IBAction func didPressUpdate(_ sender: NSMenuItem) {
    updateWeather()
  }
}
