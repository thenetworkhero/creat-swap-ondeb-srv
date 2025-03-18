# Swap File Setup Script

## Overview
This script automates the process of adding a swap file to a Linux system. It checks if swap is enabled, creates a swap file, sets proper permissions, enables it, and makes it persistent across reboots. Additionally, it optimizes the swappiness value.

## Usage
1. **Download or create the script**
   ```bash
   nano add_swap.sh
   ```
   Copy and paste the script into the file, then save and exit.

2. **Make the script executable**
   ```bash
   chmod +x add_swap.sh
   ```

3. **Run the script with sudo**
   ```bash
   sudo ./add_swap.sh
   ```

## Features
- Checks if swap is already enabled
- Creates a swap file (default: 1GB, customizable)
- Sets proper permissions
- Formats and enables swap
- Makes swap persistent across reboots
- Adjusts swappiness for better performance

## Customization
- Change the `SWAP_SIZE` variable in the script to modify the swap file size.
- Modify `vm.swappiness` in the script to adjust how aggressively the system uses swap (default is set to `10` for minimal swapping).

## Verification
After running the script, check the swap status with:
```bash
free -h
swapon --show
```

## Notes
- Ensure you have enough disk space before creating a swap file.
- Not recommended for systems with SSDs unless necessary, as excessive swapping may wear out the drive over time.

