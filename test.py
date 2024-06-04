import numpy as np
from skimage import io, color

# Charger l'image
image_path = 'CerisierP.jpg'
image = io.imread(image_path)

# Convertir l'image en niveaux de gris
gray_image = color.rgb2gray(image)

# Convertir les niveaux de gris en une échelle de 0 à 255
gray_image = (gray_image * 255).astype(np.uint8)

# Calculer l'histogramme
hist, bin_edges = np.histogram(gray_image, bins=256, range=(0, 255))

# Définir les moments
def moment(gris_max, ordre_moment, histogramme, total_pixels):
    indices = np.arange(0, gris_max + 1)
    moment_val = np.sum(histogramme * (indices ** ordre_moment))
    return moment_val / total_pixels

# Dimensions de l'image
height, width = gray_image.shape
total_pixels = width * height

# Calculer les moments
gris_max = 255
m0 = moment(gris_max, 0, hist, total_pixels)
m1 = moment(gris_max, 1, hist, total_pixels)
m2 = moment(gris_max, 2, hist, total_pixels)
m3 = moment(gris_max, 3, hist, total_pixels)

# Afficher les moments pour vérifier
print(f'm0 = {m0}, m1 = {m1}, m2 = {m2}, m3 = {m3}')

# Matrice des coefficients et vecteur des constantes
A = np.array([[m0, m1], [m1, m2]])
b = np.array([m2, m3])

# Vérification de la non-singularité de la matrice A
if np.linalg.det(A) != 0:
    # Résolution du système d'équations
    x = np.linalg.solve(A, b)
    C0 = x[0]
    C1 = x[1]

    # Afficher les coefficients pour vérifier
    print(f'C0 = {C0}, C1 = {C1}')

    # Résoudre l'équation quadratique C0 + C1z + z^2 = 0
    solutions = np.roots([1, C1, C0])
    z0 = solutions[0]
    z1 = solutions[1]

    # Affichage des solutions pour vérification
    print(f'Les solutions de l\'équation quadratique sont : z0 = {z0}, z1 = {z1}')

    # Calculer le seuil comme la moyenne des solutions
    threshold = (z0 + z1) / 2
else:
    C0 = C1 = z0 = z1 = threshold = None
    print('La matrice A est singulière, le système n\'a pas de solution unique.')

print(f'Seuil de binarisation calculé = {threshold}')
