# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry) - Módulo Actuator

## Descripción del proyecto
A continuación se detallan los eventos y acciones del módulo Actuator, modelado como un único LED que responde a los eventos generados por el módulo System.

## Solución

### Estructura
El módulo posee una interfaz donde el módulo System deja los mensajes a procesar (en una estructura específica para ello denominada ```message_queue``` en la tabla de abajo), y un núcleo de actuación que toma los mensajes de a uno. El objetivo de este diseño es que sea no bloqueante.

### Eventos
* **EV_ACT_LED_01_ON**: indica que se debe encender el LED.
* **EV_ACT_LED_01_OFF**: indica que se debe apagar el LED.

### Acciones
* **turn_LED_off()**: enciende el LED.
* **turn_LED_off()**: apaga el LED.

### Estados
* **ST_ACT_IDLE**: el sistema se encuentra a la espera de eventos.
* **ST_ACT_BUSY**: el sistema está procesando un evento recibido.

### Tabla de transiciones entre estados

<br>
<table>
  <thead>
    <tr>
      <th colspan="5">Actuator Statechart - State Transition Table </th>
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
      <td rowspan="1"><b>ST_ACT_IDLE</b></td>
      <td></td>
      <td>[<tt>message_queue.size() > 0</tt>]</td>
      <td>ST_ACT_BUSY</td>
      <td><tt>event = message_queue.pop()</tt></td>
    </tr>
    <tr>
      <td rowspan="2"><b>ST_ACT_BUSY</b></td>
      <td>EV_ACT_LED_01_ON</td>
      <td></td>
      <td>ST_ACT_IDLE</td>
      <td><tt>turn_LED_on()</tt></td>
    </tr>
    <tr>
      <td>EV_ACT_LED_01_OFF</td>
      <td></td>
      <td>ST_ACT_IDLE</td>
      <td><tt>turn_LED_off()</tt></td>
    </tr>
  </tbody>
</table>
