CFLAGS  = -g -Wall -O2
CC      = gcc
LIBS    =
TARGETDIR = ./bin
TARGET  = $(TARGETDIR)/pngparser
INCLUDE = 
SRCDIR  = ./src
SRCS    = $(wildcard $(SRCDIR)/*.c) # ./src/*.c
OBJDIR  = ./obj
OBJS    = $(addprefix $(OBJDIR)/, $(notdir $(SRCS:.c=.o))) # obj/*.o
DEPS    = $(OBJECTS:.o=.d)

all: clean $(TARGET)

-include $(DEPS)

$(TARGET): $(OBJS)
	-mkdir -p $(TARGETDIR)
	$(CC) -o $@ $^ $(LIBS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	-mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<

pngtest:
	$(TARGET) images/sample.png
pngtest2:
	$(TARGET) images/sample2.png

.PHONY: clean
clean:
	rm -f $(OBJS) $(DEPS) $(TARGET)
