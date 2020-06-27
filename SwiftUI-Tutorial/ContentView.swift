//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by kawaharadai on 2019/06/22.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300) // widthの指定なしなら横幅いっぱいになる
                .edgesIgnoringSafeArea(.top) // SafeAreaを詰める(無視する)
            
            CircleImage()
                .offset(y: -85)
                .padding(.bottom, -85)
            
            VStack(alignment: .leading) { // 縦並べ
                Text("Tartle Rock")
                    .font(.title)
                HStack { // 横並べ
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer() // 横とのスペース
                    Text("California")
                        .font(.subheadline)
                }
            }
                .padding() // 四方にスペース
            
            Spacer() // 膨張スペースを入れて全体を上へ詰める
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
