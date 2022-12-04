import React from "react";
import "./style.css";
import { Link } from "react-router-dom";
import { tablesList } from "./tablesList";

export default function tables() {
  return (
    <div className="container mt-3">
      <div>
        <h2>Tables</h2>
        <div className="row">
          {tablesList.map((item) => {
            return (
              <Link
                key={item.Customer_ID}
                to={`/${item.Customer_ID}`}
                style={{ textDecoration: "none" }}
                className="col"
              >
                <div className="card table-card me-3 mb-3">
                  <div className="card-body">
                    <h5 className="card-text ">Table {item.Customer_name}</h5>
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </div>
    </div>
  );
}
