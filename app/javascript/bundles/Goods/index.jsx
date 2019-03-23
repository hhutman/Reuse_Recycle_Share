import React, { Component } from 'react';
import axios from 'axios';

class Goods extends Component {
  state = { goods: [] }
  async componentDidMount() {
    const { data: goods } = await axios.get('/goods.json')
    this.setState({ goods })
  }
  render() {
    const { goods } = this.state
    return (
      <div>
        <h1>Goods: Offered & Needed</h1>
        <div className="New-Good">
          <button>Create New Good</button>
        </div>
        <table class="da-goods">
          <thead>
            <tr>
              <th>Description</th>
              <th>More information</th>
            </tr>
          </thead>
          <tbody>
            {
              goods.map(good => (
                <div>
                  <td>{good.description}</td>
                  <td>{good.more_information}</td>
                </div>
              ))
            }
        </tbody>
      </table>
    </div>
    )
  }
}

