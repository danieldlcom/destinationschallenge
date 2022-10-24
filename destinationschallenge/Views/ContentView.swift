//
//  ContentView.swift
//  destinationschallenge
//
//  Created by Daniel Lucas Ciríaco de Oliveira Miranda on 22/10/2022.
//

import SwiftUI

class TimeItem: Identifiable, Equatable, ObservableObject {
    static func == (lhs: TimeItem, rhs: TimeItem) -> Bool {
        lhs.id == rhs.id
    }

    let id = UUID()
    @Published var minutes: Int = 0
    @Published var seconds: Int = 30
}

struct ContentView: View {
    @State var items = [TimeItem]()
    @State var selectedElement: TimeItem?

    var body: some View {
        ScrollView(){
            VStack{
                ForEach(items){ elem in
                    ItemRowView(elem: elem, selectedElement: self.$selectedElement){
                        self.items.removeAll { $0.id == elem.id }
                    }
                }
            }
            Spacer()
            AddItemView {
                self.items.append(TimeItem())
            }
        }.animation(.spring(), value: items)
    }
}

struct SelectedElementView: View {
    @ObservedObject var elem: TimeItem

    var body: some View {
        HStack{
            Picker(selection: $elem.minutes, label: Text("")){
                ForEach(0..<60){ i in
                    Text("\(i)")
                }
            }
            .frame(width: 120)
            .clipped()

            Picker(selection: .constant(0), label: Text("")){
                ForEach(0..<60){ i in
                    Text("\(i)")
                }
            }
            .frame(width: 120)
            .clipped()
        }
        .frame(height: 120)
        .clipped()
    }
}

struct AddItemView: View {
    let action: ()->()
    var body: some View {
        Button(action: action)
        {
            ZStack{
                Rectangle()
                    .cornerRadius(12)
                    .frame(height: 40)
                    .foregroundColor(Color.gray.opacity(0.15))

                Text("Add")

                HStack{
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color.green)
                        .font(.system(size: 22))
                        .padding(.leading, 10)

                    Spacer()
                }
            }.padding()
        }
    }
}

struct ItemRowView: View {
    @ObservedObject var elem: TimeItem
    @Binding var selectedElement: TimeItem?
    let action: ()->()

    var body: some View {
        ZStack{

            Rectangle()
                .cornerRadius(12)
                .frame(height: elem == selectedElement ? 120 : 40)
                .foregroundColor(Color.gray.opacity(0.15))

            Text("\(elem.minutes)")
                .opacity(elem == selectedElement ? 0 : 1)
                .transition(AnyTransition.scale)

            if(elem == selectedElement){
                SelectedElementView(elem: elem)
            }


            HStack{
                Button(action: action)
                {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(Color.red)
                        .font(.system(size: 22))
                        .padding(.leading, 10)
                }
                Spacer()
            }

        }
        .padding(.horizontal)
        .padding(.top)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring()){
                self.selectedElement = self.elem
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
