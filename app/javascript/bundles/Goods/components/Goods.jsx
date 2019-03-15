import React, { Fragment } from "react";
import posed from 'react-pose';
import "./Goods.css";


const Content = posed.div({
  closed: { height: 0 },
  open: { height: 'auto' }
});


class Goods extends React.Component {

 render () {

   return (
    <div>
      {
        this.props.goods.map( (good, i) => {
          return (
            <Fragment key={i}>
              <h2
                className="title"
                onClick={() => this.setState({ open: open === i ? false : i })}
              >
                {good.description}
              </h2>
              <Content className="content" pose={open === i ? 'open' : 'closed'}>
                <div className="content-wrapper">{good.more_information}</div>
              </Content>
            </Fragment>
          )
        })
      }
    </div>
   );


 }



}


export default Goods
