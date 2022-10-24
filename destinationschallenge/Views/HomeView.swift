//
//  HomeView.swift
//  destinationschallenge
//
//  Created by Daniel Lucas Ciríaco de Oliveira Miranda on 23/10/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = DestinationViewModel()
    @State var show = false
    
    @Namespace var namespace
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            ScrollView {
                HStack {
                    Text("My Trips")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(20)
                    Button {
                        print("List Tapped")
                    } label: {
                        Image(systemName: "lineweight")
                            .font(.system(size: 24.0).weight(.bold))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    Button {
                        print("List Tapped")
                    } label: {
                        Image(systemName: "globe")
                            .font(.system(size: 24.0).weight(.bold))
                            .foregroundColor(colorScheme == .dark ? .white : .gray)
                            .padding(20)
                    }
                }
                VStack {
                    ForEach(vm.destinations) { elem in
                        DestinationItem(namespace: namespace, destination: elem, show: $show)
                            .onTapGesture {
                                withAnimation (.spring(response: 0.6, dampingFraction: 0.8)) {
                                    vm.select(destination: elem)
                                    show.toggle()
                                }
                            }
                    }
                }
            }
            
            if show {
                DestinationView(namespace: namespace, show: $show, selectedDestination: $vm.selectedDestination)
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
