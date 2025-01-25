from PIL import Image

# Load the original image
original_image = Image.open('apple.jpg')

# Loop to create 10 duplicates
for i in range(1, 11):
    # Save the image in PNG format with the new name
    original_image.save(f'product{i}.png')