class @FormPerson extends React.Component
  constructor: (props) ->
    super(props)
    @state = {
      people: @props.people
      person: @props.person
      isEdit: @props.isEdit
    }

  componentWillReceiveProps: (nextProps) ->
    @setState
      people: nextProps.people
      person: nextProps.person
      isEdit: nextProps.isEdit

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
    formData = $('.form-person').serialize()
    # console.log(@state)
    $.ajax
      url: Routes.person_path(@state.person.id)
      method: 'PUT'
      dataType: 'json'
      data:
        person: @state.person
      success: (data) =>
        # debugger
        # console.log(@state)
        people = @state.people
        $.each people, (key, value) ->
          if key == 'id' && value == @state.person.id
            people[key] = @state.person.id

        @setState
          people: people
          person:
            name: ''
            email: ''
          isEdit: false

  changeInput: (field, event) =>
    person = @state.person

    person[field] = event.target.value

    @setState
      person: person
      isEdit: @props.isEdit

  render: ->
    # console.log(@state)
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
          { !@state.isEdit && <button id='insertButton' type='button' onClick={@handleSubmit}>Submit</button> }
          { @state.isEdit && <button id='updateButton' type='button' onClick={@handleEdit}>Update</button> }
        </div>
      </form>
    </div>
