# Como usar motoko-login

## 1. Crear un usuario en la funcion `addUser`

Para comenzar a utilizar el software, deberemos de ingresar de primera mano usuarios con los cuales podremos interactuar, para ello se utiliza la funcion `addUser` la cual requiere que se introduzca un **Usuario** y una **Contraseña** y posteriormente pulsar en el boton *Call*, esto devolvera un valor ***true*** en el **OutputLog**, confirmando que se agrego correctamente. En caso contrario mandara un ***false***, esto ocurrira si no se agrega ningun valor, o si falta tanto el usuario como la contraseña.

## 2. Comprobamos si se agrego correctamente el usuario utilizando la funcion `listUsers`

Para comprobar si se ingreso correctamente un usuario, o para consultar los usuarios ingresados hasta el momento, podemos utilizar la funcion `listUsers` la cual listara un array en el **OutputLog** con solamente los usuarios que se hayan registrado.

## 3. Ingresar Credenciales para loguearnos utilizando la funcion `login`

Para poder loguearse el usuario debera de ingresar las credenciales de su respectivo usuario, siendo estas el **Nombre** y **Constraseña**, cuando se ingresen las credenciales y se pulse el boton *Call* devolvera un valor ***true*** en el **OutputLog** confirmando que se realizo correctamente el login. En caso de que las credenciales no coincidan, devolvera un valor ***false***.

> ***Nota:*** *Para poder loguearse se necesita de un usuario previamente registrado mediante la funcion `addUser`.*

## 4. Comprobar si el usuario esta logueado utilizando funcion `isLoggedIn`

Para comprobar si un usuario ya ingreso en el sistema podemos utilizar la funcion `isLoggedIn`, la cual el usuario debera de ingresar el **Nombre** de quien quiera confirmar su logueo, al momento de introducir un nombre que coincida con un usuario ya loggeado devolvera un valor***true*** en el **OutputLog**. En caso contrario lanzara un ***false***.

## 5. Loguearse mediante Internet Identity (II) utilizando la funcion `loginWithII`

Dentro del sistema podemor iniciar secion mediante Internet Indentity, para ello deberemos de contar previamente con una II, una vez la tengamos es tan simple como mandar a llamar a la funcion mendiante el boton *Call* para que registre automaticamente un usuario dentro del hashmap de usuarios logueados.

## 6. Listar usuarios logueados mediante Internet Identity (II) utilizando la funcion `listIIUsers`

Al igual que con usuarios registrados manualmente, podemos listar a los usuarios que se hayan registrado mediante Internet Idenrity, para ello podemos utilizar la función `listIIUsers` la cual mandara un array al **OutputLog** listando solamente el **Nombre** de cada usuario logueado mediante este metodo

## 7. Desloguear a un usuario mediante la funcion `logout`

Para poder desloguear a un usuario del sistema podemos utilizar la funcion `logout` la cual solicita que el usuario ingrese el **Nombre** del usuario que desee desloguear, cuando el usuario pulse el boton *Call* y el nombre coincida con un usuario registrado, lanzara un valor ***true*** en el **OutputLog** confirmando que se deslogueo correctamente. En caso de que el usuario no exista lanzara un valor ***false***4

>***Nota:** Cabe destacar que la funcion `logout` es capaz de desloguear a usuarios logueados **Manualmente**, como logueados con **Internet Identity** siempre y cuando se introduzca correctamente el nombre dentro de la funcion*

## Y eso seria todo, ya sabes utilizar el sistema :D 