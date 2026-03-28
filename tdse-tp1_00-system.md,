# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry) - Módulo System

## Descripción del proyecto
A continuación se detallan los eventos y acciones de un sensor , modelado con un botón.

## Solución
### Eventos
* **EV_SYS_01_DOWN**: el botón fue presionado.
* **EV_SYS_01_UP**: el botón dejó de ser presionado.

### Acciones
* **raise EV_ACT_LED_01_ON**: dispara el evento "encender led" para ser enviado al próximo módulo.
* **raise EV_ACT_LED_01_OFF**: dispara el evento "apagar led" para ser enviado al próximo módulo.

### Estados
* **ST_SYS_BUSY**: el sistema esta procesando un evento recibido.
* **ST_SYS_IDLE**: el sistema se encuentra libre a la espera de eventos.

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
      <td rowspan="2"><b>ST_BTN_01_UP</b></td>
      <td>EV_BTN_01_UP</td>
      <td></td>
      <td>ST_BTN_01_UP</td>
      <td></td>
    </tr>
    <tr>
      <td>EV_BTN_01_DOWN</td>
      <td></td>
      <td>ST_BTN_01_FALLING</td>
      <td>tick = DEL_BTN_01_MAX</td>
    </tr>
    <tr>
      <td rowspan="2">EV_BTN_01_DOWN</td>
      <td>[tick > 0]</td>
      <td>ST_BTN_01_RISING</td>
      <td>tick--</td>
    </tr>
    <tr>
      <td>[tick == 0]</td>
      <td>ST_BTN_01_DOWN</td>
      <td></td>
    </tr>
  </tbody>
</table>
