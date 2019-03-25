import React, { Component } from "react";
import axios from "axios";
import Modal from '../Modal';
import { headers } from '../config';

class Building extends Component {

  state = {
    term: '',
    goods: [],
    services: [],
    isOpen: false,
    type: String(),
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

  startCreate = type => e => {
    this.setState({ type}, _ => {
      this.toggleModal()
    })
  }

  createItem = async itemData => {
    const { type } = this.state
    const { data } = await axios.post(`/${type}s.json`, itemData, { headers: headers })
    this.toggleModal();
    this.fetchResults(this.state.term);
  }

  render() {
    const { goods, services, isOpen, type } = this.state
    return (
      <div>
       <div className="search">
        <input placeholder="Search" onChange={this.handleInputChange} />
        </div>
        <div className="homebuttons">
          <button onClick={this.startCreate("good")}>Add a Good</button>
          <button onClick={this.startCreate("service")}>Add a Service</button>
        </div>
        <div id="goods-and-services">
          <div className="goods">
            <h3 id="goods-and-services-title">Goods</h3>
            <ul>
              {goods.map(good => (
                <li key={good.id}>
                  <img src={good.owner_pic} width="25" className="pictureIcon" />
                  <a href={good.location} className="gsDescription">{good.description}</a>
                </li>
              ))}
            </ul>
          </div>
          <div>
            <h3 id="goods-and-services-title">Services</h3>
            <ul>
              {services.map(service => (
                <li key={service.id}>
                  <img src={service.owner_pic} width="25" className="pictureIcon" />
                  <a href={service.location} className="gsDescription">{service.description} </a>
                </li>
              ))}
            </ul>
          </div>
        </div>
        <Modal createItem={this.createItem} isOpen={isOpen} type={type} toggleModal={this.toggleModal} />
      </div>
    );
  }
}

export default Building;
