import Foundation

public protocol Originator
{
    /**
        Crea un *snapshot* del modelo en un momento 
        en concreto.
    */
    func createMemento() -> Memento

    /**
        Restaura el modelo a partir de un *snapshot*
    */
    mutating func restore(from memento: Memento) -> Void
}