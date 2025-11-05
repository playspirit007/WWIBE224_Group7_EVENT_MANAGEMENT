@EndUserText.label: 'Event'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZR_EVENT
  as select from ZI_EVENT
  composition [0..*] of ZR_REGISTRATION as _Registrations
{
  key EventUuid,
      EventId,
      Title,
      Location,
      StartDate,
      EndDate,
      MaxParticipants,
      Status,
      Description,
      
      /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      /* Associations */
      _Registrations
}
