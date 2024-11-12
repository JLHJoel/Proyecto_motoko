import Array "mo:base/Array";


actor ClientesCanister {
    // Array para almacenar clientes como tuplas (nombre, numcel)
    var clientes : [(Text, Text)] = [];

    // Función para agregar un cliente
    public func agregarCliente(nombre: Text, numcel: Text) : async Text {
        // Agrega el cliente al array
        clientes := Array.append(clientes, [(nombre, numcel)]);
        return "Cliente agregado correctamente.";
    };

    // Función para eliminar un cliente por número de celular
    public func eliminarClientePorNombre(nombre: Text) : async Text {
        var encontrado = false;
        var nuevoClientes : [(Text, Text)] = [];

        // Itera sobre el array para encontrar el cliente y eliminarlo
        for (cliente in clientes.vals()) {
            if (cliente.0 == nombre) {
                // Si se encuentra el cliente, se marca como encontrado
                encontrado := true;
            } else {
                // Si no se encuentra, agrega el cliente a la nueva lista
                nuevoClientes := Array.append(nuevoClientes, [cliente]);
            };
        };

        // Si el cliente fue encontrado y eliminado, actualizamos el array
        if (encontrado) {
            clientes := nuevoClientes;
            return "Cliente eliminado correctamente.";
        } else {
            return "Cliente no encontrado.";
        };
    };

    // Función para mostrar todos los nombres de los clientes
    public func mostrarClientes() : async [Text] {
        var nombresNumeros : [Text] = [];
        for (cliente in clientes.vals()) {
        let nombreNumero = cliente.0 # " - " # cliente.1;
        nombresNumeros := Array.append(nombresNumeros, [nombreNumero]);
        };
        return nombresNumeros;
}

};
