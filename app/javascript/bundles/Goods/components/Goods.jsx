import React from "react";


class Goods extends React.Component {

 render () {

   return (
     <div className="accordion" id="accordionExample">
      {
        this.props.goods.map( (good, i) => {
          return (
            <div key = {i} className="card">
              <div className="card-header" id="headingOne">
                <h2 className="mb-0">
                  <button className="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    {good.description}
                  </button>
                </h2>
              </div>

              <div id="collapseOne" className="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div className="card-body">
                  {good.more_information}
                  <div className="float-right">
                    <i className="fas fa-pencil-alt mr-3"></i>
                    <i className="fas fa-trash-alt"></i>
                  </div>
                </div>
              </div>
            </div>

          )
        })

      }

    </div>
   );


 }



}


export default Goods

//
// {
//   this.props.goods.map( (good, i) => {
//     return (
//       <Fragment key={i}>
//         <h2
//           className="title"
//           onClick={() => this.setState({ open: open === i ? false : i })}
//         >
//           {good.description}
//         </h2>
//         <Content className="content" pose={open === i ? 'open' : 'closed'}>
//           <div className="content-wrapper">{good.more_information}</div>
//         </Content>
//       </Fragment>
//     )
//   })
// }
