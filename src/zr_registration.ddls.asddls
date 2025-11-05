@EndUserText.label: 'Registration'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZR_REGISTRATION
  as select from ZI_REGISTRATION
  association to parent ZR_EVENT as _Event on $projection.EventUuid = _Event.EventUuid
{
  key RegistrationUuid,
      RegistrationId,
      EventUuid,
      ParticipantUuid,
      Status,
      Remarks,
      
      /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      /* Associations */
      _Event
}
