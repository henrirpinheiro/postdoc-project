import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import pearsonr

# Carrega os dados
df = pd.read_csv('data_wv.txt', sep='\t', skiprows=1, names=['date', 'tracks_anom', 'wv_anom'])

# Gera datas mensais a partir de março/1980
date_range = pd.date_range(start='1980-03-01', periods=len(df), freq='MS')
df['date'] = date_range
df['year'] = df['date'].dt.year
df['month'] = df['date'].dt.month

# Define estações
def get_season(month):
    if month in [12, 1, 2]:
        return 'DJF'
    elif month in [3, 4, 5]:
        return 'MAM'
    elif month in [6, 7, 8]:
        return 'JJA'
    elif month in [9, 10, 11]:
        return 'SON'

df['season'] = df['month'].apply(get_season)
df.loc[df['month'] == 12, 'year'] += 1  # Ajusta ano para DJF

# Agrupa por ano e estação
seasonal_means = df.groupby(['year', 'season'])[['tracks_anom', 'wv_anom']].mean().reset_index()

# Cria subplots
fig, axes = plt.subplots(4, 1, figsize=(12, 10), sharex=True)
seasons = ['DJF', 'MAM', 'JJA', 'SON']
colors = ['tab:blue', 'tab:green', 'tab:orange', 'tab:red']

for i, season in enumerate(seasons):
    ax = axes[i]
    data = seasonal_means[seasonal_means['season'] == season]
    
    # Plot
    ax.plot(data['year'], data['tracks_anom'], label='Ciclones (linha)', color='black')
    ax.bar(data['year'], data['wv_anom'], color='gray', alpha=0.6, label='Vapor d\'água (barra)')
    ax.set_title(f'{season}', loc='left')
    ax.axhline(0, color='gray', linestyle='--', linewidth=0.8)
    ax.legend(loc='upper right')
    
    # Correlação
    if len(data) > 1:
        r, p = pearsonr(data['tracks_anom'], data['wv_anom'])
        ax.text(0.02, 0.85, f'r = {r:.2f}', transform=ax.transAxes, fontsize=10, bbox=dict(facecolor='white', edgecolor='gray', alpha=0.7))

axes[-1].set_xlabel('Ano')
plt.tight_layout()

# Salva a figura
plt.savefig('anomalias_sazonais_ciclones_vapor_correlacao.png', dpi=300, bbox_inches='tight')
plt.show()

