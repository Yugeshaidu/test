if (!(Get-Module -ListAvailable -Name PS2EXE)) {
    Write-Host "Installing PS2EXE module..."
    Install-Module -Name PS2EXE -Scope CurrentUser -Force
}

# Define paths
$inputScript = "Get-DirectorySizes.ps1"  # Replace with your script name
$outputExe = "App.exe"    # Replace with desired exe name

# Convert PS1 to EXE
Write-Host "Converting script to executable..."
Invoke-PS2EXE -InputFile $inputScript -OutputFile $outputExe