//
//  DestinationView.swift
//  destinationschallenge
//
//  Created by Daniel Lucas Ciríaco de Oliveira Miranda on 23/10/2022.
//

import SwiftUI

struct DestinationView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @Binding var selectedDestination: DestinationModel
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 12) {
                Spacer()
                VStack (alignment: .leading, spacing: 12) {
                    Image(systemName: selectedDestination.season)
                        .font(.system(size: 24.0).weight(.bold))
                        .matchedGeometryEffect(id: "icon\(selectedDestination.id)", in: namespace)
                        .foregroundColor(.white)
                        .frame(height: 30.0)
                    Text(selectedDestination.name)
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title\(selectedDestination.id)", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(selectedDestination.subtitle)
                        .font(.body.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle\(selectedDestination.id)", in: namespace)
                }
                .padding(30)
                VStack {
                    Text(selectedDestination.description)
                        .font(.body.weight(.light))
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 50.0, leading: 30.0, bottom: 50.0, trailing: 30.0))
                        .matchedGeometryEffect(id: "description\(selectedDestination.id)", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(
                    Color.white
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .transition(.scale)
            }
            .foregroundStyle(.white)
            .background(
                Image(uiImage: UIImage(named: selectedDestination.name)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(selectedDestination.id)", in: namespace)
                    
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(selectedDestination.id)", in: namespace)
            ).ignoresSafeArea()
            
        }.overlay(Button {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.white)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
                .padding(20)
        }, alignment: .topTrailing)
        .overlay(Button {
            
        } label: {
            Text("Edit")
                .font(.body.weight(.semibold))
                .foregroundColor(.white)
                .padding(20)
        }, alignment: .topLeading)
        
    }
}

struct DestinationView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        DestinationView(namespace: namespace, show: .constant(true), selectedDestination: .constant(DestinationModel.defaultItem))
    }
}
