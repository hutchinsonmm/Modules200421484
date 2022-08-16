    function SysHDetails
    {
        $TotalPhysicalMemory = 0
        Get-WmiObject -Class win32_computersystem | 
        foreach{
            $TotalPhysicalMemory = $_.TotalPhysicalMemory/1gb
            New-Object -TypeName psobject -Property @{
                Domain = $_.Domain
                Manufacturer = $_.Manufacturer
                Model = $_.Model
                Name = $_.Name
                Owner = $_.PrimaryOwnerName
                TotalMemory = [math]::Round($TotalPhysicalMemory)
            }

        } | Format-List Domain, Manufacturer,Model,Name,Owner,TotalMemory
    }
    SysHDetails #Used to get Specific Objects to display from win32_computersystem

    function OSDetails
    {
        Get-WmiObject -Class win32_operatingsystem | 
        foreach{
            New-Object -TypeName psobject -Property @{
                OS = $_.Caption
                VersionNumber = $_.Version
            }
        } | Format-List OS,VersionNumber
    }
    OSDetails #Used to get Specific Objects to display from win32_operatingsystem

    function ProcDetails
    {
        Get-WmiObject -Class win32_processor | 
        foreach{
            New-Object -TypeName psobject -Property @{
                "Speed(MHz)" = $_.CurrentClockSpeed
                Cores = $_.NumberOfCores
                L1Size = $_.L1CacheSize
                L2Size = $_.L2CacheSize
                L3Size = $_.L3CacheSize
            }
        } | Format-List "Speed(MHz)",Cores,L1Size,L2Size,L3Size
    }
    ProcDetails #Used to get Specific Objects to display from win32_processor

    function PhyDetails
    {
        Get-WmiObject -Class win32_physicalmemory |
        foreach{
            New-Object -TypeName psobject -Property @{
                Vendor = $_.Manufacturer
                Description = $_.Description
                Size = $_.capacity/1gb
                Bank = $_.banklabel
                Slot = $_.devicelocator
            }
        } | Format-Table -Property Vendor,Description,Size,Bank,Slot -Wrap
    }
    PhyDetails #Used to get Specific Objects to display from win32_physicalmemory

    function DriveDetails
    {
        $diskdrives = Get-WmiObject -Class win32_diskdrive
        $Results = foreach ($disk in $diskdrives) {
            $partitions = $disk.GetRelated("win32_diskpartition");
            foreach ($partition in $partitions) {
                    $logicaldisks = $partition.GetRelated("win32_logicaldisk");
                    foreach ($logicaldisk in $logicaldisks) {
                            new-object -typename psobject -property @{Vendor=$disk.Caption
                                                                    Model=$disk.Model
                                                                    "$Size(GB)" = [math]::Round($logicaldisk.size/1GB)
                                                                    "FreeSpace(GB)"= [math]::Round($logicaldisk.FreeSpace/1GB)
                                                                    "PercentageFree(GB)"= [math]::Round(($logicaldisk.FreeSpace/$logicaldisk.size) *100) #Used to calculate the percentage free
                                                                    }
                }
            }
        } 
        $Results | Format-Table -Property Vendor,Model,"$Size(GB)","FreeSpace(GB)","PercentageFree(GB)" -Wrap
    }
    DriveDetails #Used to get Specific Objects to display from multiply win32_disks

    IPConfig

    function VideoDetails
    {
        Get-WmiObject -Class win32_videocontroller | 
        foreach{
            New-Object -TypeName psobject -Property @{
                CardVendor = $_.Caption
                Description = $_.Description
                Resolution = $_.CurrentHorizontalResolution + $_.CurrentVerticalResolution
            } 
        } | Format-List CardVendor,Description,Resolution
    }
    VideoDetails #Used to get Specific Objects to display from the win32_videocontroller

function Lab4
{
    SysHDetails
    OSDetails
    ProcDetails
    PhyDetails
    DriveDetails
    IPConfig
    VideoDetails
} #Wraped all the induvidual function into one function and not display unless the Lab4 function is called.