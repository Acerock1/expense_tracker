import streamlit as st
import boto3
from datetime import datetime
import uuid

currency = "$"

# Initialize the DynamoDB client
dynamodb = boto3.resource('dynamodb', region_name="us-west-2")  # Replace with your region
table = dynamodb.Table("MonthlyEntries")

# Define months and years for the select boxes
months = ["January", "February", "March", "April", "May", "June", 
          "July", "August", "September", "October", "November", "December"]
years = [2022, 2023, 2024, 2025]

incomes = ["Salary", "Tiktok", "Vending Machine"]
expenses = ["Rent", "Car", "Insurance", "Misc"]

st.header(f"Data Entry in {currency}")

with st.form("entry_form", clear_on_submit=True):
    col1, col2 = st.columns(2)
    month = col1.selectbox("Select Month:", months, key="month")
    year = col2.selectbox("Select Year:", years, key="year")

    st.markdown("---")

    # Income section
    with st.expander("Income"):
        income_values = {income: st.number_input(f"{income}:", min_value=0, format="%i", step=100, key=income) for income in incomes}

    # Expenses section
    with st.expander("Expenses"):
        expense_values = {expense: st.number_input(f"{expense}:", min_value=0, format="%i", step=100, key=expense) for expense in expenses}

    # Comment section
    with st.expander("Comments"):
        comment = st.text_area("", placeholder="Enter a comment here ...")
    
    # Receipts section
    with st.expander("Receipts"):
        receipts = st.file_uploader("Upload your receipts here (you can select multiple files)", 
                                    accept_multiple_files=True, 
                                    type=["jpg", "jpeg", "png", "pdf"])

    # Submit button
    submit_button = st.form_submit_button("Submit")
    
    if submit_button:
        # Calculate totals
        total_income = sum(income_values.values())
        total_expense = sum(expense_values.values())
        
        # Store the entry in DynamoDB
        entry_id = str(uuid.uuid4())  # Unique ID for the entry
        date_str = f"{month} {year}"

        entry_data = {
            "entry_id": entry_id,
            "month": month,
            "year": year,
            "date": date_str,
            "total_income": total_income,
            "total_expense": total_expense,
            "comment": comment,
            "incomes": income_values,
            "expenses": expense_values,
            "timestamp": datetime.utcnow().isoformat()  # Add a timestamp for tracking
        }

        try:
            # Insert the entry into the DynamoDB table
            table.put_item(Item=entry_data)
            st.success("Data successfully submitted and stored in DynamoDB!")
        except Exception as e:
            st.error(f"Failed to store data in DynamoDB: {e}")

        # Display receipts if any are uploaded
        if receipts:
            st.write("You have attached the following receipts:")
            for receipt in receipts:
                st.write(f"- {receipt.name}")
