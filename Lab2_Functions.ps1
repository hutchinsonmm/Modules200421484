function welcome
{
    write-output "Welcome to planet $env:computername Overlord $env:username"
    $now = get-date -format 'HH:MM tt on dddd'
    write-output "It is $now."
}
Welcome

Function get-cpuinfo <#Function for displaying specific information on the computers CPU#>
{
    Get-CimInstance cim_processor | Select-Object -Property "Manufacturer", "Name", "CurrentClockSpeed", "MaxClockSpeed", "NumberOfCores" | Format-List
}
get-cpuinfo <#used to display function#>

Function get-mydisks <#gets specific information about the hard drives of the computer #>
{
    Get-Disk | Select-Object -Property "Manufacturer", "Model", "SerialNumber", "FirmwareVersion","Size" | Format-Table -AutoSize
}
get-mydisks used to display Function