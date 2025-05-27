import numpy as np
import matplotlib.pyplot as plt

# Função para carregar os dados dos arquivos
def load_data(filename):
    return np.loadtxt(filename)

# Carregar os dados dos arquivos
highres_data = load_data('highresmodels.txt')
lowres_data = load_data('lowresmodels.txt')
era5_data = load_data('era5.txt')

# Separar as colunas dos dados
x_highres = highres_data[:, 0]
mean_highres = highres_data[:, 1]
min_highres = highres_data[:, 2]
max_highres = highres_data[:, 3]

x_lowres = lowres_data[:, 0]
mean_lowres = lowres_data[:, 1]
min_lowres = lowres_data[:, 2]
max_lowres = lowres_data[:, 3]

x_era5 = era5_data[:, 0]
mean_era5 = era5_data[:, 1]

# Filtrar dados para o inside plot (relative vorticity > 20.0)
mask_highres = x_highres > 20.0
mask_lowres = x_lowres > 20.0
mask_era5 = x_era5 > 20.0

x_highres_inside = x_highres[mask_highres]
mean_highres_inside = mean_highres[mask_highres]

x_lowres_inside = x_lowres[mask_lowres]
mean_lowres_inside = mean_lowres[mask_lowres]

x_era5_inside = x_era5[mask_era5]
mean_era5_inside = mean_era5[mask_era5]

# Criar o gráfico
fig, ax = plt.subplots(figsize=(6, 6))

# Plotar highresmodels.txt
ax.plot(x_highres, mean_highres, color='blue')
ax.fill_between(x_highres, min_highres, max_highres, color='blue', alpha=0.3)

# Plotar lowresmodels.txt
ax.plot(x_lowres, mean_lowres, color='red')
ax.fill_between(x_lowres, min_lowres, max_lowres, color='red', alpha=0.3)

# Plotar era5.txt
ax.plot(x_era5, mean_era5, color='black')

# Configurações do gráfico
ax.set_xlabel('Relative Vorticity')
ax.set_ylabel('Frequency')
ax.set_title('Maximum intensity distribution')
ax.grid(False)

# Ajustar os limites do eixo x
ax.set_xlim(0, 60)

# Criar o inside plot
ax_inset = fig.add_axes([0.55, 0.55, 0.3, 0.3])

# Plotar dados filtrados no inside plot
ax_inset.plot(x_highres_inside, mean_highres_inside, color='blue')
ax_inset.plot(x_lowres_inside, mean_lowres_inside, color='red')
ax_inset.plot(x_era5_inside, mean_era5_inside, color='black')

# Configurações do inside plot
ax_inset.set_xlim(20, 60)
ax_inset.set_xlabel('Relative Vorticity', fontsize=10)
ax_inset.set_ylabel('Frequency', fontsize=10)
ax_inset.grid(False)

# Ajustar a posição da legenda para a direita do gráfico principal
#ax.legend(loc='center left', bbox_to_anchor=(1, 0.5), ncol=1)

# Salvar a figura em alta resolução
plt.savefig('vorticity_plot.png', dpi=300, bbox_inches='tight')

# Mostrar o gráfico
plt.show()

