import sys
from PIL import Image
import os

# print(sys.argv)
im = Image.open(sys.argv[1])


box = (100, 100, 400, 400)
region = im.crop(box).convert("RGB")
# print(os.environ["OUTPUT_FILE"])
region.save(os.environ["OUTPUT_FILE"])

print("ran succ")