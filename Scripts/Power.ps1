# Retrieve the GUID of the currently active power scheme.
# This ensures we are modifying the correct power plan.
$guid = (powercfg -getactivescheme).Split("{")[-1].Split("}")[0]
Write-Output "Active power scheme GUID: $guid"

# Set the display timeout to Never (0 seconds) when plugged in.
# This ensures the display never turns off while on AC power.
powercfg -change -monitor-timeout-ac 0
Write-Output "Set display timeout to Never for AC power."

# Set the display timeout to Never (0 seconds) when on battery.
# This ensures the display never turns off while on battery power.
powercfg -change -monitor-timeout-dc 0
Write-Output "Set display timeout to Never for DC (battery) power."

# Set the sleep timeout to Never (0 seconds) when plugged in.
# This ensures the computer never enters sleep mode while on AC power.
powercfg -change -standby-timeout-ac 0
Write-Output "Set sleep timeout to Never for AC power."

# Set the sleep timeout to Never (0 seconds) when on battery.
# This ensures the computer never enters sleep mode while on battery power.
powercfg -change -standby-timeout-dc 0
Write-Output "Set sleep timeout to Never for DC (battery) power."

# Confirm completion of the configuration changes.
Write-Output "Power settings have been updated successfully."
