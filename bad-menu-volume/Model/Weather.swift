//
//  Weather.swift
//  bad-menu-volume
//
//  Created by Louis Tur on 6/10/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Foundation

typealias JSON = [String : AnyObject]
protocol JSONable {
  init?(_ json: JSON)
}

struct Weather {
  let temperature: Double
  let temp_max: Double
  let temp_min: Double
  let humidity: Double
  let pressure: Double
}

extension Weather: JSONable {
  init?(_ json: JSON) {
    guard
      let temp = json["temp"] as? Double,
      let t_max = json["temp_max"] as? Double,
      let t_min = json["temp_min"] as? Double,
      let hum = json["humidity"] as? Double,
      let press = json["pressure"] as? Double else {
        return nil
    }
    
    self.init(temperature: temp, temp_max: t_max, temp_min: t_min, humidity: hum, pressure: press)
  }
}
