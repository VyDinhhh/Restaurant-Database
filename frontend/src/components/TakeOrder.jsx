import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import Counter from "./counter";

import * as menuService from "../services/menuService";
import * as orderService from "../services/orderService";
import * as employeeService from "../services/employeeService";

export default function TakeOrder() {
  const { tableID } = useParams();
  const [cart, setCart] = useState([]);
  const [employee, setEmployee] = useState("");
  const [isEnterID, setIsEnterID] = useState(false);

  const [menu, setMenu] = useState(null);
  useEffect(() => {
    const fetch = async () => {
      const { data } = await menuService.getMenuItems();
      setMenu(data);
    };
    fetch();
  }, []);

  //Handle events
  const addItem = (event, chosenDish) => {
    event.preventDefault();
    if (isEnterID === false) {
      alert("Enter your employee ID first");
    } else {
      let item = cart.find((item) => item.Item_ID == chosenDish.Item_ID);

      if (!item) setCart([...cart, { ...chosenDish, quantity: 1 }]);
      else {
        item.quantity = item.quantity + 1;
        setCart([...cart]);
      }
    }
  };

  const enterEmployeeID = async (event) => {
    event.preventDefault();
    try {
      await employeeService.getEmployee(employee);
      setIsEnterID(true);
    } catch (error) {
      setIsEnterID(false);
      alert(error.response.data);
    }
  };

  const handleSubmit = async () => {
    const data = { customer: tableID, method: 1 };
    const { data: order } = await orderService.createOrder(data);
    cart.forEach(async (item) => {
      const orderItem = { item: item.Item_ID, quantity: item.quantity };
      console.log(orderItem);
      await orderService.addItem(order.insertId, orderItem);
    });
    window.location = "/";
  };

  return (
    <div className="container-fluid mt-3 row take-order-div">
      <div className="col-8 menu-div">
        <h3>Menu</h3>
        <form
          style={{ height: "2rem", width: "21rem" }}
          className="input-group flex-nowrap mb-3"
          onSubmit={enterEmployeeID}
        >
          <span className="input-group-text" id="addon-wrapping">
            Employee ID
          </span>
          <input
            type="text"
            className="form-control"
            placeholder="Insert your ID"
            aria-label="Username"
            aria-describedby="addon-wrapping"
            value={employee}
            onChange={(event) => setEmployee(event.target.value)}
          />
          <button className="btn btn-outline-secondary">Enter</button>
        </form>
        <div className="row">
          {menu &&
            menu.map((item) => {
              return (
                <div
                  key={item.Item_ID}
                  className="col-3 card table-card me-3 mb-3"
                  onClick={(event) => addItem(event, item)}
                >
                  <div className="card-body">
                    <h5>{item.Item_name}</h5>
                    <p>{item.Description}</p>
                    <h6>{item.Price}</h6>
                  </div>
                </div>
              );
            })}
        </div>
      </div>

      <div className="col order-div">
        <h3>Table's {tableID} Cart</h3>

        {cart.length !== 0 &&
          cart.map((item) => {
            return (
              <div key={item.Item_ID} className="row">
                <h6 className="col-5">{item.Item_name}</h6>
                <h6 className="col-2">${item.Price * item.quantity}</h6>
                <div className="col">
                  <h6 style={{ float: "right" }}>
                    <Counter value={item.quantity} />
                  </h6>
                </div>
              </div>
            );
          })}
        <button onClick={handleSubmit} className="btn btn-primary">
          Submit
        </button>
      </div>
    </div>
  );
}
