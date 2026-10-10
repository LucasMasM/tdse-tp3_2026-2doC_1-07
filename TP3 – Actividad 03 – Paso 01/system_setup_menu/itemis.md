Statechart Definitions:
interface:
    in event evEnter
    in event evNext
    in event evEscape

    // Variables de navegación
    var motor_sel: integer = 1  // Para elegir entre Motor 1 (1) y Motor 2 (2)
    var param_sel: integer = 1  // Para elegir entre Power (1), Speed (2) y Spin (3)

    // Valores del Motor 1
    var power1: integer = 0     // 0 = OFF, 1 = ON
    var speed1: integer = 0     // Rango 0 a 9
    var spin1: integer = 0      // 0 = LEFT, 1 = RIGHT

    // Valores del Motor 2
    var power2: integer = 0
    var speed2: integer = 0
    var spin2: integer = 0

Imagen:
<img width="1227" height="625" alt="image" src="https://github.com/user-attachments/assets/d8bd3fee-9932-40d4-82a2-ecda267c078b" />
