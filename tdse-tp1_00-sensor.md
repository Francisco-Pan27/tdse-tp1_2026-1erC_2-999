# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry)

## Descripción del proyecto
A continuación se detallan los eventos y acciones de un sensor, modelado con un botón.

## Solución
### Eventos
* **EV_BTN_01_DOWN**: se presiona el botón.
* **EV_BTN_01_UP**: se suelta el botón.

### Acciones
* **tick=DEL_BTN_01_MAX**: define el tiempo máximo espera para asegurar que el botón fue presionado o soltado y no se trata de un glitch.
* **tick--**: decrementa el valor del contador.
* **raise EV_SYS_XX_DOWN**: dispara el evento presionar botón.
* **raise EV_SYS_XX_UP**: dispara el evento soltar botón.


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
      <td rowspan="4"><b>ST_BTN_01_FALLING</b></td>
      <td rowspan="2">EV_BTN_01_UP</td>
      <td>[tick > 0]</td>
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
      <td>[tick > 0]</td>
      <td>ST_BTN_01_FALLING</td>
      <td>tick--</td>
    </tr>
    <tr>
      <td>[tick == 0]</td>
      <td>ST_BTN_01_DOWN</td>
      <td>raise EV_SYS_01_DOWN</td>
    </tr>
    <tr>
      <td rowspan="4"><b>ST_BTN_01_RISING</b></td>
      <td rowspan="2">EV_BTN_01_UP</td>
      <td>[tick > 0]</td>
      <td>ST_BTN_01_RAISING</td>
      <td>tick--</td>
    </tr>
    <tr>
      <td>[tick == 0]</td>
      <td>ST_BTN_01_UP</td>
      <td>raise EV_SYS_01_UP</td>
    </tr>
    <tr>
      <td rowspan="2">EV_BTN_01_DOWN</td>
      <td>[tick > 0]</td>
      <td>ST_BTN_01_RAISING</td>
      <td>tick--</td>
    </tr>
    <tr>
      <td>[tick == 0]</td>
      <td>ST_BTN_01_UP</td>
      <td></td>
    </tr>
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
  </tbody>
</table>
