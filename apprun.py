import subprocess

def run_powershell_scripts():
    # Execute function script first
    subprocess.run(['powershell', '-ExecutionPolicy', 'Bypass', '-File', 'Get-DirectorySizes.ps1'], check=True)
    
    # Execute build script second
    #subprocess.run(['powershell', '-ExecutionPolicy', 'Bypass', '-File', 'build.ps1'], check=True)

if __name__ == "__main__":
    run_powershell_scripts()