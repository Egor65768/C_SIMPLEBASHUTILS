FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y bash && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /home/
COPY s21_cat .
COPY tests.sh .
WORKDIR /home/test
COPY test .
WORKDIR /home/
RUN chmod +x ./tests.sh
CMD ["./tests.sh"]