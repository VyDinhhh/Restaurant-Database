import { Routes, Route, Navigate } from "react-router-dom";
import './App.css';
import Menu from './components/TakeOrder';
import Tables from './components/tables';
import Navbar from './components/navbar';
import SubmitCart from './components/SubmitCart'


function App() {
  return (
    <main className="container-fluid">
      <Navbar/>
      <Routes>
        <Route path="/" element={<Tables />} />
        <Route path="/menu" element={<Menu />} />
        <Route path="/:tableID" element={<Menu/>}/>
        {/* <Route path="/:tableID/submitCart/:orderID" element={<SubmitCart/>}/> */}
      </Routes>
    </main>
  );
}

export default App;
