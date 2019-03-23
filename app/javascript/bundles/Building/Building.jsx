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
    const modal = (
      <Portal className="foo">
        <aside className="c-modal-cover">
          <div className="c-modal">
            <button onClick={this.toggleModal} className="c-modal__close">
              <span className="u-hide-visually">Close</span>
              <svg className="c-modal__close-icon" viewBox="0 0 40 40"><path d="M 10,10 L 30,30 M 30,10 L 10,30"></path></svg>
            </button>
            <div className="c-modal__body">
              CONTENT WILL GO HERE
            </div>
          </div>
        </aside>
      </Portal>
    )
    console.log(Portal)
    const { goods, services, feed, isOpen } = this.state
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
        { isOpen && modal }
      </div>
    );

  }
}

export default Building;
