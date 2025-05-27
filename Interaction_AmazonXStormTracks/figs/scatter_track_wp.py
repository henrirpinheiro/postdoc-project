import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime

# Carrega os dados
df = pd.read_csv('data.txt', sep='\t', skiprows=1, names=['date', 'tracks_anom', 'wv_anom'])

# Converte o campo de data
df['date'] = pd.to_datetime(df['date'].str.replace(':00:00', ''), format='%Y')

# Cria o gráfico
plt.figure(figsize=(10, 8))
sc = plt.scatter(df['tracks_anom'], df['date'], c=df['wv_anom'], cmap='coolwarm', edgecolor='k')

# Eixos e rótulos
plt.xlabel('Anomalia no nº de trajetórias de ciclones')
plt.ylabel('Tempo (ano)')
plt.title('Série temporal de anomalias mensais\n(trajetórias de ciclones vs vapor d\'água)')
plt.gca().invert_yaxis()

# Barra de cores
cbar = plt.colorbar(sc)
cbar.set_label('Anomalia de vapor d\'água')

# Salva a figura em PNG com 300 dpi
plt.savefig('anomalias_ciclones_vapor.png', dpi=300, bbox_inches='tight')

plt.tight_layout()
plt.show()


