import React, { Component } from 'react';
import axios from 'axios';
import Modal from '../Modal';
import { headers } from '../config';

class Services extends Component {
  state = { services: [], isOpen: false, isUpdate: false, updatingId: String() }
  componentDidMount() {
    this.fetchServices()
  }
  fetchServices = async _ => {
    const { data: { services } } = await axios.get('/services.json')
    this.setState({ services })
  }
  toggleModal = _ => this.setState({ isOpen: !this.state.isOpen })  
  createService = async serviceData => {
    const { isUpdate, updatingId } = this.state;
    !isUpdate 
    ? await axios.post('/services.json', serviceData, { headers: headers })
    : await axios.patch(`/services/${updatingId}`, serviceData, { headers: headers })
    this.toggleModal();
    this.fetchServices();
    this.setState({ isUpdate: false });
  }
  deleteService = id => async _ => {
    id && await axios.delete(`/services/${id}`, { headers: headers })
    this.fetchServices();
  }
  isOwner = id => this.props.currentUser.id === id
  isUpdating = updatingId => _ => {
    this.setState({ isUpdate: true, updatingId })
    this.toggleModal()
  }

  render() {
    const { services, isOpen } = this.state
    return (
      <div>
        <h1>services: Offered & Needed</h1>
        <div className="New-service">
          <button onClick={this.toggleModal} className="btn btn-primary">Create New Service</button>
        </div>
        <table className="da-services">
          <thead>
            <tr>
              <th>Description</th>
              <th>More information</th>
            </tr>
          </thead>
          <tbody>
            {
              services.map(service => (
                <tr key={service.id}>
                  <td>{service.description}</td>
                  <td>{service.more_information}</td>
                  <td><img src={service.image} /></td>
                  {this.isOwner(service.ownerId) ? (
                  <div>
                  <td><button onClick={this.isUpdating(service.id)} className="btn btn-primary">Edit</button></td>
                  <td><button onClick={this.deleteService(service.id)} className="btn btn-primary">Delete</button></td>
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
      <Modal type='service' toggleModal={this.toggleModal} isOpen={isOpen} createItem={this.createService} />
    </div>
    )
  }
}

export default Services;



