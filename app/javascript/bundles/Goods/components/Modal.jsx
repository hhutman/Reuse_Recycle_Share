import React from 'react'

const Modal = props => {
  return(

    <div className="modal fade show" id="exampleModal" tabIndex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div className="modal-dialog" role="document">
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title" id="exampleModalLabel">Good</h5>
            <button type="button" className="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div className="modal-body">
            <form onSubmit={ (event) => { props.handleSubmit(event) } }>

            <div className="form-group">
              <label htmlFor="description">description</label>
              <input type="text" name="good[description]" className="form-control" defaultValue={props.good.description}/>
            </div>

              <div className="form-group">
                <label htmlFor="availability">availability</label>
                <input type="text" name="good[availability]" className="form-control" defaultValue={props.good.availability}/>
              </div>

              <div className="form-group">
                <label htmlFor="more_information">more information</label>
                <input type="text" name="good[more_information]" className="form-control" defaultValue={props.good.more_information}/>
              </div>
              <input type="hidden" name="id" defaultValue={props.good.id}/>
              <input type="hidden" name="good[user_id]" defaultValue={props.good.user_id}/>

              <button type="submit" className="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>

  )

}

export default Modal
