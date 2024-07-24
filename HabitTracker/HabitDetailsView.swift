//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Anthony Candelino on 2024-07-20.
//

import SwiftUI
    
struct HabitDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isConfirmingDelete = false
    @Binding var habit: Habit
    @Binding var habitsList: Habits
    let colorOptions = ["charcoal", "crimsonRed", "darkGreen", "deepBlue", "deepOrange", "royalPurple"]
    
    var body: some View {
        VStack {
            Text("Habit Name:")
                .font(.title).bold()
                .foregroundStyle(.white)
            TextField("Habit Name", text: $habit.name)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            Text("Times Completed")
                .font(.title).bold()
                .foregroundStyle(.white)
                .padding(.top)
            HStack {
                Button {
                    habit.decreaseTimesCompleted()
                } label: {
                    Image(systemName: "minus.circle")
                        .foregroundStyle(.white)
                        .font(.system(size: 80))
                }
                Text("\(habit.timesCompleted)")
                    .font(.system(size: 75))
                    .frame(width: UIScreen.main.bounds.size.width * 0.4)
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                Button {
                    habit.incrementTimesCompleted()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.white)
                        .font(.system(size: 80))
                }
            }
            .padding()
            Text("Habit Color").font(.title).foregroundStyle(.white).bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(colorOptions, id: \.self) { color in
                        HStack {
                            Button {
                                habit.color = color
                            } label: {
                                Circle()
                                    .stroke(color == habit.color ? .blue : Color(color), lineWidth: 10 )
                                    .fill(Color(color))
                                    .frame(width: 60, height: 60)
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding(10)
            .background(.white)
            .cornerRadius(20)
            .padding()
            Button {
                isConfirmingDelete.toggle()
            } label: {
                Text("Delete Habit")
                    .font(.system(size: 20)).bold()
                    .foregroundStyle(.white)
                Image(systemName: "xmark")
                    .font(.system(size: 20)).bold()
                    .foregroundStyle(.white)
            }
            .padding()
            .buttonStyle(.bordered)
        }
        .frame(maxHeight: .infinity)
        .background(Color(habit.color))
        .alert("Delete \(habit.name) Habit", isPresented: $isConfirmingDelete) {
            Button("Cancel", role: .cancel) { }
            Button("OK") {
                habitsList.deleteHabit(id: habit.id)
                dismiss()
            }
        } message: {
            Text("Are you sure you want to delete this habit?")
        }
    }
}

#Preview {
    @State var previewHabit = Habit(name: "Habit Name")
    @State var habitsList = Habits()
    return HabitDetailsView(habit: $previewHabit, habitsList: $habitsList)
}
