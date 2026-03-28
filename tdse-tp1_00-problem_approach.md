# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry)

## Descripción del proyecto
En el marco de un sistema de gestión automatizada de estacionamientos, describiremos la solución implementada por la empresa [COMA Parking](https://www.comaparking.com/parking-management-system/intellegent-parking-management-system.html), limitándonos únicamente al módulo de control de ingreso.

## Descripción de la solución
El sistema cuenta con los siguientes componentes:
* Cámara
* Espira sensora
* Tótem con botón, display e impresora de tickets
* Barrera

Flujo de ingreso de un vehículo:  
1. Se detecta la llegada de un vehículo mediante la cámara. Además, al aproximarse a la barrera se activa la espira sensora.  
2. El tótem muestra un mensaje de bienvenida a través del display.  
3. El usuario acciona el botón del tótem.  
4. El tótem imprime el ticket comprobante del ingreso.  
5. Se levanta la barrera.  
6. El vehículo ingresa al estacionamiento, por lo que se desactiva la espira sensora.  
7. Se baja la barrera.

<img width="432" height="327" alt="image" src="https://github.com/user-attachments/assets/9af9d5ca-cb50-445c-b2ae-47e544910ec3" />

