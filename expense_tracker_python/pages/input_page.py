import streamlit as st
import requests
import base64
import json

API_URL = "https://your-api-gateway-url.amazonaws.com/prod/entries"  # Replace with your API Gateway endpoint

currency = "$"
months = ["January", "February", "March", "April", "May", "June", 
          "July", "August", "September", "October", "November", "December"]
years = [2022, 2023, 2024, 2025]
incomes = ["Salary", "Tiktok", "Vending Machine"]
expenses = ["Rent", "Car", "Insurance", "Misc"]

st.header(f"Data Entry in {currency}")

with st.form("entry_form", clear_on_submit=True):
    col1, col2 = st.columns(2)
    month = col1.selectbox("Select Month:", months)
    year = col2.selectbox("Select Year:", years)
    st.markdown("---")

    
    with st.expander("Income"):
        income_values = {income: st.number_input(f"{income}:", min_value=0, format="%i", step=10, key=income) for income in incomes}

    with st.expander("Expenses"):
        expense_values = {expense: st.number_input(f"{expense}:", min_value=0, format="%i", step=10, key=expense) for expense in expenses}
    with st.expander("Comment"):
        comment = st.text_area("", placeholder="Enter a comment here ...")
    with st.expander("Attach Receipts"):
        receipts = st.file_uploader("Upload your receipts here (you can select multiple files)", 
                                    accept_multiple_files=True, 
                                    type=["jpg", "jpeg", "png", "pdf"])

    submit_button = st.form_submit_button("Submit")
    
    if submit_button:
        total_income = sum(income_values.values())
        total_expense = sum(expense_values.values())
        
        # Prepare data payload
        data = {
            "month": month,
            "year": year,
            "total_income": total_income,
            "total_expense": total_expense,
            "comment": comment,
            "incomes": income_values,
            "expenses": expense_values,
            "receipts": []
        }
        
        # Add receipts as base64 strings
        for receipt in receipts:
            file_content = base64.b64encode(receipt.read()).decode('utf-8')
            data["receipts"].append({
                "file_name": receipt.name,
                "file_data": file_content,
                "content_type": receipt.type
            })
        
        # Send data to API Gateway
        response = requests.post(API_URL, json=data)
        if response.status_code == 200:
            st.success("Data successfully submitted!")
        else:
            st.error("Failed to submit data.")
