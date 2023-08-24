From python:3

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

ENV OUTPUT_FILE="./output.jpg"

CMD [ "python","exer.py","./test.webp" ]