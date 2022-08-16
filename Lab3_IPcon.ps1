function IPConfig
{
    $Description= @{ e='Description'; width =11}
    $Index= @{ e='Index'; width =5}
    $IPAddress= @{ e='IPAddress'; width=18}
    $IPSubnet = @{ e='IPSubnet'; width=19}
    $DNSDomain= @{ e='DNSDomain'; width=11}
    $DNSServer= @{ e='DNSServerSearchOrder'; width=20}
    # Lines 1-6 are used to reduce white spaces as well as fitting all Data into the table.
    #The Hashes are in a Variable to reduce the line lengths in the format-table command.

    get-ciminstance win32_networkadapterconfiguration | Where-Object {$_.IPEnabled -eq $true} |
        Format-Table -Property $Description,$Index,$IPAddress,$IPSubnet,$DNSDomain,$DNSServer -Wrap #Takes the information from only the enabled IP interfaces and formats them in a table.
}
IPConfig