# ===========================
# Makefile for Fortran Project
# ===========================

# Compiler
FC = gfortran

# Compiler flags
FFLAGS = -O2 -Wall -std=f2008

# Executable name
EXE = ../bin/infinite_square_well

# Source files
SRC = $(wildcard *.f95)

# Object files (replace .f95 with .o)
OBJ = $(SRC:.f95=.o)

# Default target
all: $(EXE)

# Linking step
$(EXE): $(OBJ)
	mkdir -p ../bin
	$(FC) $(FFLAGS) -o $(EXE) $(OBJ)

# Compilation step
%.o: %.f95
	$(FC) $(FFLAGS) -c $< -o $@

# Clean rule
clean:
	rm -f $(OBJ) $(EXE)

# Run rule
run: all
	$(EXE)
