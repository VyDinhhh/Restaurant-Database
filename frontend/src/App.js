import { Routes, Route, Navigate } from "react-router-dom";
import './App.css';
import Menu from './components/TakeOrder';
import Tables from './components/tables';
import Navbar from './components/navbar';


function App() {
  return (
    <main className="container-fluid">
      <Navbar/>
      <Routes>
        <Route path="/" element={<Tables />} />
        <Route path="/menu" element={<Menu />} />
        <Route path="/:tableID" element={<Menu/>}/>
      </Routes>
    </main>
  );
}

export default App;
