import React, { Component } from 'react';
import axios from 'axios';
import Modal from '../Modal';
import { headers } from '../config';

class Goods extends Component {
  state = { goods: [], isOpen: false, isUpdate: false, updatingId: String() }
  componentDidMount() {
    this.fetchGoods()
  }
  fetchGoods = async _ => {
    const { data: { goods } } = await axios.get('/goods.json')
    this.setState({ goods })
  }
  toggleModal = _ => this.setState({ isOpen: !this.state.isOpen })  
  createGood = async goodData => {
    const { isUpdate, updatingId } = this.state;
    !isUpdate 
    ? await axios.post('/goods.json', goodData, { headers: headers })
    : await axios.patch(`/goods/${updatingId}`, goodData, { headers: headers })
    this.toggleModal();
    this.fetchGoods();
    this.setState({ isUpdate: false });
  }
  deleteGood = id => async _ => {
    id && await axios.delete(`/goods/${id}`, { headers: headers })
    this.fetchGoods();
  }
  isUpdating = updatingId => _ => {
    this.setState({ isUpdate: true, updatingId })
    this.toggleModal()
  }

  isOwner = id => this.props.currentUser.id === id

  render() {
    const { goods, isOpen } = this.state
    return (
      <div>
        <h1>Goods: Offered & Needed</h1>
        <div className="New-Good">
          <button onClick={this.toggleModal} className="btn btn-primary">Create New Good</button>
        </div>
        <table className="da-goods">
          <thead>
            <tr>
              <th>Description</th>
              <th>More information</th>
            </tr>
          </thead>
          <tbody>
            {
              goods.map(good => (
                <tr key={good.id}>
                  <td>{good.description}</td>
                  <td>{good.more_information}</td>
                  <td><img src={good.image} /></td>
                  {this.isOwner(good.ownerId) ? (
                  <div>
                  <td><button onClick={this.isUpdating(good.id)} className="btn btn-primary">Edit</button></td>
                  <td><button onClick={this.deleteGood(good.id)} className="btn btn-primary">Delete</button></td>
                  </div>
                  ) : (
                    <div>
                    <td></td>
                    <td></td>
                    </div>
                  )}
                </tr>
              ))
            }
        </tbody>
      </table>
      <Modal type='good' toggleModal={this.toggleModal} isOpen={isOpen} createItem={this.createGood} />
    </div>
    )
  }
}

export default Goods;



