import Foundation

//
// TEST 
//

var store = AppleStore()
var database = Database()

print(store)
store.apply(action: .venta, to: .iPhone, quantity: 2)
print(store)
store.apply(action: .venta, to: .iPhone, quantity: 10)
print(store)
store.apply(action: .devolucion, to: .iPhone, quantity: 3)
print(store)

//
// Ahora vamos a recepcionar productos en la Apple Store
// Vamos a guardar el estado de la tienda

let mementoBefore = store.createMemento()
print("$$$ Guardamos este memento")
database.saveMemento(mementoBefore)

store.apply(action: .reposicion, to: .iPhone, quantity: 200)
store.apply(action: .reposicion, to: .iPad, quantity: 200)
store.apply(action: .reposicion, to: .appleTV, quantity: 200)

print(store)

//
// La etiquetas QR de las cajas tenían un error.
// Pone que cada una contenía 200 items, pero en realidad son 20
// Vamos a volver al estado previo
//

if let mementoRollback = database.lastMemento()
{
    print("$$$ Restauramos al memento anterior")
    store.restore(from: mementoRollback)
}


//
// Veamos si hemos vuelto al estado anterior 
//

print(store)

//
// Ahora los añadimos bien
//

store.apply(action: .reposicion, to: .iPhone, quantity: 20)
store.apply(action: .reposicion, to: .iPad, quantity: 20)
store.apply(action: .reposicion, to: .appleTV, quantity: 20)

//
// A ver cómo estamos ahora... 
//

print(store)
