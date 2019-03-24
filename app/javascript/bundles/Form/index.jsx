import React, { Component } from 'react';

class Form extends Component {
  state = { description: String(), more_information: String(), pic: String() }
  handleInputChange = field => e => this.setState({ [field]: e.target.value });
  handleFileChange = e => this.setState({ pic: e.target.files[0] })
  handleSubmit = e => {
    e.preventDefault()
    const { createItem, type } = this.props;
    const formData = new FormData()
    const states = Object.entries(this.state);
    states.forEach(state => formData.append(`${type}[${state[0]}]`, state[1]))
    createItem(formData)
    this.setState({ description: String(), more_information: String(), pic: String() })
  }
  render() {
    console.log(this.props.type);
    const { description, more_information } = this.state
    const { toggleModal } = this.props;
    return (
      <form onSubmit={this.handleSubmit}>
        <div className='field'>
          <label htmlFor='name'>Description</label>
          <input
            name='description'
            type='text'
            value={description}
            onChange={this.handleInputChange('description')}
          />
        </div>
        <div className='field'>
          <label htmlFor='name'>More Information</label>
          <input
            name='more_information'
            type='text'
            value={more_information}
            onChange={this.handleInputChange('more_information')}
          />
        </div>
        <div className='field'>
          <label htmlFor='image'>Image</label>
          <input
            name='pic'
            type='file'
            onChange={this.handleFileChange}
          />
        </div>
        <div className="modal-btns">
          <button className="c-modal__close" type="submit">Create</button>
          <button type="button" onClick={toggleModal}>Cancel</button>
        </div>
      </form>
    )
  }
}

export default Form;
