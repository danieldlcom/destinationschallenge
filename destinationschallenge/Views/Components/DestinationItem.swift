//
//  DestinationItem.swift
//  destinationschallenge
//
//  Created by Daniel Lucas Ciríaco de Oliveira Miranda on 23/10/2022.
//

import SwiftUI

struct DestinationItem: View {
    var namespace: Namespace.ID
    var destination: DestinationModel
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            Image(systemName: destination.season)
                .font(.system(size: 24.0).weight(.bold))
                .matchedGeometryEffect(id: "icon\(destination.id)", in: namespace)
                .foregroundColor(.white)
                .frame(height: 30.0)
            Text(destination.name)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(destination.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(destination.subtitle)
                .font(.body.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(destination.id)", in: namespace)
        }
        .padding(30)
        .foregroundStyle(.white)
        .background(
            Image(uiImage: UIImage(named: destination.name)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(destination.id)", in: namespace)
                
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(destination.id)", in: namespace)
        )
        .frame(height: 200)
        .padding(20)
    }
}

struct DestinationItem_Previews: PreviewProvider {
    @Namespace static var namespace
    static var destination: DestinationModel = DestinationModel.defaultItem

    static var previews: some View {
        DestinationItem(namespace: namespace,
                        destination: destination, show: .constant(true))
    }
}
