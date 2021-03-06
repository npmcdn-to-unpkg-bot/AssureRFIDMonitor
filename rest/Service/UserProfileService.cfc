

component restpath='UserProfileService' rest='true'
{

    cfinclude (template = '../setting.cfm');
    cfinclude (template = '../include/QueryToArray.cfm');

    remote function getUserProfile(required numeric userProfileId restargsource='Query',
                                   required numeric entityId      restargsource='Query')
            httpmethod='get' returnType='array' returnFormat='json' restpath='searchParams'
    {

        // Determine if search or get one
        if (userProfileId == 0){
            result =  new StoredProc(
                procedure        = "p_search_entity_user",
                datasource        = dataSource,
                parameters        = [{dbvarname="@entity_id", value=entityId, cfsqltype="CF_SQL_INTEGER"}],
                procResults        = [{resultset=1, name="resultUserProfile"}]).execute();
        }
        else
        {
            result =  new StoredProc(
                procedure        = "p_get_user_profile",
                datasource        = dataSource,
                parameters        = [{dbvarname="@user_profile_id", value=userProfileId, cfsqltype="CF_SQL_INTEGER"}],
                procResults        = [{resultset=1, name="resultUserProfile"}]).execute();

        }

        return queryToArray(result.getProcResultSets().resultUserProfile);
    }

    remote function updateUserProfile() httpmethod='post' returnType='array' returnFormat='json' produces='application/json'
    {

        requestBody = toString( getHttpRequestData().content );
        if ( len( requestBody ) ) {
            structAppend( form, deserializeJson( requestBody ) );
        }

        // Determine if insert or update
        if (user_profile_id == 0){
            result =  new StoredProc(
                procedure        = "p_insert_user_profile",
                datasource        = dataSource,
                parameters        = [{dbvarname="@user_status_id", value=user_status_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@user_type_id", value=user_type_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@first_name", value=first_name, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@last_name", value=last_name, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@phone", value=phone, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@mobile_phone", value=mobile_phone, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@email", value=email, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@country_id", value=country_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@username", value=username, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@password", value=password, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@is_send_booking_email", value=is_send_booking_email, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@insert_user_id", value=insert_user_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@entity_id", value=entity_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@user_group_id", value=user_group_id, cfsqltype="CF_SQL_INTEGER"}],
                procResults        = [{resultset=1, name="resultUserProfile"}]).execute();
        }
        else
        {
            result =  new StoredProc(
                procedure        = "p_update_user_profile",
                datasource        = dataSource,
                parameters        = [{dbvarname="@user_profile_id", value=user_profile_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@user_status_id", value=user_status_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@user_type_id", value=user_type_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@first_name", value=first_name, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@last_name", value=last_name, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@phone", value=phone, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@mobile_phone", value=mobile_phone, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@email", value=email, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@country_id", value=country_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@username", value=username, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@password", value=password, cfsqltype="CF_SQL_VARCHAR"},
                                     {dbvarname="@is_send_booking_email", value=is_send_booking_email, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@update_user_id", value=update_user_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@entity_id", value=entity_id, cfsqltype="CF_SQL_INTEGER"},
                                     {dbvarname="@user_group_id", value=user_group_id, cfsqltype="CF_SQL_INTEGER"}],
                procResults        = [{resultset=1, name="resultUserProfile"}]).execute();
        }

        return queryToArray(result.getProcResultSets().resultUserProfile);

    }

}

