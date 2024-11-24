# Memoria iOS Avanzado

Este proyecto consiste en el desarrollo de una **app iOS** utilizando **Swift**, que incluye diversas funcionalidades básicas para la navegación entre vistas, registro de usuario, inicio de sesión y visualización de contenido a través de un `TabBarController`. A continuación, se describe cada una de las características y elementos principales de la aplicación.

## Estructura del Proyecto

El proyecto está compuesto por las siguientes vistas y funcionalidades:

### 1. **Splash Screen**
- La pantalla de inicio (Splash) se presenta durante **3 segundos** antes de redirigir a la siguiente vista.
- Utiliza un `NavigationController` para facilitar la navegación a la siguiente vista.

### 2. **Login**
- El **Login** tiene dos opciones:
  - Iniciar sesión.
  - Redirigir al formulario de registro.
- Se muestra un proceso de carga mientras el usuario se autentica y, en caso de éxito, se procede al **Home**.

### 3. **Registro**
- La pantalla de **registro** permite ingresar datos para crear una cuenta:
  - Se validan los siguientes campos:
    - **Correo**: Se valida que el formato del correo sea correcto.
    - **Contraseña**: Se valida que cumpla con un formato adecuado (mínimo de caracteres, incluyendo letras y números).
    - **Confirmación de contraseña**: Se verifica que coincida con la contraseña original.
- Por ahora, la pantalla de registro solo tiene la **interfaz** y la **validación de datos**. No incluye la creación de la cuenta en una base de datos.

### 4. **Home**
- Una vez el usuario inicia sesión, se accede al **Home**, que está compuesto por un **TabBar**.
  - En este momento, el TabBar tiene dos secciones: **Inicio** y **Perfil**.
  - En la sección de **Inicio**, se muestra un **listado de posts** realizados por los usuarios. Los datos se gestionan utilizando **modelos** de `Usuario` y `Post`.
  - En la sección de **Perfil**, se muestra la **información del usuario** que ha iniciado sesión.

### 5. **TabBar**
- El `TabBarController` permite la navegación entre las siguientes vistas:
  - **Inicio**: Muestra el listado de publicaciones.
  - **Perfil**: Muestra la información del usuario.

## Características Técnicas

- **Lenguaje de programación**: Swift.
- **UI**: Construida utilizando `UIViewController`, `TabBarController`, `NavigationController` , `UI personalizada` y `UI nativos`.
- **Navegación**: Implementada mediante `NavigationController` y `TabBarController`.
- **Autenticación**: La autenticación se simula con cualquier usuario y contraseña válidos (sin conexión a un backend real por el momento).
- **Validaciones**:
  - Correo electrónico con formato válido.
  - Contraseña con formato adecuado.
  - Validación de la confirmación de la contraseña.
