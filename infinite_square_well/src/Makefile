# =========================================================
#  Scalable Makefile (for the 'src' folder)
# =========================================================

# --- Compiler and Flags ---
FC = gfortran
FFLAGS = -g -Wall -O2 -std=f2008 -I../../common

# --- Directories and Files ---
BIN_DIR = ../../bin
COMMON_DIR = ../../common
EXE = $(BIN_DIR)/project_one_executable

# --- AUTOMATIC FILE DISCOVERY ---
# Find all .f95 files in the common directory
COMMON_SRC = $(wildcard $(COMMON_DIR)/*.f95)
# Create a list of corresponding object files (e.g., constants.o, functions.o)
COMMON_OBJ = $(patsubst $(COMMON_DIR)/%.f95,%.o,$(COMMON_SRC))

# List your local source file(s) here
MAIN_SRC = main.f95
MAIN_OBJ = $(MAIN_SRC:.f95=.o)

# Combine all object files
OBJECTS = $(MAIN_OBJ) $(COMMON_OBJ)

# --- Build Rules ---

# Default target
all: $(EXE)

# Linking rule
$(EXE): $(OBJECTS)
	@mkdir -p $(BIN_DIR)
	@echo "Linking executable: $@"
	$(FC) $(FFLAGS) -o $@ $(OBJECTS)

# --- EXPLICIT DEPENDENCIES ---
# You still need to tell 'make' the order.
# If 'main.f95' uses ALL common modules, it depends on ALL of them.
$(MAIN_OBJ): $(COMMON_OBJ)

# --- GENERAL COMPILATION RULES ---
# Rule to build local object files (like main.o)
%.o: %.f95
	@echo "Compiling local: $<"
	$(FC) $(FFLAGS) -c $< -o $@

# Rule to build common object files from the commons directory
%.o: $(COMMON_DIR)/%.f95
	@echo "Compiling common: $<"
	$(FC) $(FFLAGS) -c $< -o $@


# --- Utility Rules ---

clean:
	@echo "Cleaning up..."
	rm -f $(OBJECTS) *.mod $(EXE)

run: all
	@echo "Running project..."
	$(EXE)