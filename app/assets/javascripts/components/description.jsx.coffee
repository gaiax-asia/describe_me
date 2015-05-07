jQuery ->
  Component.Description = React.createClass
    render: ->
      return `<div className='container'>
        <div className='row'>
          <span className='col-md-6'>by Anonymous:</span>
          &nbsp;
          <span className='col-md-6'>{this.props.description}</span>
        </div>
      </div>`
