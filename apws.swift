import SwiftUI  

struct ContentView: View {  
    @State private var tasks: [String] = []  
    @State private var newTask: String = ""  

    var body: some View {  
        NavigationView {  
            VStack {  
                TextField("Agregar nueva tarea", text: $newTask, onCommit: {  
                    addTask()  
                })  
                .textFieldStyle(RoundedBorderTextFieldStyle())  
                .padding()  

                List {  
                    ForEach(tasks, id: \.self) { task in  
                        Text(task)  
                    }  
                    .onDelete(perform: deleteTask)  
                }  
                
                .navigationTitle("Lista de Tareas")  
                .navigationBarItems(trailing: EditButton())  
            }  
        }  
    }  

    private func addTask() {  
        guard !newTask.isEmpty else { return }  
        tasks.append(newTask)  
        newTask = ""  
    }  

    private func deleteTask(at offsets: IndexSet) {  
        tasks.remove(atOffsets: offsets)  
    }  
}  

struct ContentView_Previews: PreviewProvider {  
    static var previews: some View {  
        ContentView()  
    }  
}