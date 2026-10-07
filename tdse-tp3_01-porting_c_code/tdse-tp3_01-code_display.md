El código proporcionado implementa un sistema embebido *bare-metal* basado en eventos (Event-Triggered System) utilizando una arquitectura cooperativa de tareas. A continuación se detalla el funcionamiento de la arquitectura, seguido por el análisis de las máquinas de estado solicitadas.

**Núcleo del Sistema y Sincronización**

* El archivo `app.c` contiene el bucle principal de la aplicación, el cual administra un arreglo de tareas (`task_cfg_list`) que incluye la inicialización y la actualización de `task_test` y `task_display`.


* La ejecución está gobernada por un contador de *ticks* del sistema (`g_app_tick_cnt`). Este contador se incrementa mediante la interrupción del sistema en `app_it.c` a través de `HAL_SYSTICK_Callback()` y se protege deshabilitando y habilitando las interrupciones en ensamblador al ser leído y modificado.


* El archivo `systick.c` complementa esto ofreciendo una función de retardo bloqueante en microsegundos (`systick_delay_us`) que lee directamente los registros del hardware `SysTick` y gestiona el desbordamiento del contador.



**Capa de Abstracción de Hardware (HAL) del Display**

* Los archivos `display.c` y `display.h` exponen la interfaz física para comunicarse con un controlador de display tipo LCD HD44780.


* Permiten inicializar el hardware en configuraciones GPIO de 4 u 8 bits y exponen funciones para posicionar el cursor calculando las direcciones de la memoria DDRAM y escribir cadenas de texto manejando los pines de control RS, RW y EN.



**Interfaz y Estructuras de Datos de las Tareas**

* Los archivos de atributos (`task_test_attribute.h` y `task_display_attribute.h`) definen las estructuras de memoria privadas para cada tarea. La tarea de display posee un buffer local de RAM (`ddram`) simulando una pantalla de 2 filas por 16 columnas, variables de estado y banderas de eventos.


* `task_display_interface.c` actúa como puente inter-tareas. Expone la función `put_event_task_display()`, la cual recibe un texto y coordenadas, lo copia dentro del buffer `ddram` y activa de forma segura la bandera de actualización `EV_DSP_UPDATE`.



---

### Análisis de `void task_test_statechart(void)`

Esta función, contenida en `task_test.c`, actúa como un generador de eventos periódicos para probar la interfaz del display. Su comportamiento es el siguiente:

* En cada llamado, incrementa incondicionalmente un contador interno de ciclos del sistema llamado `counter`.


* Utiliza una variable `tick` como un temporizador por software, decrementándola en cada ciclo siempre que sea mayor al valor mínimo definido (`DEL_TEST_XX_MIN`).


* Cuando `tick` llega a su límite, se restablece a su valor máximo (`DEL_TEST_XX_MAX`, correspondiente a 1000).


* Al ocurrir este desbordamiento, la tarea formatea un número de prueba dividiendo `counter` sobre el valor máximo de repetición, genera un *string*, y envía dos eventos secuenciales a la tarea del display mediante `put_event_task_display()`: primero la etiqueta estática "Test Nro: ******" y luego el número iterativo en una posición específica de la pantalla.



### Análisis de `void task_display_statechart(void)`

Ubicada en `task_display.c`, esta función implementa una Máquina de Estados Finitos (FSM) encargada de actualizar físicamente el LCD sin bloquear el resto del sistema. Opera mediante dos estados principales:

* **Estado `ST_DSP_IDLE`:** Es el estado de reposo. La máquina evalúa constantemente si la bandera del evento ha sido levantada (`flag == true`) y si el evento corresponde a una petición de actualización (`EV_DSP_UPDATE`). Si la condición se cumple, la máquina transiciona al estado `ST_DSP_UPDATE`.


* **Estado `ST_DSP_UPDATE`:** Tras validar nuevamente la existencia del evento de actualización, el sistema "consume" el evento bajando la bandera (`flag = false`). A continuación, vuelca todo el contenido del buffer virtual `ddram` hacia el hardware real: primero se posiciona en la fila 0 columna 0 y envía los datos de la primera línea, y luego repite el proceso para la fila 1. Finalmente, devuelve la máquina de estados a `ST_DSP_IDLE` para esperar nuevos comandos. Un estado `default` garantiza la recuperación del sistema forzando el retorno a `ST_DSP_IDLE` ante condiciones anómalas.
