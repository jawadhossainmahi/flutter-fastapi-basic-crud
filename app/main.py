from fastapi import FastAPI

from .routers import users
from .routers import products
from .database import Base, engine

Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(users.router)
app.include_router(products.router)
