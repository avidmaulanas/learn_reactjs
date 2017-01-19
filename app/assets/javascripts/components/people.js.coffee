class @People extends React.Component
  render: ->
    <div>
      <FormPerson />
      <ListPeople people={@props.people} />
    </div>
