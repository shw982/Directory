//
//  RoomView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import SwiftUI

struct RoomView: View {
    
    let room: Room
    let viewModel: RoomListViewModel
    
    let iconSize: CGFloat = UIDevice.iPad ? 50 : 30
    let textSpacing: CGFloat = UIDevice.iPad ? 15 : 5
    let hStackSpacing: CGFloat = UIDevice.iPad ? 20 : 10
    let vStackPadding: CGFloat = UIDevice.iPad ? 20 : 10
    
    var body: some View {
        
        HStack(spacing: hStackSpacing) {
            /// Icon
            Image(systemName: Icons.roomIcon)
                .resizable()
                .scaledToFill()
                .frame(width: iconSize, height: iconSize)
                .clipped()
                .offset(y: -iconSize)
                .accessibilityElement()
                .accessibilityLabel(Text("Room Icon"))
                .accessibilityAddTraits(.isImage)
            
            VStack(alignment: .leading, spacing: textSpacing) {
                /// Room ID
                if let roomID = room.id, !roomID.isEmpty {
                    Text(Strings.RoomList.RoomCell.roomID + roomID)
                        .font(UIDevice.iPad ? .title : .headline)
                        .accessibilityElement()
                        .accessibilityLabel(Text("Room ID"))
                        .accessibilityValue(roomID)
                        .accessibilityAddTraits(.isStaticText)
                }
                
                /// Maximum occupancy
                if let maxOccupancy = room.maxOccupancy, maxOccupancy > 0 {
                    RoomInfoView(text: Strings.RoomList.RoomCell.maxOccupancy + "\(maxOccupancy)",
                                 accessibilityLabel: "Maximum occupancy",
                                 accessibilityValue: "\(maxOccupancy)")
                }
                
                /// Occupied
                if let occupied = room.isOccupied, !occupied.description.isEmpty {
                    RoomInfoView(text: Strings.RoomList.RoomCell.occupied + viewModel.checkIfOccupied(room),
                                 accessibilityLabel: "Occupied",
                                 accessibilityValue: viewModel.checkIfOccupied(room))
                }
                
                /// Created At
                if let createdAt = room.createdAt, !createdAt.isEmpty {
                    RoomInfoView(text: Strings.RoomList.RoomCell.createdAt + viewModel.getRoomCreatedAt(createdAt),
                                 accessibilityLabel: "Created At",
                                 accessibilityValue: viewModel.getRoomCreatedAt(createdAt))
                }
            }
            .padding(.bottom, vStackPadding)
        }
    }
}


#Preview {
    RoomView(room: Room.room1(), viewModel: RoomListViewModel())
}

