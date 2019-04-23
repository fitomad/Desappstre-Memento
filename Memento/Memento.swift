import Foundation

public struct Memento
{
    /// Stock disponible de iPhone
    public let iPhoneStock: Int
    /// Stock disponible de iPad
    public let iPadStock: Int
    /// Stock disponible de la familia Mac
    public let macStock: Int
    /// Stock disponible de Apple TV
    public let tvStock: Int

    /// Momento en el que se crea el *snapshot* de la tienda
    private let createdAt: Date

    /**
        Crea un *snapshot* con las existencias de la tienda
    */
    public init(stockForiPhone iPhone: Int, iPad: Int, mac: Int, tv: Int)
    {
        self.createdAt = Date()

        self.iPhoneStock = iPhone
        self.iPadStock = iPad
        self.macStock = mac
        self.tvStock = tv
    }
}