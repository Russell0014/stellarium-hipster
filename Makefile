LIBS=-lm -ljpeg -lpng -lwebp -lz -ltiff

CFLAGS += -Iext_src/stb -Wall -Wno-stringop-overflow

ASAN_CFLAGS = -fsanitize=address -fsanitize=undefined -lasan -lubsan

all: hipster

hipster: src/*.c
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -f hipster

debug:
	$(CC) -o hipster src/*.c -Iext_src/stb -Og -g \
		$(CFLAGS) $(ASAN_CFLAGS) $(LIBS)

.PHONY: all clean debug
