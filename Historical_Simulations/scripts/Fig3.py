import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Função para plotar gráfico de dispersão
def plot_scatter(ax, data, title, y_min, y_max):
    # Configurando cores e marcadores
    colors = {
        'CMCC-CM2-HR4': 'blue', 'CMCC-CM2-VHR4': 'blue',
        'CNRM-CM6-1': 'red', 'CNRM-CM6-1-HR': 'red',
        'EC-Earth3P': 'yellow', 'EC-Earth3P-HR': 'yellow',
        'ECMWF-IFS-LR': 'green', 'ECMWF-IFS-MR': 'green', 'ECMWF-IFS-HR': 'green',
        'FGOALS-f3-L': 'purple', 'FGOALS-f3-H': 'purple',
        'HadGEM3-GC31-LL': 'orange', 'HadGEM3-GC31-MM': 'orange', 'HadGEM3-GC31-HH': 'orange',
        'MPI-ESM1-2-LR': 'gray', 'MPI-ESM1-2-XR': 'gray',
        'ERA5': 'black'
    }
    
    markers = {
        'CMCC-CM2-HR4': 'o', 'CMCC-CM2-VHR4': 'o',
        'CNRM-CM6-1': 'o', 'CNRM-CM6-1-HR': 'o',
        'EC-Earth3P': 'o', 'EC-Earth3P-HR': 'o',
        'ECMWF-IFS-LR': 'o', 'ECMWF-IFS-MR': 'o', 'ECMWF-IFS-HR': 'o',
        'FGOALS-f3-L': 'o', 'FGOALS-f3-H': 'o',
        'HadGEM3-GC31-LL': 'o', 'HadGEM3-GC31-MM': 'o', 'HadGEM3-GC31-HH': 'o',
        'MPI-ESM1-2-LR': 'o', 'MPI-ESM1-2-XR': 'o',
        'ERA5': 's'
    }
    
    for index, row in data.iterrows():
        ax.scatter(row['Resolution'], row['AnnualTracks'], 
                   color=colors[row['Model']], 
                   marker=markers[row['Model']], 
                   label=row['Model'] if row['Model'] not in ax.get_legend_handles_labels()[1] else "")
    
    # Invertendo o eixo X
    ax.invert_xaxis()
    
    # Adicionando a linha de tendência
    x = data['Resolution']
    y = data['AnnualTracks']
    z = np.polyfit(x, y, 1)
    p = np.poly1d(z)
    ax.plot(x, p(x), "r--")
    
    # Adicionando a equação da linha de tendência
    equation_text = f"y = {z[0]:.2f}x + {z[1]:.2f}"
    ax.text(max(data['Resolution']) * 0.8, y_min + (y_max - y_min) * 0.1, equation_text, fontsize=12, color='red')
    
    ax.set_xlabel('Model Resolution in km')
    ax.set_ylabel('Annual track number')
    ax.set_title(title)
    ax.set_ylim([y_min, y_max])

# Lendo os arquivos de entrada
data1 = pd.read_csv('input1.txt', sep='\t', header=None, names=['Model', 'Resolution', 'AnnualTracks'])
data2 = pd.read_csv('input2.txt', sep='\t', header=None, names=['Model', 'Resolution', 'AnnualTracks'])

# Criando a figura e os eixos com largura reduzida
fig, axs = plt.subplots(1, 2, figsize=(12, 6), sharey=False)

# Plotando os dados
plot_scatter(axs[0], data1, 'a) All cyclones', 28, 44)
plot_scatter(axs[1], data2, 'b) Most intense cyclones', 0, 14)

# Adicionando a legenda ao lado direito, mais próxima dos gráficos
handles, labels = axs[0].get_legend_handles_labels()
fig.legend(handles, labels, loc='center left', bbox_to_anchor=(0.85, 0.5))

# Ajustando layout para evitar sobreposição
plt.tight_layout(rect=[0, 0, 0.85, 1])

# Salvando a figura em PNG
plt.savefig('scatter_plots.png', dpi=300, bbox_inches='tight')

# Mostrando o gráfico
plt.show()

