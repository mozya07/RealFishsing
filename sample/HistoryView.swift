//
//  HistoryView.swift
//  sample
//
//  Created by cmStudent on 2022/10/15.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var sensor = MotionSensor.shared_m
    @ObservedObject var fishdata = FishData.shared
    @ObservedObject var coordinatedata = CoordinateData.coor_shared
    let fishHistory : [Int]
   
    
    init(){
        //削除処理
        fishHistory =  userDefaults.array(forKey:"fishHistory" ) as? [Int] ?? []
    }
   
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack {
            
            List(fishHistory, id: \.self){ index in
               
                ShowFishHistoryView(fishName: fishdata.fish[index][3], fishSize: fishdata.fish[index][4], message: fishdata.fish[index][5],imageName: fishdata.fish[index][2])
               
            }
            
            Button(action: {
               
                UserDefaults.standard.removeObject(forKey: "fishHistory")
            }) {
                Text("履歴削除")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(30))
                    .frame(width: 300, height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
                    .offset(x: -5)

            
         
        
           }
            Button(action: {
                sensor.shakecount = 0
                sensor.resultcount = 0
                fishdata.startfish()
                fishdata.startfish()
                sensor.fishookisa = fishdata.startfishdata
               // print("UUUU" + String(fishookisa)) // 確認用
                coordinatedata.startcoordinate() // 座標の関数呼び出し
                print("SSSSSS：" + "\(sensor.coordinatedata.rh)")
                sensor.fishxVal = sensor.coordinatedata.returncoordinate
                sensor.fishyVal = sensor.coordinatedata.returncoordinatesecond
                
              dismiss()
               
            }) {
                Text("釣りへ戻る")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.cornerRadius(30))
                    .frame(width: 300, height: 100)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
                    .offset(x: -5)

            
         
        
           }
        }
        .onAppear {
            
            
            
            print("GGGGG" , fishHistory)
           
//
//           fishdata.fish[fishdata.randomfish][2]
//           fishdata.fish[fishdata.randomfish][3]
//           fishdata.fish[fishdata.randomfish][4]
//           fishdata.fish[fishdata.randomfish][5]
           
            
        }
    } // someview
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
