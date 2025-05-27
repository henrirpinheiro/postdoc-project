import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Carrega os dados
df = pd.read_csv('data.txt', sep='\t', skiprows=1, names=['date', 'tracks_anom', 'wv_anom'])

# Cria uma sequência mensal de datas de março/1980 a dezembro/2010
date_range = pd.date_range(start='1980-03-01', periods=len(df), freq='MS')
df['date'] = date_range

# Cria o gráfico
fig, ax1 = plt.subplots(figsize=(14, 6))

# Plot da anomalia de número de ciclones (linha)
ax1.plot(df['date'], df['tracks_anom'], color='black', label='Anomalia de nº de ciclones')
ax1.set_ylabel('Anomalia de nº de ciclones', color='black')
ax1.tick_params(axis='y', labelcolor='black')

# Cria eixo secundário para a anomalia de vapor d'água
ax2 = ax1.twinx()

# Define cores para barras positivas e negativas
colors = ['royalblue' if val >= 0 else 'orangered' for val in df['wv_anom']]

# Plot das barras (vapor d'água)
ax2.bar(df['date'], df['wv_anom'], width=25, color=colors, alpha=0.6, label='Anomalia de vapor d\'água')
ax2.set_ylabel('Anomalia de vapor d\'água', color='gray')
ax2.tick_params(axis='y', labelcolor='gray')

# Eixos e layout
ax1.set_title('Anomalias mensais: nº de ciclones (linha) e vapor d\'água (barras)')
ax1.set_xlabel('Ano')
fig.autofmt_xdate()

# Legendas
lines_1, labels_1 = ax1.get_legend_handles_labels()
lines_2, labels_2 = ax2.get_legend_handles_labels()
ax1.legend(lines_1 + lines_2, labels_1 + labels_2, loc='upper right')

# Salvar a figura
plt.savefig('anomalias_ciclones_barras_vapor.png', dpi=300, bbox_inches='tight')

plt.tight_layout()
plt.show()

