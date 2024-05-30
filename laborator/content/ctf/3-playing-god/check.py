# -*- coding: utf-8 -*-

import subprocess

def run_exe_and_get_output(exe_path):
    result = subprocess.run(exe_path, capture_output=True, text=True)
    return result.stdout.splitlines()

def print_multiples(outputs, multiple):
    for output in outputs:
        number = str(output)
        print(f"{number} * {multiple} = {number * multiple}")

if __name__ == "__main__":
    exe_path = 'dynamic2'  
    outputs = run_exe_and_get_output(exe_path)
    multiple = 2  
    print_multiples(outputs, multiple)
