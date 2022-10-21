//
//  ShowFishHistoryView.swift
//  sample
//
//  Created by cmStudent on 2022/10/20.
//

import SwiftUI

struct ShowFishHistoryView: View {
    let fishName: String
    let fishSize: String
    let message: String
    let imageName: String
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var fishdata = FishData.shared
    @ObservedObject var sensor = MotionSensor.shared_m
    @ObservedObject var coordinatedata = CoordinateData.coor_shared
    
    var body: some View {
        ZStack{
            Image(imageName)
//                .scaledToFit()
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                
                Group {
                Spacer()
                Spacer()
                Spacer()
              
                
    //            Text("\(sensor.count)") // 秒ずう確認よう
    //                Text("\(sensor.resultcount)") // 秒数確認よう
                }
                   
                Text(fishName)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(20))
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
                
           
                Text(fishSize)
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.white.cornerRadius(20))
                    .frame(height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
    //                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 5))
                
              
                Text(message)
                    .font(.system(size: 25, weight: .bold, design: .rounded)) .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(20))
                    .frame(width: 300, height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
                
                Spacer()
                   
                
               
                
                Spacer()
                
            }//
            
        }
        
    }
    func reset() {
        sensor.shakecount = 0
        sensor.resultcount = 0
        
        fishdata.startfish()
        sensor.fishookisa = fishdata.startfishdata
       // print("UUUU" + String(fishookisa)) // 確認用
        coordinatedata.startcoordinate() // 座標の関数呼び出し
        print("SSSSSS：" + "\(sensor.coordinatedata.rh)")
        sensor.fishxVal = sensor.coordinatedata.returncoordinate
        sensor.fishyVal = sensor.coordinatedata.returncoordinatesecond
    }
}

