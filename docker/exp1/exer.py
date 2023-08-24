import sys
from PIL import Image

# print(sys.argv)
im = Image.open(sys.argv[1])


box = (100, 100, 400, 400)
region = im.crop(box).convert("RGB")

region.save("./test_output.jpg")