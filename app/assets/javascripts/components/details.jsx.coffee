jQuery ->
  Component.Details = React.createClass
    render: ->
      return `<div className='container'>
          <div className='row'>
            <div className='col-md-3'></div>
            <a className='col-md-5' href={this.props.fb_link}>{this.props.name}</a>
          </div>
        </div>`
