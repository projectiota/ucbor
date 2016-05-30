##
# Copyright (c) Project Iota
#
# uCbor is licensed under an Apache license, version 2.0 license.
# All rights not explicitly granted in the Apache license, version 2.0 are reserved.
# See the included LICENSE file for more details.
##

SRCDIR = src
INCDIR = inc
OBJDIR = obj

SRC = $(wildcard $(SRCDIR)/*.c)
INC = $(wildcard $(INCDIR)/*.h)
 
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
TARGET = ucbor
 
CC := gcc
CFLAGS = -Wall -W -O
LIBS =
LDFLAGS = $(LIBS:%=-l%)
 
$(TARGET) : $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $<
 
$(OBJ): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -I$(INCDIR) -c -o $@ $<
 
.PHONY : clean
clean :
	rm -rf $(TARGET) $(OBJDIR)
