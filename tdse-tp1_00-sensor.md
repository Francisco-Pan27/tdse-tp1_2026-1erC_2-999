# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry) - Módulo Sensor

## Descripción del proyecto
A continuación se detallan los eventos y acciones del módulo Sensor, modelado con un botón.

## Solución
### Eventos
* **EV_BTN_01_DOWN**: se presiona el botón.
* **EV_BTN_01_UP**: se suelta el botón.

### Acciones
* **tick=DEL_BTN_01_MIN**: define la cantidad de ticks mínima.
* **tick=DEL_BTN_01_MAX**: define la cantidad máxima de ticks para asegurar que el botón fue presionado o soltado y no se trata de un glitch.
* **tick--**: decrementa el valor del contador.
* **raise EV_SYS_XX_DOWN**: dispara el evento "botón presionado", que puede ser enviado al próximo módulo.
* **raise EV_SYS_XX_UP**: dispara el evento "botón soltado", que puede ser enviado al próximo módulo.

### Estados
* **ST_BTN_01_UP**: el botón no está siendo presionado, manteniéndose arriba.
* **ST_BTN_01_FALLING**: el botón está siendo presionado, hacia un posible cambio de estado.
* **ST_BTN_01_DOWN**: el botón está siendo presionado, manteniéndose abajo.
* **ST_BTN_01_RISING**: el botón no está siendo presionado, hacia un posible cambio de estado.

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
      <td>tick = DEL_BTN_01_MIN</td>
      <td>ST_BTN_01_UP</td>
      <td>raise EV_SYS_01_UP</td>
    </tr>
    <tr>
      <td>EV_BTN_01_DOWN</td>
      <td></td>
      <td>ST_BTN_01_FALLING</td>
      <td>tick = DEL_BTN_01_MAX</td>
    </tr>
    <tr>
      <td rowspan="4"><b>ST_BTN_01_FALLING</b></td>
      <td rowspan="2">EV_BTN_01_UP</td>
      <td>[tick > DEL_BTN_01_MIN]</td>
      <td>ST_BTN_01_FALLING</td>
      <td>tick--</td>
    </tr>
    <tr>
      <td>[tick == 0]</td>
      <td>ST_BTN_01_UP</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">EV_BTN_01_DOWN</td>
      <td>[tick > DEL_BTN_01_MIN]</td>
      <td>ST_BTN_01_FALLING</td>
      <td>tick--</td>
    </tr>
    <tr>
      <td>[tick == 0]</td>
      <td>ST_BTN_01_DOWN</td>
      <td>raise EV_SYS_01_DOWN</td>
    </tr>
    <tr>
      <td rowspan="2"><b>ST_BTN_01_DOWN</b></td>
      <td>EV_BTN_01_UP</td>
      <td></td>
      <td>ST_BTN_01_RISING</td>
      <td>tick = DEL_BTN_01_MAX</td>
    </tr>
    <tr>
      <td>EV_BTN_01_DOWN</td>
      <td></td>
      <td>ST_BTN_01_DOWN</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="4"><b>ST_BTN_01_RISING</b></td>
      <td rowspan="2">EV_BTN_01_UP</td>
      <td>[tick > DEL_BTN_01_MIN]</td>
      <td>ST_BTN_01_RISING</td>
      <td>tick--</td>
    </tr>
    <tr>
      <td>[tick == 0]</td>
      <td>ST_BTN_01_UP</td>
      <td>raise EV_SYS_01_UP</td>
    </tr>
    <tr>
      <td rowspan="2">EV_BTN_01_DOWN</td>
      <td>[tick > DEL_BTN_01_MIN]</td>
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
