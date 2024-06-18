#!/bin/bash
return

# Function to check internet connectivity
is_connected() {
	ping -q -c 1 8.8.8.8 >/dev/null 2>&1
	return $?
}

# Check internet connection
if ! is_connected; then
	echo "No internet connection detected. Update check failed."
	exit 1
fi

# Check for pnpm updates (quiet mode)
update_available=$(pnpm outdated --silent)

# If updates available, prompt user
if [[ ! -z "$update_available" ]]; then
	echo "pnpm updates available!"
	echo "$update_available"
	read -p "Do you want to update pnpm? (y/N): " answer

	if [[ "$answer" =~ ^[Yy]$ ]]; then
		echo "Updating pnpm..."
		pnpm update
	else
		echo "Skipping pnpm update."
	fi
fi

echo "pnpm update check completed."
