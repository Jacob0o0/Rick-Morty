//
//  README.md
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

Rick & Morty iOS App

Aplicación iOS desarrollada en SwiftUI que consume la API pública de Rick & Morty para explorar personajes, gestionar favoritos protegidos con biometría y visualizar ubicaciones en un mapa.

Requisitos:

* macOS Sequoia o superior
* Xcode 16 o superior
* Swift 6
* iOS 18 (recomendado)
* Conexión a internet para consumir la API

Tecnologías utilizadas

* SwiftUI
* Swift Concurrency (async/await)
* Core Data
* Swinject
* XCTest / Swift Testing
* MapKit
* LocalAuthentication

Instalación

1. Clona el repositorio:

git clone https://github.com/Jacob0o0/Rick-Morty.git

2. Accede al directorio del proyecto:

cd Rick-Morty

3. Abre el proyecto desde:

open Rick\&Morty.xcworkspace

4. Espera a que Xcode resuelva las dependencias automáticamente.

Ejecución

1. Selecciona el esquema Rick_Morty.
2. Elige un dispositivo para compilar. (IMPORTANTE: Para usar el desbloqueo biométrico se necesita correr la aplicación en un dispositivo real, de lo contrario, en el simulador no se podrán ver la lista de favoritos.)
3. Presiona ⌘ + R o haz clic en el botón Run.

Funcionalidades principales

* Consulta paginada de personajes.
* Búsqueda por nombre.
* Filtros avanzados. (por especie y estado)
* Vista de detalle de personaje.
* Gestión de favoritos.
* Registro de episodios vistos
* Protección de favoritos mediante Face ID / Touch ID.
* Persistencia local con Core Data.
* Visualización de ubicaciones en mapa.

Pruebas

El proyecto incluye:

* Pruebas unitarias de ViewModels.
* Pruebas instrumentadas (UI Tests).

Ejecutar todas las pruebas

En Xcode:

1. Selecciona el esquema Rick_Morty.
2. Presiona ⌘ + U.

Consideraciones para UI Tests

Los UI Tests utilizan datos simulados y omiten la autenticación biométrica mediante el argumento de lanzamiento:

UITests

Este comportamiento está habilitado únicamente para pruebas automatizadas.

Arquitectura

El proyecto sigue una arquitectura basada en MVVM con separación de responsabilidades mediante casos de uso e inyección de dependencias con Swinject.

Capas principales:

* Presentation
* Domain
* Data
* Infrastructure

La inyección de dependencias se gestiona mediante Swinject.

API

La aplicación consume la API pública:

* https://rickandmortyapi.com/

Autor:
Jacobo Escorcia
