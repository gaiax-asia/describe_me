#Main View

jQuery ->
  Component.Catalog = React.createClass
    getDefaultProps: ->
      {
        name: 'Jon Snow'
        image: 'http://www.allmediany.com/bignails/1343917142_blank.jpg'
        fb_link: 'https://www.facebook.com/JonSnowWatcherOnTheWall'
        description: 'He knows Nothing!'
      }

    render: ->
      return `<div className='container'>
        <div clasName='row'>
          Catalog
        </div>
        <div className='row'>
          <div className='col-sm-6 container'>
              <div className='row'>
                  <div className='col-sm-12 image'>
                      < Component.Image image={this.props.image} />
                  </div>
              </div>

              <div className='row'>
                  <div className='col-sm-12 details'>
                      < Component.Details name={this.props.name} fb_link={this.props.fb_link} />
                  </div>
              </div>
          </div>
          <div className='col-sm-6 container'>
            < Component.Descriptions />
          </div>

        </div>
        <div className='row'>
          <div className='col-sm-12'>
            < Component.DescriptionInput description={this.props.description} id={this.props.id}/>
          </div>
        </div>
      </div>`