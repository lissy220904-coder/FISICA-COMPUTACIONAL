import random
import statistics
#parametros
precio_venta=35
costo-fab=25
precio_remate=18
politicas_docenas=[2,3,4,5,6,7,8,9]

for docenas in politicas_docena:
producido=docenas*12
ganancias_mes=[]# Aqui guardamos los 30 dias

for dia in ranger(30):
#Generador de numeros aleatorios(Distribucion Uniforme)
demanda=random.randint(38,84)# de 3 a 7 docenas en piezas
#¿cuanto vendimos? no podemos vender mas de lo que tenemos
vendido=min(demanda,producido)
sobrante=max(0,producido-vendido)
#Remate:solo el 70% del sobrante
rematado=sobrante*0.7

#calculo de dinero
ingreso=(vendido*precio_venta)+(rematado*precio_remate)
costo_total= producido*costo_fab
ganancia-dia=ingreso-costo_total

ganancia_mes.append(ganancia_dia)
#calculos estadisticos(como en laboratotio de fisica)
promedio=statistics.mean(ganancias_mes)
desviacion=statistics.stdev(ganancias_mes)

print(f"produciendo{docenas}docenas:promendio=${promedio:.2f},Desviacio=${desviacion}:.2f}")

