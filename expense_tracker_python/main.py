import streamlit as st

about_page = st.Page("pages/about.py", title= "About me", icon="🧑🏾‍🎓")
input_page = st.Page("pages/input_page.py", title="Enter Your Expenses", icon="💵")
visaulize_page = st.Page("pages/visualize.py", title="View Your Expenses", icon="📊")

pg = st.navigation([about_page, input_page, visaulize_page])
st.set_page_config(
    page_title="Expense Tracker",
    page_icon="💵"
    )
pg.run()


