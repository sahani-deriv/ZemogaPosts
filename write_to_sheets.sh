#!/bin/bash

# Your service account JSON key file
JSON_KEY_FILE=$BITRISEIO_SERVICE_ACCOUNT_URL

# ID of your Google Sheets file
SPREADSHEET_ID="1QaX2lea2ccgytEdTf9-aGYPkNw8uktaVxIInNNiioSI"

# Authenticate using the JSON key file
gspread-cli $JSON_KEY_FILE

# Specify the worksheet name
WORKSHEET_NAME="Sheet1"

# Data to write to the sheet
DATA="Hello,World"

# Write the data to the sheet
gspread-cli --spreadsheet $SPREADSHEET_ID \
  --worksheet "$WORKSHEET_NAME" \
  --append "$DATA"

echo "Data written to Google Sheets."