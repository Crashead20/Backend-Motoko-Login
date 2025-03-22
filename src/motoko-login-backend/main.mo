import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal"; //Manejo de valores de II
import Text "mo:base/Text";
import Array "mo:base/Array";

actor Backend {
  
  // Hashmaps de datos que se usaran

  // usuarios manuales
  private var users : HashMap.HashMap<Text, Text> =
    HashMap.HashMap<Text, Text>(10, Text.equal, Text.hash);

  // usuarios autenticados con Internet Identity (II)
  private var iiUsers : HashMap.HashMap<Principal, Bool> =
    HashMap.HashMap<Principal, Bool>(10, Principal.equal, Principal.hash);

  // usuarios logueados de ambos metodos
  private var loggedInUsers : HashMap.HashMap<Text, Bool> =
    HashMap.HashMap<Text, Bool>(10, Text.equal, Text.hash);

  // FUNCIONES DEL SISTEMA LOGIN ----------------------------------------

  // 1. Registro de usuario manual
  public func addUser(username: Text, password: Text) : async Bool {
    if (username == "" or password == "") {
      return false;
    };
    if (users.get(username) != null) {
      return false;
    };

    ignore users.put(username, password);
    return true;
  };

  // 2. Login de usuario manual
  public func login(username: Text, password: Text) : async Bool {
    if (username == "" or password == "") {
      return false;
    };

    switch (users.get(username)) {
      case (?storedPassword) {
        if (storedPassword == password) {
          ignore loggedInUsers.put(username, true);
          return true;
        } else {
          return false;
        };
      };
      case null {
        return false;
      }
    }
  };

  // 3. Login de usuario con Internet Identity (II)  
  public shared ({ caller }) func loginWithII() : async Bool {
    let callerId = Principal.toText(caller);

    if (iiUsers.get(caller) != null) {
      ignore loggedInUsers.put(callerId, true);
      return true;
    } else {
      ignore iiUsers.put(caller, true);
      ignore loggedInUsers.put(callerId, true);
      return true;
    }
  };

  // 4. Verificar si un usuario de ambas bdd estan estan logueados
  public func isLoggedIn(username: Text) : async Bool {
    switch (loggedInUsers.get(username)) {
      case (?true) true;
      case _ false;
    }
  };

  // 5. Listar todos los usuarios registrados manualmente
  public func listUsers() : async [Text] {
    var usersList : [Text] = [];
    let entries = users.entries();

    for (entry in entries) {
      let (username, _) = entry;
      usersList := Array.append<Text>(usersList, [username]);
    };

    return usersList;
  };

  // 6. Listar usuarios autenticados con II
  public func listIIUsers() : async [Text] {
    var iiUsersList : [Text] = [];
    let entries = iiUsers.entries();

    for (entry in entries) {
      let (principal, _) = entry;
      let principalText = Principal.toText(principal);
      iiUsersList := Array.append<Text>(iiUsersList, [principalText]);
    };

    return iiUsersList;
  };

  // 7. Logout instroduciendo el nombre que deseemos desloguear
  public shared ({ caller }) func logout(username: Text) : async Bool {
    let callerId = Principal.toText(caller);

    // Switch para un usuario manual
    switch (loggedInUsers.get(username)) {
      case (?true) {
        ignore loggedInUsers.delete(username);
        return true;
      };
      case _ {};
    };

    // Switch para un usuario II
    switch (iiUsers.get(caller)) {
      case (?true) {
        ignore loggedInUsers.delete(callerId);
        return true;
      };
      case _ {};
    };

    return false;
  };

};