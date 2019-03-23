import React, { Component } from "react";
import { Portal } from "react-portal";
import axios from "axios";

class Building extends Component {
    
  state = {
    term: '',
    goods: [],
    services: [],
    isOpen: false,
  }
  async componentDidMount() {
    this.fetchResults(this.state.term)
  }

  fetchResults = async (term) => {
    const { data } = await axios.get(`/buildings/${this.props.id}.json?term=${term}`);
    console.log(data)
    this.setState({ goods: data.goods, services: data.services, term })
  }

  handleInputChange = event => {
    const term = event.target.value
    this.fetchResults(term)
  }

  toggleModal = _ => this.setState({ isOpen: !this.state.isOpen })

  render() {
    const { goods, services, isOpen } = this.state
    return (
      <div>
        <input placeholder="Search" onChange={this.handleInputChange} />
        <div id="goods-and-services">
          <div className="goods">
            <h3>Goods</h3>
            <ul>
              {goods.map(good => (
                <li key={good.id}>
                  <img src={good.owner_pic} width="75" />
                  <a href={good.location}>{good.description}</a>
                </li>
              ))}
            </ul>
          </div>
          <div>
            <h3>Services</h3>
            <ul>
              {services.map(service => (
                <li key={service.id}>
                  <img src={service.owner_pic} width="75" />
                  <a href={service.location}>{service.description}</a>
                </li>
              ))}
            </ul>
          </div>
        </div>
        <button onClick={this.toggleModal}>Open Modal</button>
      </div>
    );

  }
}

export default Building;
