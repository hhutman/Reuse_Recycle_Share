import React, { Component } from "react";
import axios from "axios";

class Building extends Component {
  async componentDidMount() {
    const { data } = await axios.get("/buildings/25.json");
    console.log(data);
  }
  render() {
    return <div>HELLO FROM REACT</div>;
  }
}

export default Building;
