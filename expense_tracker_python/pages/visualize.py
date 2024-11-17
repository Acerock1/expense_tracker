import streamlit as st
import pandas as pd

# Check if there are any entries
if 'entries' in st.session_state and st.session_state['entries']:
    # Convert entries to a DataFrame
    data = pd.DataFrame(st.session_state['entries'])
    
    # Combine month and year for a unique time series label
    data['date'] = str(data['month'] + ' ' + data['year'])

    # Set the date as index for plotting
    data.set_index('date', inplace=True)

    # Select only the total income and expense columns for the line chart
    chart_data = data[['total_income', 'total_expense']]

    # Display the line chart
    st.line_chart(chart_data)
else:
    st.write("Please submit income and expense data in the data entry form first.")
