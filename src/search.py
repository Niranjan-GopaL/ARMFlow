import os

def find_files_with_text(folder_path, search_text):
    matched_files = []

    for root, _, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            try:
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    for line in f:
                        if search_text in line:
                            matched_files.append(file_path)
                            break  # stop after first match
            except Exception as e:
                print(f"⚠️ Skipped {file_path}: {e}")

    return matched_files

# 🔧 Example usage
if __name__ == "__main__":
    folder = "../modules/netlist/"  # change to your target folder
    target_string = "CKINVDCx10_ASAP7_75t_R"
    results = find_files_with_text(folder, target_string)

    print(f"\n✅ Found '{target_string}' in {len(results)} file(s):")
    for path in results:
        print("  -", path)
