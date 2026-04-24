(* 1. Definición de Parámetros del Sistema *)
dt = 0.05;           (* Paso de tiempo *)
tMax = 10.0;         (* Tiempo total *)
pasos = Round[tMax/dt];
k = 1.0;             (* Constante elástica *)
m = 1.0;             (* Masa *)

(* 2. Definición de la Aceleración (Instrucción para la máquina) *)
(* Optimizamos definiendo una función simple *)
a[x_] := - (k/m) * x;

(* 3. Condiciones Iniciales *)
x0 = 1.0;            (* Posición inicial *)
v0 = 0.0;            (* Velocidad inicial *)

(* El método de Verlet requiere la posición anterior x(t-dt) *)
xAnterior = x0 - v0*dt + 0.5*a[x0]*dt^2;

(* 4. Implementación del Algoritmo (Optimizado con NestList) *)
(* En Mathematica, NestList es mucho más rápido que un bucle For/While *)
(* Guardamos pares de {x_anterior, x_actual} *)

trayectoria = NestList[
    { #[[2]], 2.0 * #[[2]] - #[[1]] + a[#[[2]]] * dt^2 } &,
    {xAnterior, x0},
    pasos
];

(* Extraemos solo las posiciones actuales *)
posiciones = trayectoria[[All, 2]];

(* 5. Exportación de Resultados *)
(* Como estás en el cluster, lo guardamos para el PDF repositorio *)
Export["resultados_verlet.txt", posiciones, "Table"];

Print["Tarea 6 completada. El archivo 'resultados_verlet.txt' ha sido generado.$

