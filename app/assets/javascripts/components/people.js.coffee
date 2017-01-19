class @People extends React.Component

  constructor: (props) ->
    super(props)
    @state = {
      people: @props.people
      person: {
        name: '',
        email: ''
      }
      isEdit: false
    }

  # Handle success add person
  addPerson: (data) =>
    @setState
      people: @state.people.concat(data)
      person: {name: '', email: ''}

  deleteProduct: (index) =>
    { people } = @props
    people.splice(index, 1);
    @setState(people: people)

  editPerson: (id) =>
    person = $.grep @props.people, (person) -> person.id == id
    @setState
      person: person[0]
      isEdit: true

  render: ->
    <div>
      <FormPerson person={@state.person} addPerson={@addPerson} isEdit={@state.isEdit}/>
      <ListPeople people={@state.people} editPerson={@editPerson}/>
    </div>
