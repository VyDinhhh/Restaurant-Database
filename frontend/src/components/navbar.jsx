import React from 'react';
import { Link } from 'react-router-dom';

function navbar() {
  return (
    <nav className='navbar navbar-expand-lg navbar-light bg-light'>
         <div class="container-fluid">
          <Link to={'/'} className="navbar-brand">Tay Ho Restaurant</Link>
          <button></button>
        </div>
    </nav>
  )
}

export default navbar