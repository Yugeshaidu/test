# Define the target directory by replacing the path of your desired parent directory
$targetDirectory = 'C:\path\to\your\directory'

# Function to calculate the size of a directory
function Get-DirectorySize {
    param (
        [string]$Path
    )
    $size = 0
    # Get all files in the directory and its subdirectories
    Get-ChildItem -Path $Path -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
        $size += $_.Length
    }
    return $size
}

# Get all directories and subdirectories
$directories = Get-ChildItem -Path $targetDirectory -Recurse -Directory -ErrorAction SilentlyContinue

# Create a collection to store directory sizes
$directorySizes = @()

# Calculate the size for each directory
foreach ($dir in $directories) {
    $size = Get-DirectorySize -Path $dir.FullName
    $directorySizes += [pscustomobject]@{
        Path = $dir.FullName
        SizeInBytes = $size
        SizeInMB = [math]::Round($size / 1MB, 2)
    }
}

# Sort the directories by size in descending order
$sortedDirectories = $directorySizes | Sort-Object -Property SizeInBytes -Descending

# Display the sorted list
$sortedDirectories | Format-Table -Property Path, SizeInMB -AutoSize

# Optional: Save results to a CSV file
$sortedDirectories | Export-Csv -Path "$targetDirectory\DirectorySizes.csv" -NoTypeInformation

# To convert this script to an executable:
# 1. Install PS2EXE using Install-Module -Name ps2exe -Scope CurrentUser
# 2. Run the following command in PowerShell:
#    Invoke-PS2EXE -InputFile 'Path\To\YourScript.ps1' -OutputFile 'Path\To\YourExecutable.exe'
