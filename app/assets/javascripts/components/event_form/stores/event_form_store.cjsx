alt = require("../shared/alt")
EventFormActions = require("../actions/event_form_actions")

class EventFormStore
  constructor: ->
    this.formData = {}
    this.canSubmit = false
    this.serverErrors = []

    this.bindListeners
      handleSetCanSubmit:   EventFormActions.SET_CAN_SUBMIT
      handleFormChanged:    EventFormActions.FORM_CHANGED
      handleSetFormState:   EventFormActions.SET_FORM_STATE

    this.exportPublicMethods
      getCanSubmit:     this.getCanSubmit
      getFormData:      this.getFormData
      getServerErrors:  this.getServerErrors

  handleSetCanSubmit: (state) ->
    this.canSubmit = state

  handleFormChanged: (newData) ->
    this.formData[newData.key] = newData.value

  # public methods

  getCanSubmit: ->
    this.getState.canSubmit

  getFormData: ->
    this.getState.formData

  getServerErrors: ->
    this.getState.serverErrors

module.exports = alt.createStore(EventFormStore, "EventFormStore")
