```markdown
# FastAPI Book Management API

## Overview

This project is a RESTful API built with FastAPI for managing a book collection. It provides comprehensive CRUD (Create, Read, Update, Delete) operations for books, along with proper error handling, input validation, and auto-generated documentation.

## Features

- 📚 Book management (CRUD operations)
- ✅ Input validation using Pydantic models
- 🔍 Enum-based genre classification
- 🧪 Complete test coverage
- 📝 API documentation (auto-generated by FastAPI)
- 🔒 CORS middleware enabled

## Project Structure

```

```

fastapi-book-project/
├── api/
│   ├── db/
│   │   ├── __init__.py               # Marks this directory as a Python package
│   │   └── schemas.py                # Data models and in-memory database
│   ├── routes/
│   │   ├── __init__.py               # Marks this directory as a Python package
│   │   └── books.py                  # Book route handlers
│   └── router.py                     # API router configuration
├── core/
│   ├── __init__.py                   # Marks this directory as a Python package
│   └── config.py                     # Application settings
├── tests/
│   ├── __init__.py                   # Marks this directory as a Python package
│   └── test_books.py                 # API endpoint tests
├── main.py                           # Entry point for the application
├── requirements.txt                  # Dependencies
└── README.md                         # Documentation

```

```

## Technologies Used

- Python 3.12
- FastAPI
- Pydantic
- pytest
- uvicorn

## Installation

1. Clone the repository:

```bash
git clone https://github.com/hng12-devbotops/fastapi-book-project.git
cd fastapi-book-project
```

2. Create a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # If On Windows: venv\Scripts\activate
```

3. Install dependencies:

```bash
pip install -r requirements.txt
```

## Running the Application Locally

1. Start the server:

```bash
uvicorn main:app
```

2. Access the API documentation:

- Swagger UI: [http://localhost:8000/docs](http://localhost:8000/docs)
- ReDoc: [http://localhost:8000/redoc](http://localhost:8000/redoc)

## API Endpoints

### Books

- `GET /api/v1/books/` - Get all books
- `GET /api/v1/books/{book_id}` - Get a specific book
- `POST /api/v1/books/` - Create a new book
- `PUT /api/v1/books/{book_id}` - Update a book
- `DELETE /api/v1/books/{book_id}` - Delete a book

### Health Check

- `GET /healthcheck` - Check API status

## Book Schema

```json
{
  "id": 1,
  "title": "Book Title",
  "author": "Author Name",
  "publication_year": 2024,
  "genre": "Fantasy"
}
```

Available genres:

- Science Fiction
- Fantasy
- Horror
- Mystery
- Romance
- Thriller

## Running Tests

To run the tests:

```bash
pytest
```

## Error Handling

The API includes proper error handling for:

- Non-existent books
- Invalid book IDs
- Invalid genre types
- Malformed requests

## Deployment

This project has been deployed to an AWS EC2 instance using GitHub Actions. Here's a summary of the deployment process:

1. **EC2 Setup:**
   - The server is running on an Ubuntu EC2 instance.
   - SSH keys are used for secure communication.

2. **GitHub Actions:**
   - The deployment is automated using GitHub Actions.
   - The deployment YAML file is located under `.github/workflows/deploy.yml`.
   - The pipeline performs the following steps:
     - Check out the code.
     - Set up Python.
     - Install dependencies from `requirements.txt`.
     - Set up SSH keys for accessing the EC2 instance.
     - Pull the latest code from the `main` branch on the EC2 instance.
     - Restart the FastAPI application using `uvicorn`.

3. **Deployment Steps in GitHub Actions:**
   - When a push is made to the `main` branch, the deployment pipeline is triggered.
   - It SSHs into the EC2 instance, navigates to the project directory, activates the virtual environment, kills any existing `uvicorn` processes, and restarts the FastAPI application using `uvicorn main:app`.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, please open an issue in the GitHub repository.
```

This version includes a **Deployment** section, which explains the deployment process and how it was set up with GitHub Actions and AWS EC2.