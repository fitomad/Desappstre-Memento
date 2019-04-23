import Foundation

public protocol CareTaker
{
    /// Todos los *snapshots* disponibles
    var mementos: [Memento] { get }

    /**
        Guarda un *snapshot*
    */
    func saveMemento(_ memento: Memento) -> Void

    /**
        Recuperamos el último *snapshot*
    */
    func lastMemento() -> Memento?
}