CLASS zcl_group1_event_data_gen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_group1_event_data_gen IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_events TYPE TABLE OF zevent_a,
          ls_event TYPE zevent_a,
          lt_participants TYPE TABLE OF zparticipant_a,
          ls_participant TYPE zparticipant_a.

    " Clear existing data
    DELETE FROM zevent_a.
    DELETE FROM zparticipant_a.
    DELETE FROM zregistration_a.

    out->write( 'Deleting existing data...' ).

    " Create ONE Event mit fester UUID
    ls_event-event_uuid = '1234567890123456'.
    ls_event-event_id = '00001'.
    ls_event-title = 'Annual Tech Conference 2025'.
    ls_event-location = 'Berlin Convention Center'.
    ls_event-start_date = '20251201'.
    ls_event-end_date = '20251203'.
    ls_event-max_participants = 200.
    ls_event-status = 'P'.
    ls_event-description = 'Annual technology conference with latest innovations'.
    ls_event-created_by = 'TEST_USER'.
    GET TIME STAMP FIELD ls_event-created_at.
    ls_event-last_changed_by = 'TEST_USER'.
    GET TIME STAMP FIELD ls_event-last_changed_at.
    APPEND ls_event TO lt_events.

    " Create ONE Participant mit fester UUID
    ls_participant-participant_uuid = '6543210987654321'.
    ls_participant-participant_id = '00001'.
    ls_participant-first_name = 'Max'.
    ls_participant-last_name = 'Mustermann'.
    ls_participant-email = 'max.mustermann@email.com'.
    ls_participant-phone = '+491701234567'.
    ls_participant-created_by = 'TEST_USER'.
    GET TIME STAMP FIELD ls_participant-created_at.
    ls_participant-last_changed_by = 'TEST_USER'.
    GET TIME STAMP FIELD ls_participant-last_changed_at.
    APPEND ls_participant TO lt_participants.

    " Insert data into database tables
    INSERT zevent_a FROM TABLE @lt_events.
    out->write( |Inserted Events: { sy-dbcnt }| ).

    INSERT zparticipant_a FROM TABLE @lt_participants.
    out->write( |Inserted Participants: { sy-dbcnt }| ).

    out->write( 'Test data generation completed successfully!' ).

  ENDMETHOD.

ENDCLASS.
