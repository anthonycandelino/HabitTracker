//
//  ContentView.swift
//  HabitTracker
//
//  Created by Anthony Candelino on 2024-07-19.
//

import SwiftUI

struct ContentView: View {
    @State private var habitsList = Habits()
    @State private var isAddingHabit = false
   
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach($habitsList.habits) { $habit in
                        HabitListItemView(habit: $habit)
                            .padding(.vertical, 5)
                    }
                    .padding(.top, 5)
                }
            }
            .navigationTitle("Habits")
            .navigationDestination(for: Habit.self) { habit in
                if let index = $habitsList.habits.firstIndex(where: { $0.id == habit.id }) {
                    HabitDetailsView(habit: $habitsList.habits[index], habitsList: $habitsList)
                }
            }
            .toolbar {
                Button {
                    isAddingHabit.toggle()
                } label: {
                    HStack {
                        Text("Add Habit")
                            .font(.system(size: 18)).bold()
                            .foregroundStyle(.black)
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.black)
                            .font(.system(size: 18)).bold()
                        }
                }
            }
            .sheet(isPresented: $isAddingHabit) {
                AddHabitView(isAddingHabit: $isAddingHabit, habitsList: $habitsList)
            }
        }.tint(.white)
    }
}

#Preview {
    ContentView()
}
