class @ListPeople extends React.Component
  # @propTypes =
  #   name: React.PropTypes.string
  #   email: React.PropTypes.string

  deleteProduct: (index) ->
    { people } = @props
    people.splice(index, 1);
    @setState(people: people)

  editProduct: (index) ->
    person = @props.people[index]
    console.log(person)
    name = person.name
    price = person.price

  render: ->
    # console.log(@props.people)
    list_people = []
    @props.people.forEach (person, index) =>
      list_people.push(
        <TableRow key={index} person={person} onEdit={@editProduct.bind(@, index)} onDelete={@deleteProduct.bind(@, index)} />
      )
    <div>
      <h1>Listing People</h1>
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th colSpan="3"></th>
          </tr>
        </thead>

        <tbody>
          { list_people }
        </tbody>
      </table>
    </div>

class @TableRow extends React.Component
  render: ->
    { person, onEdit, onDelete } = @props
    { id, name, email } = person
    <tr>
      <td>{name}</td>
      <td>{email}</td>
      <td><a href={Routes.person_path(person.id)}>Edit</a></td>
      <td><a href='javascript:void(0)' onClick={onDelete}>Delete</a></td>
    </tr>
