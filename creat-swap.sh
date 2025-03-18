#!/bin/bash

# Define swap file size (change as needed)
SWAP_SIZE=1G
SWAP_FILE=/swapfile

# Step 1: Check if swap is already enabled
echo "[1/7] Checking for existing swap..."
swapon --show
if [ $? -eq 0 ]; then
    echo "Swap is already enabled. Exiting."
    exit 0
fi

# Step 2: Create a swap file
echo "[2/7] Creating swap file of size $SWAP_SIZE..."
sudo fallocate -l $SWAP_SIZE $SWAP_FILE || sudo dd if=/dev/zero of=$SWAP_FILE bs=1M count=$((1024))

# Step 3: Set correct permissions
echo "[3/7] Setting permissions on swap file..."
sudo chmod 600 $SWAP_FILE

# Step 4: Format swap file
echo "[4/7] Formatting swap file..."
sudo mkswap $SWAP_FILE

# Step 5: Enable swap file
echo "[5/7] Enabling swap..."
sudo swapon $SWAP_FILE

# Step 6: Make swap persistent
echo "[6/7] Making swap persistent..."
echo "$SWAP_FILE none swap sw 0 0" | sudo tee -a /etc/fstab

# Step 7: Optimize swappiness
echo "[7/7] Adjusting swappiness to 10..."
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "Swap setup complete! Run 'free -h' to verify."
