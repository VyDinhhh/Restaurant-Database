import React, { useState } from 'react';
import { menu } from './menu';
import { useParams } from 'react-router-dom';

export default function TakeOrder() {
  const { tableID } = useParams();
  const [cart, setCart] = useState([]);
  const [employee, setEmployee] = useState("");
  const [isEnterID, setIsEnterID] = useState(false);
  //Handle events
  const addItem = (event, chosenDish) => {
    event.preventDefault();
    if (employee === "" && isEnterID === true) {
      alert("Enter your employee ID first")
    } else {
      setCart([...cart, chosenDish])
    }
  }

  const enterEmployeeID = (event) => {
    event.preventDefault();
    setIsEnterID(true);
    console.log(employee);
  }
  return (
    <div className='container-fluid mt-3 row take-order-div'>
      <div className='col-9 menu-div'>
        <h3>Menu</h3>
        <form style={{ height: "2rem", width: "21rem" }} className="input-group flex-nowrap mb-3" onSubmit={enterEmployeeID}>
          <span class="input-group-text" id="addon-wrapping">Employee ID</span>
          <input
            type="text"
            class="form-control"
            placeholder="Insert your ID"
            aria-label="Username"
            aria-describedby="addon-wrapping"
            value={employee}
            onChange={event => setEmployee(event.target.value)} />
          <button className="btn btn-outline-secondary">Enter</button>
        </form>
        <div className='row'>
          {menu.map(item => {
            return (
              <div key={item._id} className='col-3 card table-card me-3 mb-3' onClick={(event) => addItem(event, item)}>
                <div className='card-body'>
                  <h5>{item.dishName}</h5>
                  <p>{item.description}</p>
                  <h6>{item.price}</h6>
                </div>
              </div>
            )
          })}
        </div>
      </div>

      <div className='col order-div'>
        <h3>Table's {tableID} Cart</h3>

        {cart.length !== 0 && cart.map(item => {
          return (
            <div key={item._id} className='row'>
              <h6 className='col-6'>{item.dishName}</h6>
              <h6 className='col'>{item.price}</h6>
              <div className='col'>
                <h6 style={{ float: "right" }}>
                  <span className='me-2' style={{ fontSize: "1.2rem" }}>+</span>
                  1
                  <span className='ms-2' style={{ fontSize: "1.2rem" }}>-</span></h6>
              </div>
            </div>
          )
        })}
        <button className="btn btn-primary">Submit</button>
      </div>
    </div>
  )
}
