import re
from pathlib import Path

        
def return_unique_lib_cells(pattern, folder_path):
    
    folder = Path(folder_path)
    set_of_lib_cells = set()
    
    
    # Find all .v files
    v_files = folder.glob("*.v")

    for file in v_files:
        # print(f"Reading file: {file.name}")
        with file.open('r') as f:
            for line in f:
                line = line.strip()  # Remove trailing newline/whitespace
                if pattern.match(line):
                    set_of_lib_cells.add(line.split(" ")[0])
    return set_of_lib_cells

def main():
    
    # Define the pattern
    pattern = re.compile(r'^\w+_\w+_\w+_R')
    folder_path = "../modules/netlist"
    
    set_of_lib_cells = return_unique_lib_cells(pattern=pattern, folder_path=folder_path)
    print(set_of_lib_cells)
    
if __name__ == "__main__":
    main()