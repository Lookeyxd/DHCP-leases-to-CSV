# Define the DHCP server you want to export the leases from
$DhcpServer = "lokmes03-ws-01"  # Change this to your actual DHCP server if needed

# Retrieve all DHCP leases from the server
$dhcpLeases = Get-DhcpServerv4Lease -ComputerName $DhcpServer

# Create a custom object with the required fields for the CSV
$leaseData = $dhcpLeases | Select-Object `
    @{Name="ScopeId";Expression={$_.ScopeId}},
    @{Name="IPAddress";Expression={$_.IPAddress}},
    @{Name="HostName";Expression={$_.HostName}},
    @{Name="ClientID";Expression={$_.ClientId}},
    @{Name="AddressState";Expression={$_.AddressState}}

# Define the output path for the CSV file
$csvFilePath = "C:\DHCP_Leases.csv"

# Export the data to a CSV file with the specified header and ';' as the delimiter
$leaseData | Export-Csv -Path $csvFilePath -NoTypeInformation -Delimiter ";"

Write-Output "DHCP leases have been exported to $csvFilePath"
