import Foundation

public class Database: CareTaker
{
    /// Este `Array` hace las veces de base de datos
    private var items: [Memento]

    /// Todos los *snapshots* disponibles
    public var mementos: [Memento]
    {
        return items
    }

    /**
        Creamos una base de datos vacía
    */
    public init()
    {
        self.items = [Memento]()
    }

    /**
        Guarda un *snapshot*
    */
    public func saveMemento(_ memento: Memento) -> Void
    {   
        self.items.append(memento)
    }

    /**
        Recupera el último *snapshot*
    */
    public func lastMemento() -> Memento?
    {
        return items.last
    }
}