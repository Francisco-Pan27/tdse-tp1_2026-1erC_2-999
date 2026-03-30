# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry) - Módulo System

## Descripción del proyecto
A continuación se detallan los eventos y acciones del módulo System para un único sistema.

## Solución

### Estructura
El módulo posee una interfaz donde el módulo Sensor deja los mensajes a procesar (en una estructura específica para ello denominada ```message_queue``` en la tabla de abajo), y un núcleo de procesamiento que toma los mensajes de a uno. El objetivo de este diseño es que sea no bloqueante.

### Eventos
* **EV_SYS_01_DOWN**: el botón fue presionado.
* **EV_SYS_01_UP**: el botón dejó de ser presionado.

### Acciones
* **raise EV_ACT_LED_01_ON**: dispara el evento "encender LED" para ser enviado al próximo módulo.
* **raise EV_ACT_LED_01_OFF**: dispara el evento "apagar LED" para ser enviado al próximo módulo.

### Estados
* **ST_SYS_IDLE**: el sistema se encuentra a la espera de eventos.
* **ST_SYS_BUSY**: el sistema está procesando un evento recibido.

### Tabla de transiciones entre estados

<br>
<table>
  <thead>
    <tr>
      <th colspan="5">Sensor Statechart - State Transition Table </th>
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
      <td></td>
    </tr>
    <tr>
      <td rowspan="2"><b>ST_SYS_BUSY</b></td>
      <td>EV_SYS_01_DOWN</td>
      <td></td>
      <td>ST_SYS_IDLE</td>
      <td><tt>raise</tt> EV_ACT_LED_01_ON <br> <tt>message_queue.pop()</tt></td>
    </tr>
    <tr>
      <td>EV_SYS_01_UP</td>
      <td></td>
      <td>ST_SYS_IDLE</td>
      <td><tt>raise</tt> EV_ACT_LED_01_OFF <br> <tt>message_queue.pop()</tt></td>
    </tr>
  </tbody>
</table>
