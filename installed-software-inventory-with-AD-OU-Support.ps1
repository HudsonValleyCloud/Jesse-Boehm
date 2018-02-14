#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#Installed Software Inventory Script
#Active Directory OU Integration - V1.1
Clear
#Get All Installed Software
Get-WmiObject -Class Win32_Product | Select-Object -Property PSComputerName, Vendor, Name, Version, InstallDate | Sort-Object PSComputerName, Vendor, Name, Version, InstallDate | Format-Table -Auto
#Get All Installed Software and Export to CSV - Remove Format-Table for Export-Csv
Get-WmiObject -Class Win32_Product | Select-Object -Property PSComputerName, Vendor, Name, Version, InstallDate | Sort-Object PSComputerName, Vendor, Name, Version, InstallDate | Export-Csv H:\2018\scripts\test.csv -notype
#Get All The Properties of Win32_Product Class. Change -match to Define Known Software to get Variables use in your -Property and Sort-Object Values
Get-WmiObject -Class Win32_Product -ComputerName . | where {$_.name -match "VMware Tools"} | Format-List -Property *
#Get Vendor Software with ****Wildcard****
Get-WmiObject -Class Win32_Product | Select-Object -Property PSComputerName, Vendor, Name, Version, InstallDate | where {$_.name -match "VMware*"} | Sort-Object PSComputerName, Vendor, Name, Version, InstallDate | Format-Table -Auto
#Get "VMware Horizon Client & Version"
Get-WmiObject -Class Win32_Product | Select-Object -Property PSComputerName, Vendor, Name, Version, InstallDate | where {$_.name -match "VMware Tools"} | Sort-Object PSComputerName, Vendor, Name, Version, InstallDate | Format-Table -Auto
#Get "VMware User Environment Manager & Version"
Get-WmiObject -Class Win32_Product | Select-Object -Property PSComputerName, Vendor, Name, Version, InstallDate | where {$_.name -match "VMware User Environment Manager"} | Sort-Object PSComputerName, Vendor, Name, Version, InstallDate | Format-Table -Auto

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

#Domain Computer Object Searching.... This can take a long time. Test with a Small OU first.
#Get Drivers on Computers in a Base OU
#Create a -SearchBase which we can turn into -ComputerName Value to loop Through all VMs that are AD Joined.
Clear
$Computer = ((Get-ADComputer -filter * -SearchBase "DC=domain,DC=com").Name)
#Check Computer List
$Computer
#Get Your Drivers
Clear
#
Get-WmiObject -Class Win32_Product -ComputerName Test | Select-Object -Property 
#
Get-WmiObject -Class Win32_Product -ComputerName $Computer | Select-Object -Property * | Sort-Object * | Format-Table -Auto | Format-Table -Auto | Format-Table -Auto
#
Get-WmiObject -Class Win32_Product -ComputerName $Computer | Select-Object -Property PSComputerName, Vendor, Name, Version, InstallDate  | Sort-Object PSComputerName, Vendor, Name, Version, InstallDate | Format-Table -Auto
#
Get-WmiObject -Class Win32_Product -ComputerName $Computer | Select-Object -Property PSComputerName, Vendor, Name, Version, InstallDate | where {$_.name -match "VMware Tools"} | Sort-Object PSComputerName, Vendor, Name, Version, InstallDate | Format-Table -Auto



########################################
PSComputerName    : QCLOUDBRCRDS01
Name              : VMware Tools
Version           : 10.0.9.3917699
InstallState      : 5
__GENUS           : 2
__CLASS           : Win32_Product
__SUPERCLASS      : CIM_Product
__DYNASTY         : CIM_Product
__RELPATH         : Win32_Product.IdentifyingNumber="{7595A850-FE4D-4273-84FA-9CC1068AFF7A}",Name="VMware Tools",Version="10.0.9.3917699"
__PROPERTY_COUNT  : 27
__DERIVATION      : {CIM_Product}
__SERVER          : QCLOUDBRCRDS01
__NAMESPACE       : root\cimv2
__PATH            : \\QCLOUDBRCRDS01\root\cimv2:Win32_Product.IdentifyingNumber="{7595A850-FE4D-4273-84FA-9CC1068AFF7A}",Name="VMware Tools",Version="10.0.9.3917699"
AssignmentType    : 1
Caption           : VMware Tools
Description       : VMware Tools
HelpLink          : 
HelpTelephone     : 
IdentifyingNumber : {7595A850-FE4D-4273-84FA-9CC1068AFF7A}
InstallDate       : 20170705
InstallDate2      : 
InstallLocation   : C:\Program Files\VMware\VMware Tools\
InstallSource     : C:\Users\ADMINI~1\AppData\Local\Temp\{7595A850-FE4D-4273-84FA-9CC1068AFF7A}~setup\
Language          : 1033
LocalPackage      : C:\Windows\Installer\34831.msi
PackageCache      : C:\Windows\Installer\34831.msi
PackageCode       : {05DFCF95-765A-4277-9F7B-8D7A8F59DA91}
PackageName       : VMware Tools64.msi
ProductID         : 
RegCompany        : 
RegOwner          : 
SKUNumber         : 
Transforms        : 
URLInfoAbout      : 
URLUpdateInfo     : 
Vendor            : VMware, Inc.
WordCount         : 2
Scope             : System.Management.ManagementScope
Path              : \\QCLOUDBRCRDS01\root\cimv2:Win32_Product.IdentifyingNumber="{7595A850-FE4D-4273-84FA-9CC1068AFF7A}",Name="VMware Tools",Version="10.0.9.3917699"
Options           : System.Management.ObjectGetOptions
ClassPath         : \\QCLOUDBRCRDS01\root\cimv2:Win32_Product
Properties        : {AssignmentType, Caption, Description, HelpLink...}
SystemProperties  : {__GENUS, __CLASS, __SUPERCLASS, __DYNASTY...}
Qualifiers        : {dynamic, Locale, provider, UUID}
Site              : 
Container         : 
#######################################













