
# Build environment can be configured the following
# environment variables:
#   CC : Specify the C compiler to use
#   CFLAGS : Specify compiler options to use

LIB_HDRS = libcrex.h
LIB_SRCS = crex.c firfilter.c
LIB_OBJS = $(LIB_SRCS:.c=.o)
LIB_A = libcrex.a

CFLAGS += -I. -DPACKAGE_VERSION=\"1.0.0\"

all: static

static: $(LIB_A)

# Build static library
$(LIB_A): $(LIB_OBJS) $(LIB_HDRS)
	rm -f $(LIB_A)
	ar -crs $(LIB_A) $(LIB_OBJS)

clean:
	rm -f $(LIB_OBJS) $(LIB_A)

install:
	@echo
	@echo "No install target, copy the library and header as needed"
	@echo

.SUFFIXES: .c .o

# Standard object building
.c.o: $(LIB_HDRS)
	$(CC) $(CFLAGS) -c $< -o $@

