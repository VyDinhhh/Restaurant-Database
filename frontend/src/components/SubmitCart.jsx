import React, {useState} from 'react';
import {useParams, useLocation} from 'react-router-dom';

function SubmitOrder() {
  const params = useParams();
  const {state: cart} = useLocation();
  console.log(cart)
  return (
    <div style={{border : "1px solid red"}} className='container text-alig'>
      <h2>Order</h2>
      {cart.map(item => {
        return(
          <div className='row'>
            <h5 className='col'>{item.dishName}</h5>
            <h5 className='col'>{item.price}</h5>
          </div>
        )
      })}
    </div>
  )
}

export default SubmitOrder