//
//  CustomEditButtonView.swift
//  NextTunes
//
//  Created by Diego Llopis on 17/09/21.
//

import SwiftUI

struct EditButtonView: View {
    
    @Binding var editMode: EditMode

    var body: some View {
        
        Button {
            switch editMode {
            case .active: editMode = .inactive
            case .inactive: editMode = .active
            default: break
            }
        } label: {
            if let isEditing = editMode.isEditing, isEditing {
                Text("Done")
            } else {
                Text("Edit")
            }
        }
    }
}
