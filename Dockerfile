FROM debian:stable-slim
MAINTAINER rafabaptista
RUN echo rafabaptista
COPY . .

# If you want to run any other commands use "RUN" before.

RUN apt update && \
    apt install -y --no-install-recommends p7zip-full && \
    apt install -y wget python3 python3-pip p7zip-full > apti.log && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    7z -h

#RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full > apti.log
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/blob/main/Goi5.1.bin.7z" -O Goi5_1.bin.7z \
&& 7z e Goi5_1.bin.7z && rm Goi5_1.bin.7z && mv Goi5_1.bin engines/books/Goi5_1.bin

RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/blob/main/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z \
&& 7z e Cerebellum3Merge.bin.7z && rm Cerebellum3Merge.bin.7z && mv Cerebellum3Merge.bin engines/books/Cerebellum3Merge.bin

RUN chmod +x engines/stockfish15
#Engine name ^^^^^^^^^^^^^^^^^^^

CMD python3 lichess-bot.py -u