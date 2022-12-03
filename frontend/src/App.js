import { Routes, Route, Navigate } from "react-router-dom";
import './App.css';
import Menu from './components/menu';


function App() {
  return (
    <main>
      <Routes>
        <Route path="/menu" element={Menu} />
      </Routes>
    </main>
  );
}

export default App;
