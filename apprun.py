import subprocess
import os
import sys

def run_powershell_scripts(directory_path):
    # Full paths for the PS1 files
    function_script = os.path.join(directory_path, 'function_script.ps1')
    build_script = os.path.join(directory_path, 'build.ps1')
    
    # Execute function script first
    print("Executing function script...")
    subprocess.run(['powershell', '-ExecutionPolicy', 'Bypass', '-File', function_script], check=True)
    
    # Execute build script second
    print("Executing build script...")
    subprocess.run(['powershell', '-ExecutionPolicy', 'Bypass', '-File', build_script], check=True)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python app_run.py <directory_path>")
        sys.exit(1)
    
    directory_path = sys.argv[1]
    run_powershell_scripts(directory_path)