class @FormPerson extends React.Component
  constructor: (props) ->
    super(props)
    @state = {
      person: @props.person
      isEdit: @props.isEdit
    }

  componentWillReceiveProps: (nextProps) ->
    @setState
      person: nextProps.person

  handleSubmit: =>
    formData = $('.form-person').serialize()
    # console.log(@state)
    $.ajax
      url: Routes.people_path()
      method: 'POST'
      dataType: 'json'
      data: formData
      success: (data) =>
        @props.addPerson(data)

  handleEdit: =>
    console.log('editing')


  changeInput: (field, event) =>
    person = @state.person

    person[field] = event.target.value

    @setState
      person: person
      isEdit: @props.isEdit

  render: ->
    console.log(@state)
    <div>
      <h3>New Person</h3>
      <form className='form-person'>
        <div className='field'>
          <input name='person[name]' type='text' value={@state.person.name} onChange={@changeInput.bind(@, 'name')} />
        </div>
        <div className='field'>
          <input name= 'person[email]' type='text' value={@state.person.email} onChange={@changeInput.bind(@, 'email')} />
        </div>
        <div className='actions'>
          { !@state.isEdit && <button id='insertButton' onClick={@handleSubmit}>Submit</button> }
          { @state.isEdit && <button id='updateButton' onClick={@handleEdit}>Update</button> }
        </div>
      </form>
    </div>
