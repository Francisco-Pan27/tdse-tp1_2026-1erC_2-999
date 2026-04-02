# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry) - Módulo System

## Descripción del proyecto
A continuación se detallan los eventos y acciones del módulo System para un único sistema.

## Solución

### Estructura
El módulo posee una interfaz donde el módulo Sensor deja los mensajes a procesar (en una estructura específica para ello denominada ```message_queue``` en la tabla de abajo), y un núcleo de procesamiento que toma los mensajes de a uno. El objetivo de este diseño es que sea no bloqueante.

### Eventos
* **EV_SYS_SENSOR_COIL_DETECTOR**: El sensor detecta presencia de un vehículo.  
* **EV_SYS_MANUAL_BUTTON_PRESS**: El usuario presiona el botón.
* **EV_SYS_NOT_SENSOR_COIL_DETECTOR**: El sensor deja de detectar un vehículo.

### Acciones
* **raise EV_ACT_LED_RED_ON**: dispara el evento "encender LED rojo" para ser enviado al próximo módulo.
* **raise EV_ACT_LED_RED_BLINK**: dispara el evento "parpadear LED rojo" para ser enviado al próximo módulo.
* **raise EV_ACT_LED_YELLOW_ON**: dispara el evento "encender LED amarillo" para ser enviado al próximo módulo.
* **raise EV_ACT_LED_GREEN_ON**: dispara el evento "encender LED verde" para ser enviado al próximo módulo.
* **raise EV_ACT_LED_RED_PULSE**: dispara el evento "pulso LED rojo" para ser enviado al próximo módulo.
* **raise EV_ACT_LED_OFF**: dispara el evento "apagar LED" para ser enviado al próximo módulo.

### Estados
* **ST_SYS_IDLE**: El sistema se encuentra a la espera de eventos.
* **ST_SYS_CAR_ARRIVE**: Se detecta la llegada de un vehículo.
* **ST_SYS_PRINT_TICKET**: Se imprime el comprabante de llegada.
* **ST_SYS_RISING_BARRIER**: Se está levantando la barrera.
* **ST_SYS_UP_BARRIER**: La barrera se encuentra levantada permitiendo el paso del vehículo.
* **ST_SYS_LOWERING_BARRIER**: Se está bajando la barrera.
* **ST_SYS_DOWN_BARRIER**:  La barrera se encuentra abajo impidiendo el paso del vehículo.

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
      <td>EV_SYS_SENSOR_COIL_DETECTOR</td>
      <td></td>
      <td>ST_SYS_CAR_ARRIVE</td>
      <td>raise EV_ACT_LED_RED_ON</td>
    </tr>
    <tr>
      <td rowspan="1"><b>ST_SYS_CAR_ARRIVE</b></td>
      <td>EV_SYS_MANUAL_BUTTON_PRESS</td>
      <td></td>
      <td>ST_SYS_PRINT_TICKET</td>
      <td>tick = DEL_SYS_PRINT <br> <tt>raise</tt> EV_ACT_LED_RED_BLINK </td>
    </tr>
    <tr>
      <td rowspan="2">ST_SYS_PRINT_TICKET</td>
      <td></td>
      <td>[tick > 0]</td>
      <td>ST_SYS_PRINT_TICKET</td>
      <td><tt>tick--</tt></td>
    </tr>
    <tr>
      <td></td>
      <td>[tick == 0]</td>
      <td>ST_SYS_RISING_BARRIER</td>
      <td><tt>tick = DEL_SYS_BARRIER</tt> <br> <tt>raise</tt> EV_ACT_LED_YELLOW_ON </td>
    </tr>
    <tr>
      <td rowspan="2">ST_SYS_RISING_BARRIER</td>
      <td></td>
      <td>[tick > 0]</td>
      <td>ST_SYS_RISING_BARRIER</td>
      <td><tt>tick--</tt></td>
    </tr>
    <tr>
      <td></td>
      <td>[tick == 0]</td>
      <td>ST_SYS_UP_BARRIER</td>
      <td><tt>raise</tt> EV_ACT_LED_GREEN_ON </td>
    </tr>
    <tr>
      <td rowspan="1">ST_SYS_UP_BARRIER</td>
      <td>EV_SYS_NOT_SENSOR_COIL_DETECTOR</td>
      <td></td>
      <td>ST_SYS_LOWERING_BARRIER</td>
      <td><tt>tick = DEL_SYS_BARRIER</tt> <br> <tt>raise</tt> EV_ACT_LED_YELLOW_ON</td>
    </tr>
    <tr>
      <td rowspan="2">ST_SYS_LOWERING_BARRIER</td>
      <td></td>
      <td>[tick > 0]</td>
      <td>ST_SYS_LOWERING_BARRIER</td>
      <td><tt>tick--</tt></td>
    </tr>
    <tr>
      <td></td>
      <td>[tick == 0]</td>
      <td>ST_SYS_DOWN_BARRIER</td>
      <td><tt>raise</tt> EV_ACT_LED_RED_PULSE </td>
    </tr>
    <tr>
      <td rowspan="1">ST_SYS_DOWN_BARRIER</td>
      <td></td>
      <td></td>
      <td>ST_SYS_IDLE</td>
      <td><tt>raise</tt> EV_ACT_LED_OFF</td>
    </tr>
  </tbody>
</table>
