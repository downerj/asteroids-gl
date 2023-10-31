.PHONY: clean

EXECUTABLE = asteroids
BINDIR = bin
OBJDIR = obj
SRCDIR = src
CXXVERSION = -std=c++17

CWARNS = -Wall -Wextra -Werror -Wpedantic -pedantic-errors
LLIBS = -lGL -lGLEW -lglfw

release: DEBUGS = -O3
release: $(BINDIR)/$(EXECUTABLE)

debug: DEBUGS = -DDEBUG -Og -g
debug: $(BINDIR)/$(EXECUTABLE)

$(BINDIR)/$(EXECUTABLE):\
 $(OBJDIR)/main.o
	$(CXX) -o $@ $^ $(LLIBS)

$(OBJDIR)/main.o: $(SRCDIR)/main.cxx $(OBJDIR) $(BINDIR)
	$(CXX) -c -o $@ $< $(CWARNS) $(CXXVERSION)

$(BINDIR):
	if [ ! -d "$(BINDIR)" ]; then mkdir -p "$(BINDIR)"; fi

$(OBJDIR):
	if [ ! -d "$(OBJDIR)" ]; then mkdir -p "$(OBJDIR)"; fi

clean:
	rm -rf $(BINDIR)/* $(OBJDIR)/*
