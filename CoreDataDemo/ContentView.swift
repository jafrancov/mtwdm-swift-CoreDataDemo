//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by Alejandro Franco on 25/03/20.
//  Copyright © 2020 Alejandro Franco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknow")
                }
            }
            Button("Add") {
                let firstName = ["Alejandro", "Liliana", "Oscar", "Margarita"]
                let lastName = ["Franco", "Vaca", "Celio", "Gonzalez"]
                let chosenFirstName = firstName.randomElement()!
                let chosenLastName = lastName.randomElement()!
                
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? self.moc.save()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
