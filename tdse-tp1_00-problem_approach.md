# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry)

## Descripción del proyecto
En el marco de un sistema de gestión automatizada de estacionamientos, describiremos la solución implementada por la empresa [COMA Parking](https://www.comaparking.com/parking-management-system/intellegent-parking-management-system.html), limitándonos únicamente al módulo de control de ingreso.

## Solución
### Descripción de flujo
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

### Implementación

#### Reemplazo de componentes
Se reemplazan los componentes mencionados anteriormente de la siguiente forma:
* Cámara, espira sensora → interruptor dip switch
* Botón → pulsador
* Display, impresora, barrera → LEDs

#### Descripción de la implementación

<img width="533" height="317" alt="image" src="https://github.com/user-attachments/assets/2ea486f2-98a3-4903-8b94-3cd98b68b171" />


Se propone un diseño modular, dividiendo al sistema en tres grandes módulos: escrutar, procesar y actuar, ejecutados siempre en ese orden. Estos se comunican entre sí mediante el pasaje de mensajes.  

<img width="509" height="323" alt="image" src="https://github.com/user-attachments/assets/6e684c76-f7f9-46d7-8edd-c94da2087a9e" />


Mediante un ejecutor cíclico cada 1ms, se comprobará el estado de los componentes de los módulos. En caso de haber alguna novedad, se enviarán los mensajes correspondientes al siguiente módulo.  
Una vez consultados todos los estados de todos los componentes, el ejecutor cíclico retoma el control y lo cede al próximo módulo. Al terminar la ejecución del último actuador, inicia un nuevo ciclo. Todo esto ocurre en 1ms.

