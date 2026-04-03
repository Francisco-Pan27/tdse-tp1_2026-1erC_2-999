# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry) - Módulo Actuator

## Descripción del proyecto
A continuación se detallan los eventos y acciones del módulo Actuator, modelado como un único LED que responde a los eventos generados por el módulo System.

## Solución

### Estructura
El módulo posee una interfaz donde el módulo System deja los mensajes a procesar (en una estructura específica para ello denominada ```message_queue``` en la tabla de abajo), y un núcleo de actuación que toma los mensajes de a uno. El objetivo de este diseño es que sea no bloqueante.

### Eventos
 * **EV_ACT_LED_ON**: dispara el evento "encender LED"             
 * **EV_ACT_LED_BLINK**: dispara el evento "parpadear LED "
 * **EV_ACT_LED_PULSE**: dispara el evento "pulso LED " 
 * **EV_ACT_LED_OFF**: dispara el evento "apagar LED" 

### Acciones
 * **led=LED_ON**: Se enciende el LED.             
 * **led=LED_OFF**: Se apaga el LED.
 * **color=[R,G,B]**: Se especifica el color del LED.

### Estados
* **ST_ACT_LED_ON:** El LED se encuentra encendido.
* **ST_ACT_LED_BLINK**: El LED  parpadea.
* **ST_ACT_LED_PULSE**: Se enciede una sola vez el LED.
* **ST_ACT_LED_OFF**: El LED no esta encendido. 

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
      <td rowspan="3"><b>ST_ACT_LED_OFF</b></td>
      <td>EV_ACT_LED_ON</td>
      <td>color!=NULL</td>
      <td>ST_ACT_LED_ON</td>
      <td>led=LED_ON</td>
    </tr>
    <tr>
      <td>EV_ACT_LED_BLINK</td>
      <td>color!=NULL</td>
      <td>ST_ACT_LED_BLINK</td>
      <td>led=LED_ON</td>
    </tr>
    <tr>
      <td>EV_ACT_LED_PULSE</td>
      <td>color!=NULL</td>
      <td>ST_ACT_LED_PULSE</td>
      <td>led=LED_ON</td>
    </tr>
    <tr>
      <td><b>ST_ACT_LED_ON</b></td>
      <td>EV_ACT_LED_OFF</td>
      <td></td>
      <td>ST_ACT_LED_OFF</td>
      <td>led=LED_OFF</td>
    </tr>
    <tr>
      <td><b>ST_ACT_LED_BLINK</b></td>
      <td>EV_ACT_LED_OFF</td>
      <td></td>
      <td>ST_ACT_LED_OFF</td>
      <td>led=LED_OFF</td>
    </tr>
    <tr>
      <td><b>ST_ACT_LED_PULSE</b></td>
      <td>EV_ACT_LED_OFF</td>
      <td></td>
      <td>ST_ACT_LED_OFF</td>
      <td>led=LED_OFF</td>
    </tr>
  </tbody>
</table>
