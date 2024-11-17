# Expense Tracker

This is an Expense Tracker application that allows it's users to visualize their income and expenses through a graphical interface, upload receipts for specific expenses, and persist data in a cloud environment. The application utilizes Streamlit(a powerful python library) as the front end, with AWS DynamoDB for data persistence and AWS S3 for receipt storage.

## Features

1. **Income & Expense List Input**  
   Accepts an immutable list of income and expenses. Once entered, the data is stored persistently and cannot be altered.

2. **Graphical Visualization**  
   A visual representation (using Streamlit) of the income and expense data, allowing users to view their spending patterns over time.

3. **Receipt Upload**  
   Allows users to upload receipts for specific expenses, which are stored securely in an S3 bucket via an API call that triggers a lambda function

4. **Data Persistence**  
   Data is saved in **DynamoDB** for fast and scalable storage, ensuring that all data is maintained consistently.

## Tech Stack

- **Frontend**: Streamlit (Python library for interactive, data-driven apps)
- **Compute**: A lambda function is triggered by an API call everytime new data is saved
- **Storage**: AWS S3 for receipt images
- **Database**: DynamoDB for storing income, expense records, and metadata

## Future improvements

- Enhanced Security: Add authentication for secure user access.
- Filtering and Search: Allow users to filter expenses by category or date.
- Editable Income and Expenses: Allow users to edit the types/category of income/expense entries (if immutability is modified).
- Better UX
- 


## Requirements

- **Python** >= 3.7
- **Streamlit**
- **Boto3** (AWS SDK for Python)
- **Matplotlib / Plotly** (for data visualization)

## Setup and Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/expense-tracker.git
   cd expense-tracker


## Contributing

Feel free to fork the repository, create a new branch, and submit a pull request. All contributions are welcome!


## License

This project is licensed under the MIT License. See the LICENSE file for details.
