% ========================================
% SISTEMA DE RECOMENDACIÓN DE VEHÍCULOS
% Implementación en Prolog
% ========================================

% --- JERARQUÍA DE CLASES ---

% Tipos de motores
motor_electrico(motorTeslaModelS).
motor_gasolina(motorCadillacV6).
motor_hibrido(motorToyotaHybrid).

% Subsunción: todos son motores
motor(M) :- motor_electrico(M).
motor(M) :- motor_gasolina(M).
motor(M) :- motor_hibrido(M).

% Personas
mecanico(antonio).
mecanico(martin).
persona(P) :- mecanico(P).

% Vehículos
auto(tesla).
auto(toyota).
auto(cadillac).

% --- PROPIEDADES DE OBJETO ---

tiene_motor(tesla, motorTeslaModelS).
tiene_motor(toyota, motorToyotaHybrid).
tiene_motor(cadillac, motorCadillacV6).

% --- PROPIEDADES DE DATOS: VEHÍCULOS ---

tiene_precio(tesla, 1000000).
tiene_precio(toyota, 900000).
tiene_precio(cadillac, 2000000).

tiene_color(tesla, blanco).
tiene_color(toyota, rojo).
tiene_color(cadillac, cereza).

% --- PROPIEDADES DE DATOS: MOTORES ---

caballos_fuerza(motorTeslaModelS, 670).
caballos_fuerza(motorToyotaHybrid, 181).
caballos_fuerza(motorCadillacV6, 335).

torque(motorTeslaModelS, 1000).
torque(motorToyotaHybrid, 190).
torque(motorCadillacV6, 400).

cilindrada(motorCadillacV6, 3.6).
cilindrada(motorToyotaHybrid, 2.0).

capacidad_bateria(motorTeslaModelS, 100.0).
capacidad_bateria(motorToyotaHybrid, 1.6).

autonomia_electrica(motorTeslaModelS, 500).
autonomia_electrica(motorToyotaHybrid, 50).

% --- REGLAS DE CONSULTA ---

% Vehículos eléctricos
vehiculo_electrico(Auto, Motor) :-
    auto(Auto),
    tiene_motor(Auto, Motor),
    motor_electrico(Motor).

% Vehículos con potencia
vehiculo_con_potencia(Auto, Motor, HP) :-
    auto(Auto),
    tiene_motor(Auto, Motor),
    caballos_fuerza(Motor, HP).

% Alto rendimiento
vehiculo_alto_rendimiento(Auto, HP) :-
    auto(Auto),
    tiene_motor(Auto, Motor),
    caballos_fuerza(Motor, HP),
    HP > 500.

% Alto torque
vehiculo_alto_torque(Auto, T) :-
    auto(Auto),
    tiene_motor(Auto, Motor),
    torque(Motor, T),
    T > 500.

% Consulta precios
vehiculo_precio(Auto, Precio) :-
    auto(Auto),
    tiene_precio(Auto, Precio).

% Vehículos económicos
vehiculo_economico(Auto, Precio) :-
    auto(Auto),
    tiene_precio(Auto, Precio),
    Precio < 910000.

% Recomendación combinada
recomendacion_rendimiento_precio(Auto, Precio, HP) :-
    auto(Auto),
    tiene_precio(Auto, Precio),
    tiene_motor(Auto, Motor),
    caballos_fuerza(Motor, HP),
    HP > 250,
    Precio < 3100000.

% Vehículos ecológicos
vehiculo_ecologico(Auto) :-
    tiene_motor(Auto, Motor),
    (motor_electrico(Motor) ; motor_hibrido(Motor)).

% --- FIN DEL PROGRAMA ---