import React, { Component } from "react";

class Counter extends Component {
  // Updating Mount
  componentDidUpdate(prevProps, prevState) {
    // if (prevProps.counter.value !== this.props.counter.value) {
    //   // Ajax call and get new data from the server
    //   // ...
    // }
  }

  componentWillUnmount() {
    // called just before component removed from the DOM
    // clean up listener, timers, ... to prevent memory leak
  }

  // get rid of local state to make create a single source of truth
  //   state = {
  //     value: this.props.counter.value,
  //     // imageUrl: 'https://picsum.photos/200',
  //     // tags: ['tag1', 'tag2', 'tag3'],
  //   };

  styles = {
    fontSize: "30px",
    fontWeight: "bold",
  };

  // constructor() {
  //     super();
  //     this.handleIncrement = this.handleIncrement.bind(this);
  // }

  render() {
    return (
      <div className="row">
        <div className="col col-1">
          <span className={this.getBadgeClasses()}>{this.formatCounter()}</span>
        </div>

        <div className="col">
          <button
            disabled={this.props.value <= 0 && true}
            onClick={() => this.props.onDecrement(this.props.counter)}
            className="btn btn-secondary btn-sm m-2"
          >
            -
          </button>
          <button
            onClick={() => this.props.onDelete(this.props.counter.id)}
            className="btn btn-danger btn-sm"
          >
            X
          </button>
        </div>
      </div>
    );
  }

  getBadgeClasses() {
    let classes = "badge m-2 bg-";
    classes += this.props.value === 0 ? "warning" : "primary";
    return classes;
  }

  formatCounter() {
    const { value } = this.props;
    return value === 0 ? "Zero" : value;
  }
}
export default Counter;
