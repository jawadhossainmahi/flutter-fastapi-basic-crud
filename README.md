# Flutter + FastAPI Basic CRUD

This repository contains a **full-stack CRUD practice project**:
- **Frontend branch** → Flutter app with modular structure and GoRouter navigation.
- **Backend branch** → FastAPI server with RESTful CRUD endpoints.

---

## 🎯 Goal
My goal is to **master modular Flutter CRUD development** using mapped packages from Laravel-style modularity, combined with a FastAPI backend.  
I want to build scalable, maintainable cross-platform apps with:
- Robust onboarding and documentation
- Modular routing and dependency injection
- Role-based access control
- Clean separation between frontend and backend

---

## 📂 Folder Structure (Frontend)
```
lib/
│── main.dart
│── app_router.dart          # Root router merges all feature routes
│── core/
│   └── di.dart              # Dependency injection with GetIt (optional)
│── modules/
│   ├── users/
│   │   ├── users_routes.dart
│   │   ├── users_service.dart
│   │   └── users_page.dart
│   └── products/
│       ├── products_routes.dart
│       ├── products_service.dart
│       └── products_page.dart
```

---

## 📂 Folder Structure (Backend)
```
backend/
│── main.py                  # FastAPI entry point
│── routers/
│   ├── users.py             # Users CRUD routes
│   └── products.py          # Products CRUD routes
│── models/
│   ├── user.py              # SQLAlchemy/Pydantic models
│   └── product.py
│── database.py              # DB connection setup
│── requirements.txt         # Python dependencies
```

---

## 🚀 How to Run

### Frontend (Flutter)
```bash
git checkout frontend
flutter pub get
flutter run
```

### Backend (FastAPI)
```bash
git checkout backend
pip install -r requirements.txt
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

---

## 🔗 Branches
- `frontend` → Flutter app
- `backend` → FastAPI server

---

## ✅ Features
- Modular routing (Users, Products)
- CRUD operations (Create, Read, Update, Delete)
- Bottom navigation for switching modules
- Dialog-based forms for adding/editing data
- REST API integration with FastAPI
```

---

## 📄 Frontend `README.md` (in `frontend` branch)
```markdown
# Flutter Frontend - Basic CRUD

This branch contains the **Flutter app** for the CRUD project.

---

## Features
- Modular folder structure (`modules/users`, `modules/products`)
- GoRouter for navigation
- GetIt for dependency injection
- CRUD UI with dialogs for add/edit
- Bottom navigation bar for switching modules

---

## Run
```bash
flutter pub get
flutter run
```
```

---

## 📄 Backend `README.md` (in `backend` branch)
```markdown
# FastAPI Backend - Basic CRUD

This branch contains the **FastAPI server** for the CRUD project.

---

## Features
- RESTful CRUD endpoints for Users and Products
- Modular routers (`routers/users.py`, `routers/products.py`)
- SQLAlchemy models and database integration
- Pydantic schemas for validation

---

## Example Endpoints
### Users
- `GET /users` → List all users
- `POST /users` → Create a new user
- `PUT /users/{id}` → Update a user
- `DELETE /users/{id}` → Delete a user

### Products
- `GET /products` → List all products
- `POST /products` → Create a new product
- `PUT /products/{id}` → Update a product
- `DELETE /products/{id}` → Delete a product

---

## Run
```bash
pip install -r requirements.txt
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```
```

---

⚡ With this setup:
- Root README explains the **whole project**.
- Each branch has its own README explaining **frontend** or **backend**.
- Folder structures, goals, and run instructions are clear.
- Backend README includes **endpoint examples** for quick testing.

Would you like me to also add a **Postman collection JSON** so you can import and test all endpoints easily?
