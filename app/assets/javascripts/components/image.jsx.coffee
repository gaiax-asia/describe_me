jQuery ->
  Component.Image = React.createClass
    getInitialState: ->
      {
        image: this.props.image
      }
    render: ->
      return `<div className='container'>
          <img src={this.state.image} />
        </div>`
