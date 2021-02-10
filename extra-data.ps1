<#Task 3 part 2
Script prints info data from stream and saves to output file
#>

$path = 'C:\Users\nilay\Desktop\windows-admin\extra-data.txt'
$outPath='C:\Users\nilay\Desktop\windows-admin\extra-data-out.txt'

Set-Content -Path $path -Value 'This is the content of the Stream.txt file'
$Procs = Get-Item -Path $path -Stream *
# Write-Output $Procs
Out-File -FilePath $outPath -InputObject $Procs -Encoding ASCII -Width 50
