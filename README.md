# Building a simple shell exectuable file
build and ship this application: An shell executable file that can To list all directories and their subdirectories along with their sizes sorted from largest to smallest, you can use the following PowerShell script:

#To create a executable file follow these steps.

Run this on powershell:    
"Install-Module -Name ps2exe -Scope CurrentUser"

Next, run this:    
Invoke-PS2EXE -InputFile 'C:\Path\To\YourScript.ps1' -OutputFile 'C:\Path\To\YourExecutable.exe'

Now you should see the exe file that can be double clicked and used without requiring the source code.
