README for DHCP Lease Export Script
Description
This PowerShell script retrieves and exports DHCP lease information from a specified DHCP server to a CSV file. The script connects to the DHCP server, gathers lease details (including Scope ID, IP Address, Host Name, Client ID, and Address State), and saves them in a semicolon-delimited CSV file.

Requirements
The script requires administrative privileges to query the DHCP server.
PowerShell 5.1 or higher.
The DhcpServer PowerShell module must be installed.
Usage
Step 1: Define DHCP Server
In the script, set the $DhcpServer variable to the hostname of your DHCP server:

powershell
Kopier kode
$DhcpServer = "lokmes03-ws-01"  # Change this to your actual DHCP server if needed
Step 2: Run the Script
Open PowerShell with administrative privileges.
Execute the script. It will connect to the specified DHCP server and retrieve all DHCP lease data.
Step 3: Output
The retrieved lease information is exported to a CSV file at the following location:

makefile
Kopier kode
C:\DHCP_Leases.csv
You can modify the output path by changing the $csvFilePath variable in the script:

powershell
Kopier kode
$csvFilePath = "C:\DHCP_Leases.csv"
Step 4: CSV File
The generated CSV file will contain the following columns:

ScopeId: The scope ID of the DHCP lease.
IPAddress: The leased IP address.
HostName: The hostname of the client.
ClientID: The client ID (often the MAC address).
AddressState: The current state of the lease (e.g., Active, Inactive).
Delimiter
The CSV file uses a semicolon (;) as the delimiter, making it compatible with different regional settings for CSV files. You can adjust the delimiter by changing the -Delimiter ";" argument.

Example
Running the script with the default settings will produce the following output:

css
Kopier kode
DHCP leases have been exported to C:\DHCP_Leases.csv
Notes
Ensure the script is run with sufficient permissions to access the DHCP server.
If your DHCP server is located remotely, make sure it is accessible via network and the appropriate firewall rules are in place.
Customization
Feel free to customize the script as needed. You can add additional fields from the DHCP lease data by modifying the Select-Object section.
