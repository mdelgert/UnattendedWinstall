# URL to the JSON file
$jsonUrl = "https://raw.githubusercontent.com/mdelgert/UnattendedWinstall/main/Scripts/files.json"

# Define the destination folder and log file path
$destinationFolder = "C:\Windows\Setup\Scripts"
$logFile = Join-Path $destinationFolder "get-scripts.log"

# Ensure the destination folder exists
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}

# Function to log messages to both console and log file
function Log-Message {
    param (
        [string]$message
    )
    # Write the message to the console
    Write-Host $message
    # Append the message to the log file
    Add-Content -Path $logFile -Value $message
}

# Log the start of the download process
Log-Message "Starting download process..."

try {
    # Download the JSON file content
    $jsonContent = Invoke-WebRequest -Uri $jsonUrl -UseBasicParsing | Select-Object -ExpandProperty Content
    Log-Message "Successfully downloaded JSON from $jsonUrl"

    # Parse the JSON content
    $files = $jsonContent | ConvertFrom-Json

    # Loop through each file in the JSON and download it
    foreach ($file in $files.files) {
        $fileUrl = $file.path
        $fileName = [System.IO.Path]::GetFileName($fileUrl)
        $destinationPath = Join-Path $destinationFolder $fileName

        # Log the file download start
        Log-Message "Downloading $fileName from $fileUrl..."

        # Download the file
        Invoke-WebRequest -Uri $fileUrl -OutFile $destinationPath

        # Log the successful download
        Log-Message "Successfully downloaded $fileName to $destinationPath"
    }

    Log-Message "All files downloaded successfully."

} catch {
    # Log any errors
    Log-Message "Error: $_"
}

# Log the completion of the script
Log-Message "Download process completed."