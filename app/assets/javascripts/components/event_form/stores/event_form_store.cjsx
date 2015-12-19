alt = require("../../shared/alt.js.coffee")
EventFormActions = require("../actions/event_form_actions.cjsx")

class EventFormStore
  constructor: ->
    this.formData = {}
    this.canSubmit = false
    this.serverErrors = []

    this.bindListeners
      handleSetCanSubmit:   EventFormActions.SET_CAN_SUBMIT
      handleFormChanged:    EventFormActions.FORM_CHANGED
      handleIdChanged:      EventFormActions.ID_CHANGED
      handleClearFormData:  EventFormActions.CLEAR_FORM_DATA

    this.exportPublicMethods
      getCanSubmit:     this.getCanSubmit
      getFormData:      this.getFormData
      getServerErrors:  this.getServerErrors

  handleSetCanSubmit: (state) ->
    this.canSubmit = state

  handleClearFormData: ->
    this.formData = {}

  handleFormChanged: (newData) ->
    this.formData[newData.key] = newData.value

  handleIdChanged: (id) ->
    console.log(id)
    this.formData["eventID"] = id

  # public methods

  getCanSubmit: ->
    this.getState().canSubmit

  getFormData: ->
    this.getState().formData

  getServerErrors: ->
    this.getState().serverErrors

module.exports = alt.createStore(EventFormStore, "EventFormStore")
