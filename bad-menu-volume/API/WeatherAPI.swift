//
//  WeatherAPI.swift
//  bad-menu-volume
//
//  Created by Louis Tur on 6/10/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Foundation

typealias WeatherCallback = (Weather?)->Void
class WeatherAPI {
  private let kAPI_KEY = "0f03c89ea44391e0269de25b89554630"
  private let kBASE_URL = "http://api.openweathermap.org/data/2.5/weather"
  private let session = URLSession.shared
  
  func getCurrentWeather(_ query: String, success: @escaping WeatherCallback) {
    
    var component = URLComponents(string: kBASE_URL)
    let addIdItem = URLQueryItem(name: "APPID", value: kAPI_KEY)
    let locationItem = URLQueryItem(name: "q", value: query)
    let unitsItem = URLQueryItem(name: "units", value: "imperial")
    
    component?.queryItems = [ addIdItem, locationItem, unitsItem]
    
    let request = URLRequest(url: component!.url!)
    session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
      
      if let error = error {
        print("There was an error encountered: \(error)")
      }
      
      
      if let httpResponse = response as? HTTPURLResponse {
        switch httpResponse.statusCode {
        case 200...299:
          print("Request Succeeded")
          
          guard
            let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let jsonValid = json as? [String : AnyObject],
            let mainJson = jsonValid["main"] as? JSON else {
            return
          }
          
          guard let weather = Weather(mainJson) else {
            return
          }
          
          success(weather)
          
        default:
          print("WeatherAPI returned response: \(httpResponse.statusCode) \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
        }

      }
    }.resume()
    
  }
}
