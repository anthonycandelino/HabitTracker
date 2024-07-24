//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Anthony Candelino on 2024-07-21.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss 
    @State private var habitName: String = ""
    @State private var habitColor = "charcoal"
    @Binding var isAddingHabit: Bool
    @Binding var habitsList: Habits
    let colorOptions = ["charcoal", "crimsonRed", "darkGreen", "deepBlue", "deepOrange", "royalPurple"]
    
    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 40)).bold()
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            Text("Add Habit")
                .font(.system(size: 40)).bold()
                .padding()
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            Text("Habit Name:")
                .font(.title).bold()
                .foregroundStyle(.white)
            TextField("Enter name", text: $habitName)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            Text("Habit Color:")
                .font(.title).bold()
                .foregroundStyle(.white)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(colorOptions, id: \.self) { color in
                        HStack {
                            Button {
                                habitColor = color
                            } label: {
                                Circle()
                                    .stroke(color == habitColor ? .blue : Color(color), lineWidth: 10 )
                                    .fill(Color(color))
                                    .frame(width: 60, height: 60)
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding(.vertical)
            .background(.white)
            .cornerRadius(20)
            .padding()
            Spacer()
            Button {
                habitsList.addHabit(Habit(name: habitName, color: habitColor))
                isAddingHabit = false
            } label: {
                HStack {
                    Text("Add Habit")
                        .font(.title).bold()
                        .foregroundStyle(Color(habitColor))
                    Image(systemName: "plus.circle.fill") .foregroundStyle(Color(habitColor))
                        .font(.title).bold()
                }
                .padding()
            }
            .buttonStyle(.bordered)
            .background(.white)
            .cornerRadius(20)
            .disabled(habitName.isEmpty)
            Spacer()
        }
        
        .frame(maxHeight: .infinity)
        .padding()
        .background(Color(habitColor))
    }
}

#Preview {
    @State var isAddingHabit = true
    @State var habitsList = Habits()
    return AddHabitView(isAddingHabit: $isAddingHabit, habitsList: $habitsList)
}
