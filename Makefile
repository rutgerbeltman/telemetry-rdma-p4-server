CC=gcc
CFLAGS=-Wall -Werror -O2
INCLUDES=
LDFLAGS=
LIBS=-pthread -lrdmacm -libverbs

SRCS=rdma.c
OBJS=$(SRCS:.c=.o)
PROG=rdma-tutorial

all: $(PROG)

debug: CFLAGS=-Wall -Werror -g -DDEBUG
debug: $(PROG)

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)

clean:
	$(RM) *.o *~ $(PROG)
