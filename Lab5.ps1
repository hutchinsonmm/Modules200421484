function Lab5
{
    function Option-Selection 
    {
        Write-Host "=========== Home Menu ===========" # to create a title
        Write-Host "Press Number '1' to Display: System Information " #Lets user know what option 1 is going to display
        Write-Host "Press Number '2' to Display: Disk Information" #Lets user know what option 2 is going to display
        Write-Host "Press Number '3' to Display: Network Information" #Lets user know what option 3 is going to display
        Write-Host "Leave Input Blank to Display All Information" #Lets user know that no number displays lab4 function
        Write-Host "Type 'Clear' to Clear Host, Than Quit Script" # To clear information at the end and quit out of script
        Write-Host "Type 'Quit' to Exit Out of Script" #To manually quit out of script
    }

    do #To loop throught the option
    {
        Option-Selection #Displays Home Menu
        $Selection = Read-Host "Please Choose One of The Options" #Ask user to choose an option
        switch ($Selection)
        {
            '1' #displays system information
            {
                SysHDetails
                OSDetails
                ProcDetails
                VideoDetails
            }

            '2' #Displays disk information
            {
                DriveDetails
            }

            '3' #Displays network information
            {
                IPConfig
            }

            '' #Display all informtion from lab 4
            {
                Lab4
            }
            'Clear' #To Clear and Quit the host
            {
                Clear-Host
                $Selection = 'Quit'
            }
  
        }
        pause
    }until ($Selection -eq 'Quit') #To repeat the loop tell Quit is typed
}







<# was not used keep for intrest param 
        (
            [string]$Title = 'Home Menu' # To Create a Title
        )#>