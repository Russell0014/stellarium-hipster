FROM gcc:latest

# Install required development libraries
RUN apt-get update && apt-get install -y \
    libjpeg-dev \
    libpng-dev \
    libwebp-dev \
    zlib1g-dev \
    libtiff-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Create a non-root user
RUN useradd -m developer
USER developer

# Don't copy files - we'll use volume mount
ENV CFLAGS="-Iext_src/stb -Ofast -DNDEBUG -Wall -fopenmp -Wno-stringop-overflow"

CMD ["bash"]