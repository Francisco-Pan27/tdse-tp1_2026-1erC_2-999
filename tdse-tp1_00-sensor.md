# Intelligent Parking Management System - Automated Parking System - Parking Ticket Dispenser Machine (Entry)

## Descripción del proyecto
A continuación se detallan los eventos y acciones de un sensor, modelado con un botón.

## Solución
### Eventos
* **EV_BTN_01_DOWN**: se presiona el botón.
* **EV_BTN_01_UP**: se suelta el botón.

### Acciones
* tick=DEL_BTN_01_MAX: define el tiempo máximo espera para asegurar que el botón fue presionado o soltado y no se trata de un glitch.
* tick--: decrementa el valor del contador.
* raise EV_SYS_XX_DOWN: dispara el evento presionar botón.
* raise EV_SYS_XX_UP: dispara el evento soltar botón.
