@EndUserText.label: 'Participant'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZR_PARTICIPANT
  as select from ZI_PARTICIPANT
{
  key ParticipantUuid,
      ParticipantId,
      FirstName,
      LastName,
      Email,
      Phone,
      
      /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt
}
