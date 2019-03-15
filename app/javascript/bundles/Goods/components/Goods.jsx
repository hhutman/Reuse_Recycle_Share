import React from "react";
import Modal from './Modal'

const csrfToken = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-TOKEN': ReactOnRails.authenticityToken(),
}

class Goods extends React.Component {

  state = {
    goods: this.props.goods,
    good: {},
  }

  handleEdit = (event) => {
    let goodId = event.target.dataset.good
    fetch(`/goods/${goodId}/edit`)
      .then(res => res.json())
      .then(data => this.setState({
        good: data,
        modalShow: true
      }))
    $("#exampleModal").modal("toggle")
  }

  handleSubmit = event => {
    event.preventDefault()
    let options = { method: 'PUT', headers: csrfToken, body: new FormData(event.target)}
    fetch(`/goods/${event.target.id.value}.json`, options )
      .then( res => res.json() )
      .then( data => {
        this.setState({ goods: data })
        $("#exampleModal").modal("toggle")
      })
      .catch( err => console.log(err) )
  }

  render () {
   return (
     <div className="accordion" id="accordionExample">
      {
        this.state.goods.map( (good, i) => {
          return (
            <div key = {i} className="card">
              <div className="card-header" id="headingOne">
                <h2 className="mb-0">
                  <button className="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    {good.description}
                  </button>
                </h2>
              </div>

              <div id="collapseOne" className="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div className="card-body">
                  <h1>More Information: </h1>
                  <p>{good.more_information} </p>
                  <h3>Avaiability </h3>
                  <p>{good.availability}</p>
                  <div className="float-right">
                    <i className= "fas fa-pencil-alt mr-3" onClick = {this.handleEdit}  data-good={good.id}></i>
                    <i className="fas fa-trash-alt"></i>
                  </div>
                </div>
              </div>
            </div>

          )
        })

      }

      <Modal good={this.state.good} handleSubmit={this.handleSubmit} />

    </div>
   );

  }

}


export default Goods
