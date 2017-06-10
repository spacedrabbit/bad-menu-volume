//
//  AppDelegate.swift
//  bad-menu-volume
//
//  Created by Louis Tur on 6/10/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  @IBOutlet weak var statusMenu: NSMenu!
  @IBAction func didPressQuit(_ sender: NSMenuItem) {
    NSApplication.shared().terminate(self)
  }
  
  let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    
    statusItem.title = "WeatherBar"
    statusItem.menu = statusMenu
//    
//    if let button = statusItem.button {
//      button.image = NSImage(named: "StatusBarButtonImage")
//      button.action = Selector(("printQuote:"))
//    }
//    
//    
  }
  

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  func printQuote(sender: AnyObject) {
    let quoteText = "Never put off until tomorrow what you can do the day after tomorrow"
    let quoteAuthor = "Mark Twain"
    
    print("\(quoteText) - \(quoteAuthor)")
  }
}

