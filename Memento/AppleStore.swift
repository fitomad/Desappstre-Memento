import Foundation

public typealias Operation = (_ lhs: Int, _ rhs: Int) -> Int

public struct AppleStore
{
    
    /**
        Acciones que se pueden ejercer en la tienda
    */
    public enum Action
    {
        case venta
        case reposicion
        case devolucion
    }

    /**
        Productos disponibles en la tienda
    */
    public enum Product
    {
        case iPhone
        case iPad
        case mac
        case appleTV
    }

    /// Stock disponible de iPhone
    public private(set) var iPhoneStock: Int
    /// Stock disponible de iPad
    public private(set) var iPadStock: Int
    /// Stock disponible de la familia Mac
    public private(set) var macStock: Int
    /// Stock disponible de Apple TV
    public private(set) var tvStock: Int

    /**
        La tienda arranca con 100 unidades
        de cada producto
    */
    public init()
    {
        self.iPhoneStock = 100
        self.iPadStock = 100
        self.macStock = 100
        self.tvStock = 100
    }

    /**
        Se realiza una acción en la tienda
    */
    public mutating func apply(action: Action, to product: Product, quantity: Int) -> Void
    {
        print("### Acción: \(action) de \(quantity) \(product)")
        let operation = self.operation(for: action)
        switch product
        {
            case .iPhone:
                self.iPhoneStock = operation(quantity, self.iPhoneStock)
            case .iPad:
                self.iPadStock = operation(quantity, self.iPadStock)
            case .mac:
                self.macStock = operation(quantity, self.macStock)
            case .appleTV:
                self.tvStock = operation(quantity, self.tvStock)
        }
    }

    /**
        La operación asociada a la acción
    */
    private func operation(for action: Action) -> Operation
    {
        switch action
        {
            case .venta:
                return removeItems
            default:
                return addItems
        }
    }

    //
    // MARK: - Operaciones con los productos
    //

    /**
        Se añaden items al stock
    */
    private func addItems(_ items: Int, to stock: Int) -> Int
    {
      return items + stock
    }

    /**
        Se eliminan items del stock
    */
    private func removeItems(_ items: Int, to stock: Int) -> Int
    {
      return stock - items
    }
}

//
// MARK: - CustomStringConvertible Protocol
//

extension AppleStore: CustomStringConvertible
{
    /// Stock en un formato legible
    public var description: String
    {
        return "\r\n--- Stock ---\r\niPhone: \(self.iPhoneStock)\r\niPad: \(self.iPadStock)\r\nMac: \(self.macStock)\r\nApple TV: \(self.tvStock)\r\n---\r\n"
    }
}

//
// MARK: - Originator Protocol
//

extension AppleStore: Originator
{
    /**
        Crea un *snaphot* (memento) del stock 
        de la Apple Store en este momento
    */
    public func createMemento() -> Memento
    {
        let memento = Memento(stockForiPhone: self.iPhoneStock, 
                              iPad: self.iPadStock, 
                              mac: self.macStock, 
                              tv: self.tvStock)

        return memento
    }

    /**
        Restaura las existencias de la Apple Store a partir
        de un *snapshot* (memento)
    */
    public mutating func restore(from memento: Memento) -> Void
    {
        self.iPhoneStock = memento.iPhoneStock
        self.iPadStock = memento.iPadStock
        self.macStock = memento.macStock
        self.tvStock = memento.tvStock
    }
}