import React, { Component } from 'react';
import axios from 'axios';
import Modal from '../Modal';
import { headers } from '../config';

class Items extends Component {
  constructor(props) {
    super(props)
    this.type = props.type;
  }
  state = { items: [], isOpen: false, isUpdate: false, updatingId: String() }
  componentDidMount() {
    this.fetchItems()
  }
  fetchItems = async _ => {
    const { data } = await axios.get(`/${this.type}s.json`)
    this.setState({ items: data[`${this.type}s`] })
  }
  toggleModal = _ => this.setState({ isOpen: !this.state.isOpen })  
  createItem = async itemData => {
    const { isUpdate, updatingId } = this.state;
    !isUpdate 
    ? await axios.post(`/${this.type}s.json`, itemData, { headers: headers })
    : await axios.patch(`/${this.type}s/${updatingId}`, itemData, { headers: headers })
    this.toggleModal();
    this.fetchItems();
    this.setState({ isUpdate: false });
  }
  deleteItem = id => async _ => {
    id && await axios.delete(`/${this.type}s/${id}`, { headers: headers })
    this.fetchItems();
  }
  isUpdating = updatingId => _ => {
    this.setState({ isUpdate: true, updatingId })
    this.toggleModal()
  }
  isOwner = id => this.props.currentUser.id === id

  render() {
    const { items, isOpen } = this.state
    const { type } = this.props;
    const typeLabel = type[0].toUpperCase() + type.substr(1);
    return (
      <div>
        <h1>{typeLabel}: Offered & Needed</h1>
        <div className="New-Good">
          <button onClick={this.toggleModal} className="btn btn-primary">Create New {typeLabel}</button>
        </div>
        <table className={`da-${this.type}s`}>
          <thead>
            <tr>
              <th>Description</th>
              <th>More information</th>
            </tr>
          </thead>
          <tbody>
            {
              items.map(item => (
                <tr key={item.id}>
                  <td>{item.description}</td>
                  <td>{item.more_information}</td>
                  <td><img src={item.image} /></td>
                  {this.isOwner(item.ownerId) ? (
                  <div>
                    <td><button onClick={this.isUpdating(item.id)} className="btn btn-primary">Edit</button></td>
                    <td><button onClick={this.deleteItem(item.id)} className="btn btn-primary">Delete</button></td>
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
      <Modal type={type} toggleModal={this.toggleModal} isOpen={isOpen} createItem={this.createItem} />
    </div>
    )
  }
}

export default Items;



