//
//  ContentView.swift
//  SwiftUItest
//
//  Created by Robert C on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .cyan,
                           bottomColor: isNight ? .black : .blue,
                           middleColor: isNight ? .gray : .cyan)
            VStack {
                CityTextView(cityName: "Palm Desert, CA")
                    .padding(.top, 3.0)
                CityTextView(cityName: isNight ? "Tonight" : "Today")
                    .padding(.vertical, -10.0)
                    .font(.system(size: 32, weight: .medium, design: .default))
                
                MainWeatherStatusView(imageName: isNight ? "moon.fill" : "cloud.sun.fill", temperature:76)
                    .padding(.vertical, -3.0)
                    
                HStack(spacing: 21) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 75)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 57)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 53)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.fill",
                                   temperature: 75)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 44)
                }
                
                
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: isNight ? "Change To Day Time" : "Change To Night Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                
                }
                
                Spacer()
                
                
                }
            }
                    
                }
            

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int


    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var middleColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor, middleColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {

    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size:32, weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280, height: 140)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium,design: .default))
                .foregroundColor(.white)
                .padding()

            }
        }
    }
}

struct WeatherButton: View {

var title: String
var textColor: Color
var backgroundColor: Color

var body: some View {
    Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)

        
        }
    }

