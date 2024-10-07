FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y bash && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /home/
COPY s21_grep .
COPY s21_grep.c .
COPY s21_grep.h .
COPY test_grep.sh .
WORKDIR /home/test_files
COPY test_files .
WORKDIR /home/
RUN chmod +x ./test_grep.sh
CMD ["./test_grep.sh"]