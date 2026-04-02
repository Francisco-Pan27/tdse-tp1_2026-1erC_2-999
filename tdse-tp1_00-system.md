# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry) - Módulo System

## Descripción del proyecto
A continuación se detallan los eventos y acciones del módulo System para un único sistema.

## Solución

### Estructura
El módulo posee una interfaz donde el módulo Sensor deja los mensajes a procesar (en una estructura específica para ello denominada ```message_queue``` en la tabla de abajo), y un núcleo de procesamiento que toma los mensajes de a uno. El objetivo de este diseño es que sea no bloqueante.

### Eventos
* **EV_SYS_SENSOR_COIL_DETECTOR**: El sensor detecta presencia de un vehiculo.  
* **EV_SYS_MANUAL_BUTTON_PRESS**: El usuario presiona el boton.
* **EV_SYS_NOT_SENSOR_COIL_DETECTOR**: El sensor deja de detectar un vehiculo.

### Acciones
* **raise EV_ACT_LED_01_ON**: dispara el evento "encender LED" para ser enviado al próximo módulo.
* **raise EV_ACT_LED_01_OFF**: dispara el evento "apagar LED" para ser enviado al próximo módulo.

### Estados
* **ST_SYS_IDLE**: El sistema se encuentra a la espera de eventos.
* **ST_SYS_CAR_ARRIVE**: Se detecta la llegada de un vehiculo.
* **ST_SYS_PRINT_TICKET**: Se imprime el comprabante de llegada.
* **ST_SYS_UP_BARRIER**: La barrera se encuentra levantada permitiendo el paso del vehiculo.
* **ST_SYS_DOWN_BARRIER**:  La barrera se encuentra abajo impidiendo el paso del vehiculo.

### Tabla de transiciones entre estados

<br>
<table>
  <thead>
    <tr>
      <th colspan="5">System Statechart - State Transition Table </th>
    </tr>
    <tr>
      <th>Current State</th>
      <th>Event</th>
      <th>[Guard]</th>
      <th>Next State</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="1"><b>ST_SYS_IDLE</b></td>
      <td></td>
      <td>[<tt>message_queue.size() > 0</tt>]</td>
      <td>ST_SYS_BUSY</td>
      <td><tt>event = message_queue.pop()</tt></td>
    </tr>
    <tr>
      <td rowspan="2"><b>ST_SYS_BUSY</b></td>
      <td>EV_SYS_01_DOWN</td>
      <td></td>
      <td>ST_SYS_IDLE</td>
      <td><tt>raise</tt> EV_ACT_LED_01_ON </td>
    </tr>
    <tr>
      <td>EV_SYS_01_UP</td>
      <td></td>
      <td>ST_SYS_IDLE</td>
      <td><tt>raise</tt> EV_ACT_LED_01_OFF</td>
    </tr>
  </tbody>
</table>
