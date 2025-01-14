import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from pymongo import MongoClient

# Conectar a MongoDB
cliente = MongoClient("mongodb://localhost:3000/api/onlinegames")  # Cambia la URI si es necesario
db = cliente["GoMath"]  # Base de datos
coleccion = db["Online-Games"]     # Colección para los datos

# Obtener los datos desde MongoDB
datos = list(coleccion.find({}, {"_id": 0, "player_email": 1, "preguntasAcertadas": 1, "preguntasFallidas": 1, "puntos": 1}))

# Verificar si se obtuvieron datos
if not datos:
    print("No se encontraron datos en la colección.")
    exit()

# Convertir datos a un DataFrame de pandas
df = pd.DataFrame(datos)

# Calcular estadísticas adicionales
df["porcentaje_aciertos"] = (df["preguntasAcertadas"] / (df["preguntasAcertadas"] + df["preguntasFallidas"])) * 100

# Estadísticas grupales
promedio_puntos = df["puntos"].mean()
promedio_aciertos = df["preguntasAcertadas"].mean()
promedio_errores = df["preguntasFallidas"].mean()

print("=== Estadísticas generales ===")
print(f"Promedio de puntos: {promedio_puntos:.2f}")
print(f"Promedio de aciertos: {promedio_aciertos:.2f}")
print(f"Promedio de errores: {promedio_errores:.2f}")

# Ordenar jugadores por puntos para el ranking
ranking = df.sort_values(by="puntos", ascending=False)

print("\n=== Ranking de jugadores ===")
print(ranking[["player_email", "puntos", "porcentaje_aciertos"]])

# Visualización de los datos
def graficar_puntos(df):
    """Generar un gráfico de barras de puntos por jugador."""
    plt.figure(figsize=(8, 5))
    plt.bar(df["player_email"], df["puntos"], color="skyblue")
    plt.xlabel("Jugadores", fontsize=12)
    plt.ylabel("Puntos", fontsize=12)
    plt.title("Puntos Totales por Jugador", fontsize=14)
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.show()

def graficar_aciertos_vs_errores(df):
    """Generar un gráfico comparativo entre aciertos y errores."""
    x = np.arange(len(df["player_email"]))  # Posiciones en el eje X
    ancho = 0.4  # Ancho de las barras

    plt.figure(figsize=(8, 5))
    plt.bar(x - ancho/2, df["preguntasAcertadas"], width=ancho, label="Aciertos", color="green")
    plt.bar(x + ancho/2, df["preguntasFallidas"], width=ancho, label="Errores", color="red")

    plt.xticks(x, df["player_email"])
    plt.xlabel("Jugadores", fontsize=12)
    plt.ylabel("Cantidad", fontsize=12)
    plt.title("Comparación de Aciertos y Errores", fontsize=14)
    plt.legend()
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.show()

# Llamar a las funciones de visualización
graficar_puntos(df)
graficar_aciertos_vs_errores(df)