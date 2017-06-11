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
  
  let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
  let weatherAPI = WeatherAPI()
  var weatherMenuItem: NSMenuItem!
  let weatherController = WeatherViewController(nibName: "MainMenu", bundle: Bundle.main)
  
  override func awakeFromNib() {
    let icon = #imageLiteral(resourceName: "StatusBarButtonImage")
    icon.isTemplate = true
    statusItem.image = icon
    statusItem.menu = statusMenu
    
    weatherMenuItem = statusMenu.item(withTitle: "Weather")
    weatherMenuItem.view = weatherController?.weatherView
    
//    updateWeather()
  }
  
  func updateWeather() {
    weatherAPI.getCurrentWeather("New York") { (weather: Weather?) in
      
      guard
        let validWeather = weather,
        let weatherMenuItm = self.statusMenu.item(withTitle: "Weather")
      else { return }
      
     self.weatherController?.weatherView?.update(validWeather)
    }
  }
  
  @IBAction func didPressQuit(_ sender: NSMenuItem) {
    NSApplication.shared().terminate(self)
  }
  
  @IBAction func didPressUpdate(_ sender: NSMenuItem) {
    updateWeather()
  }
}
