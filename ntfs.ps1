<#Task 3 part 1
Script is setting different NTFS permissions to users testA and testB for the folder 'C:\Share'
User testA has FullControl access to the folder and ReadOnly access to the file Client_list.txt
User testB has ReadOnly access to the folder and Write access to the file Client_list.txt
#>

#User - TestA
#//////////------------Full Access to user=testA
# Create the ACE(Access Control Entries)
$identity = 'desktop-dd3ph49\testa'
#-----Access Rule Types-----
#[FullControl, ExecuteFile, ReadData, ReadAttributes, ReadExtendedAttributes, CreateFiles, AppendData, WriteAttributes, WriteExtendedAttributes, DeleteSubdirectoriesAndFiles, Delete, ReadPermission]
$permission = 'FullControl' #Other options: [enum]::GetValues('System.Security.AccessControl.FileSystemRights')
$path = 'C:\Share' #\Client_list.txt
# $inheritance = 'ContainerInherit, ObjectInherit' 
# $propogation = 'None' 
$type = 'Allow'
$acl = Get-Acl -Path $path
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule($identity,$permission,$type)
$acl.SetAccessRule($ACE)
$acl | Set-Acl -Path $path
Write-Output $ACE
Write-Output $acl

#//////////------------Read access to one file user=testA
# Create the ACE(Access Control Entries)
$identity = 'desktop-dd3ph49\testa'
#-----Access Rule Types-----
#[FullControl, ExecuteFile, ReadData, ReadAttributes, ReadExtendedAttributes, CreateFiles, AppendData, WriteAttributes, WriteExtendedAttributes, DeleteSubdirectoriesAndFiles, Delete, ReadPermission]
$permission = 'ReadData' #Other options: [enum]::GetValues('System.Security.AccessControl.FileSystemRights')
$path = 'C:\Share\Client_list.txt' #\Client_list.txt
# $inheritance = 'ContainerInherit, ObjectInherit' 
# $propogation = 'None' 
$type = 'Allow'
$acl = Get-Acl -Path $path
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule($identity,$permission,$type)
$acl.SetAccessRule($ACE)
$acl | Set-Acl -Path $path
Write-Output $ACE
Write-Output $acl

#User - TestB
#//////////------------Read access to one file user=testB
# Create the ACE(Access Control Entries)
$identity = 'desktop-dd3ph49\testb'
#-----Access Rule Types-----
#[FullControl, ExecuteFile, ReadData, ReadAttributes, ReadExtendedAttributes, CreateFiles, AppendData, WriteAttributes, WriteExtendedAttributes, DeleteSubdirectoriesAndFiles, Delete, ReadPermission]
$permission = 'ReadData' #Other options: [enum]::GetValues('System.Security.AccessControl.FileSystemRights')
$path = 'C:\Share' #\Client_list.txt
# $inheritance = 'ContainerInherit, ObjectInherit' 
# $propogation = 'None' 
$type = 'Allow'
$acl = Get-Acl -Path $path
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule($identity,$permission,$type)
$acl.SetAccessRule($ACE)
$acl | Set-Acl -Path $path
Write-Output $ACE
Write-Output $acl


#//////////------------Read access to one file user=testB
# Create the ACE(Access Control Entries)
$identity = 'desktop-dd3ph49\testb'
#-----Access Rule Types-----
#[FullControl, ExecuteFile, ReadData, ReadAttributes, ReadExtendedAttributes, CreateFiles, AppendData, WriteAttributes, WriteExtendedAttributes, DeleteSubdirectoriesAndFiles, Delete, ReadPermission]
$permission = 'Write' #Other options: [enum]::GetValues('System.Security.AccessControl.FileSystemRights')
$path = 'C:\Share\Client_list.txt' #\Client_list.txt
# $inheritance = 'ContainerInherit, ObjectInherit' 
# $propogation = 'None' 
$type = 'Allow'
$acl = Get-Acl -Path $path
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule($identity,$permission,$type)
$acl.SetAccessRule($ACE)
$acl | Set-Acl -Path $path
Write-Output $ACE
Write-Output $acl