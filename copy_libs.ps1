# Clear terminal
Clear-Host

# Get installation path
$installationPath = (Get-ItemProperty "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Ascaron Entertainment\Darkstar One")."InstalledTo"
#Write-Host "Installation path is $installationPath"

# Check if lua paths exists
$luaPath = "$installationPath\lua"
if (Test-Path $luaPath)
{
    Write-Host "Lua path is $luaPath"
    Write-Host ""
    
    # Get all lua files and copy them
    $luaFiles = Get-ChildItem -Path ".\*" -Include "*.lua"
    foreach ($luaFile in $luaFiles)
    {
        # Copy lib
        Write-Host "Copying $luaFile"
        $fileName = Split-Path -Path $luaFile -Leaf -Resolve
        #Write-Host $fileName
        Copy-Item -Path $luaFile -Destination "$luaPath\$fileName" -Force
    }
}
else
{
    Write-Host "Lua path $luaPath does not exist, exiting"
}