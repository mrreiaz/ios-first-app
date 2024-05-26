//
//  Created by Abdul Halim Reiaz on 2024/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            
            CustomGradientColorView(
                isNight: isNight
            )
            
            VStack{
                
                CityView(currentLocation: "Dhaka,BD")
                
                MiddlePartOfAppView(
                    temperature: 20,
                    imageName: isNight ? "moon.fill" : "cloud.sun.fill")
                HStack(spacing: 20){
                    WeatherDayView(
                        dayOfWeek: "Mon",
                        imageName: "cloud.sun.fill",
                        temperature: 23
                    )
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.rain.fill",
                        temperature: 12
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sunset.fill",
                        temperature: 24
                    )
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind.snow",
                        temperature: 22
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sun.max.fill",
                        temperature: 21
                    )
                }
                
                Spacer()
                Button(){
                    isNight.toggle()
                }label: {
                    WetherButton(
                        buttonText: "Change Day Time",
                        bgColor: Color.white,
                        textColor:Color.black
                    )
                }
                Spacer()
            }
        }
    }
}



#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            
            Text(dayOfWeek)
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct CustomGradientColorView: View {
     var isNight: Bool

    
    var body: some View {
        ContainerRelativeShape(
            )
        .fill(isNight ? Color.black.gradient : Color.blue.gradient )
        .ignoresSafeArea()
//        LinearGradient(
//            gradient: Gradient(
//                colors: [
//                    isNight ? .black : Color("lightBlue") ,
//                    isNight ? .gray : Color("darkBlue")
//                ]
//            ),
//            startPoint: .topTrailing,
//            endPoint: .bottomTrailing
//        )
//        .ignoresSafeArea()
    }
    
}

struct MiddlePartOfAppView: View {
    var temperature: Int
    var imageName: String
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 200,height: 200)
            Text("\(temperature)°")
                .font(.system(size: 88,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,30)
    }
}

struct CityView: View {
    var currentLocation: String
    var body: some View {
        Text(currentLocation)
            .font(.system(size: 62,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct WetherButton: View {
    var buttonText: String
    var bgColor: Color
    var textColor: Color
    var body: some View {
        Text(buttonText)
            .frame(width: 300,height: 80)
            .background(bgColor)
            .foregroundColor(textColor)
            .font(.system(size: 28,weight: .bold,design: .default))
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
    }
}


