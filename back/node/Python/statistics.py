import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Datos iniciales (puedes reemplazarlos por una fuente dinámica)
datos = [
    {"nombre": "Alice", "aciertos": 15, "errores": 5, "puntos": 50},
    {"nombre": "Bob", "aciertos": 10, "errores": 10, "puntos": 40},
    {"nombre": "Carlos", "aciertos": 20, "errores": 2, "puntos": 80},
    {"nombre": "Diana", "aciertos": 8, "errores": 12, "puntos": 30},
]

# Convertir datos a un DataFrame de pandas
df = pd.DataFrame(datos)

# Calcular estadísticas adicionales
df["porcentaje_aciertos"] = (df["aciertos"] / (df["aciertos"] + df["errores"])) * 100

# Estadísticas grupales
promedio_puntos = df["puntos"].mean()
promedio_aciertos = df["aciertos"].mean()
promedio_errores = df["errores"].mean()

print("=== Estadísticas generales ===")
print(f"Promedio de puntos: {promedio_puntos:.2f}")
print(f"Promedio de aciertos: {promedio_aciertos:.2f}")
print(f"Promedio de errores: {promedio_errores:.2f}")

# Ordenar jugadores por puntos para el ranking
ranking = df.sort_values(by="puntos", ascending=False)

print("\n=== Ranking de jugadores ===")
print(ranking[["nombre", "puntos", "porcentaje_aciertos"]])

# Visualización de los datos
def graficar_puntos(df):
    """Generar un gráfico de barras de puntos por jugador."""
    plt.figure(figsize=(8, 5))
    plt.bar(df["nombre"], df["puntos"], color="skyblue")
    plt.xlabel("Jugadores", fontsize=12)
    plt.ylabel("Puntos", fontsize=12)
    plt.title("Puntos Totales por Jugador", fontsize=14)
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.show()

def graficar_aciertos_vs_errores(df):
    """Generar un gráfico comparativo entre aciertos y errores."""
    x = np.arange(len(df["nombre"]))  # Posiciones en el eje X
    ancho = 0.4  # Ancho de las barras

    plt.figure(figsize=(8, 5))
    plt.bar(x - ancho/2, df["aciertos"], width=ancho, label="Aciertos", color="green")
    plt.bar(x + ancho/2, df["errores"], width=ancho, label="Errores", color="red")

    plt.xticks(x, df["nombre"])
    plt.xlabel("Jugadores", fontsize=12)
    plt.ylabel("Cantidad", fontsize=12)
    plt.title("Comparación de Aciertos y Errores", fontsize=14)
    plt.legend()
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.show()

# Llamar a las funciones de visualización
graficar_puntos(df)
graficar_aciertos_vs_errores(df)