//
//  HabitListItemView.swift
//  HabitTracker
//
//  Created by Anthony Candelino on 2024-07-20.
//

import SwiftUI

struct HabitListItemView: View {
    @Binding var habit: Habit
    
    var body: some View {
        NavigationLink(value: habit) {
            HStack {
                Text(habit.name)
                    .font(.title).bold()
                    .padding()
                Spacer()
                Text("\(habit.timesCompleted)")
                    .font(.title).bold()
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.20, maxHeight: .infinity)
                    .background(.white)
                    .foregroundStyle(Color(habit.color))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(habit.color), lineWidth: 15)
                    )
            }
            .frame(height: UIScreen.main.bounds.height * 0.1)
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.1)
        .background(Color(habit.color))
        .clipShape(.rect(cornerRadius: 20))
        .padding(.horizontal)
        .foregroundStyle(.white)
        .shadow(radius: 3, y: 1)
    }
}

#Preview {
    @State var previewHabit = Habit(name: "Habit Name")
    return HabitListItemView(habit: $previewHabit)
}
