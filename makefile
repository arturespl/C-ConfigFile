OUT		 = $(shell basename $(CURDIR)).out
CC 		 = g++

CPPFLAGS += -g
CPPFLAGS += -Iinc

INCDIR	 	= inc/
OBJDIR	 	= obj/
SRCDIR	 	= src/
INSTALLDIR	= /usr/local/bin/

SOURCES	= $(shell ls $(SRCDIR))

DEPOBJ = 


OBJECTS += $(SOURCES:%.cpp=$(OBJDIR)%.o)

#INCLUDES += $(SOURCES:%.cpp=$(OBJDIR)%.hpp)


#################################################################################

__Start__: $(SOURCES) $(OUT)

l:
	echo $(SOURCES) 

$(OUT): $(OBJECTS)
	$(CC) -o $@ $(CPPFLAGS) $(OBJECTS) $(DEPOBJ) main.cpp 


$(SOURCES): $(INCDIR)$(@:%.cpp=%.hpp) $(SRCDIR)$@
	$(CC) -c $(CPPFLAGS) $(SRCDIR)$@ -o $(@:%.cpp=$(OBJDIR)%.o)

test:
	@$(MAKE) ${OUT} -B
	@$(MAKE) r

clean: 
	rm -f $(OUT) $(OBJDIR)*

r:
	./${OUT}	

gdb:
	@$(MAKE) ${OUT}
	@$(MAKE) r
	gdb ${OUT}

install:
	@$(MAKE) ${OUT}
	sudo mv ${OUT} ${INSTALLDIR}