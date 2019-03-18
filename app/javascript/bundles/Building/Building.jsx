import React, { Component } from "react";
import axios from "axios";

class Building extends Component {
    
  state = {
    query: '',
    results: []
  }
  
    async componentDidMount() {
    const { data } = await axios.get("/buildings/25.json");
    console.log(data);
  }

  handleInputChange = () => {
    this.setState({
      query: this.seach.data
    })
  }

  render() {
    return(
      <form> 
        <input
        placeholder= "Search"
        onChange={this.handleInputChange}
        />
      </form>
    )

  }
}



export default Building;
