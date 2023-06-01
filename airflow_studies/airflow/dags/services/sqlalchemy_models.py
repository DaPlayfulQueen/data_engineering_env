from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import declarative_base

Base = declarative_base()


class Orders(Base):
    __tablename__ = "orders"
    order_id = Column(String, primary_key=True)
    item = Column(String)
    item_price = Column(Integer)
    amount = Column(Integer)


class OrderTotals(Base):
    __tablename__ = "order_totals"
    order_id = Column(String, primary_key=True)
    total = Column(Integer)
