jQuery ->
  Component.DescriptionInput = React.createClass
    getInitialState: ->
      {
        description: this.props.description
        id: this.props.id
      }

    updateDescription: (e) ->
      this.setState({ description: $(e.currentTarget).val() })

    saveDescription: (e) ->
      #$.ajax{
      #  url: "/users/#{this.state.id}/describe"
      #  type: 'POST'
      #  success: (a,b,c) ->
      #    console.log "success"
      #  error: (a,b,c) ->
      #    console.log "error"
      #
      #}
      description = this.state.description

    render: ->
      return `<div className='container'>
          <textarea rows="4" width="100%" value={this.state.description} onChange={this.updateDescription}></textarea>
          <button onClick={this.saveDescription} className="btn btn-default" type="submit">Submit</button>
        </div>`
