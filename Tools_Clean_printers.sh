#In summary, this script lists all printers on the system, loops through each printer, and deletes all printers whose names do not start with "MTC_PA_". 
#The script requires administrative privileges to run, as the lpadmin command used to delete the printers requires root access.

#!/bin/bash

# List all printers
echo "Listing all printers:"
lpstat -p

# Delete printers starting with "FR-PRINT"
echo "Deleting printers starting with FR-PRINT:"
for printer in $(lpstat -p | awk '{print $2}'); do
    if [[ $printer == NAME* || $printer == *NAME* || $printer == *NAME ]]; then
        echo "Deleting printer: $printer"
        lpadmin -x $printer
    fi
done

# Confirm deletion
echo "Updated printer list:"
lpstat -p
