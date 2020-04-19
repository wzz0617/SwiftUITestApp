//
//  RoomDetail.swift
//  SwiftUIApp
//
//  Created by admin on 2020/04/19.
//  Copyright © 2020 admin. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false
    var body: some View {
        ZStack(alignment: .topLeading){
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
                }
            .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all).transition(.move(edge: .leading))
            }
            
        }
    }
}

#if DEBUG
struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RoomDetail(room: testData[0])
            RoomDetail(room: testData[1])
        }
    }
}
#endif
