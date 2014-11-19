--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: i2b2demodata; Type: SCHEMA; Schema: -; Owner: weymouth
--

CREATE SCHEMA i2b2demodata;


ALTER SCHEMA i2b2demodata OWNER TO weymouth;

--
-- Name: i2b2hive; Type: SCHEMA; Schema: -; Owner: weymouth
--

CREATE SCHEMA i2b2hive;


ALTER SCHEMA i2b2hive OWNER TO weymouth;

--
-- Name: i2b2imdata; Type: SCHEMA; Schema: -; Owner: weymouth
--

CREATE SCHEMA i2b2imdata;


ALTER SCHEMA i2b2imdata OWNER TO weymouth;

--
-- Name: i2b2metadata; Type: SCHEMA; Schema: -; Owner: weymouth
--

CREATE SCHEMA i2b2metadata;


ALTER SCHEMA i2b2metadata OWNER TO weymouth;

--
-- Name: i2b2pm; Type: SCHEMA; Schema: -; Owner: weymouth
--

CREATE SCHEMA i2b2pm;


ALTER SCHEMA i2b2pm OWNER TO weymouth;

--
-- Name: i2b2workdata; Type: SCHEMA; Schema: -; Owner: weymouth
--

CREATE SCHEMA i2b2workdata;


ALTER SCHEMA i2b2workdata OWNER TO weymouth;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = i2b2demodata, pg_catalog;

--
-- Name: create_temp_concept_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_concept_table(tempconcepttablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    EXECUTE 'create table ' ||  tempConceptTableName || ' (
        CONCEPT_CD varchar(50) NOT NULL, 
        CONCEPT_PATH varchar(900) NOT NULL , 
        NAME_CHAR varchar(2000), 
        CONCEPT_BLOB text, 
        UPDATE_DATE timestamp, 
        DOWNLOAD_DATE timestamp, 
        IMPORT_DATE timestamp, 
        SOURCESYSTEM_CD varchar(50)
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempConceptTableName || '_pat_id ON ' || tempConceptTableName || '  (CONCEPT_PATH)';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_concept_table(tempconcepttablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_eid_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_eid_table(temppatientmappingtablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    EXECUTE 'create table ' ||  tempPatientMappingTableName || ' (
        ENCOUNTER_MAP_ID        varchar(200) NOT NULL,
        ENCOUNTER_MAP_ID_SOURCE     varchar(50) NOT NULL,
        PROJECT_ID              VARCHAR(50) NOT NULL,
        PATIENT_MAP_ID          varchar(200), 
        PATIENT_MAP_ID_SOURCE   varchar(50), 
        ENCOUNTER_ID            varchar(200) NOT NULL,
        ENCOUNTER_ID_SOURCE     varchar(50) ,
        ENCOUNTER_NUM           numeric, 
        ENCOUNTER_MAP_ID_STATUS    varchar(50),
        PROCESS_STATUS_FLAG     char(1),
        UPDATE_DATE timestamp, 
        DOWNLOAD_DATE timestamp, 
        IMPORT_DATE timestamp, 
        SOURCESYSTEM_CD varchar(50)
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || '_eid_id ON ' || tempPatientMappingTableName || '  (ENCOUNTER_ID, ENCOUNTER_ID_SOURCE, ENCOUNTER_MAP_ID, ENCOUNTER_MAP_ID_SOURCE, ENCOUNTER_NUM)';
    EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || '_stateid_eid_id ON ' || tempPatientMappingTableName || '  (PROCESS_STATUS_FLAG)';  
    EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '%%%', SQLSTATE,  ' - ' , SQLERRM;
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_eid_table(temppatientmappingtablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_modifier_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_modifier_table(tempmodifiertablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
EXECUTE 'create table ' ||  tempModifierTableName || ' (
        MODIFIER_CD varchar(50) NOT NULL, 
        MODIFIER_PATH varchar(900) NOT NULL , 
        NAME_CHAR varchar(2000), 
        MODIFIER_BLOB text, 
        UPDATE_DATE timestamp, 
        DOWNLOAD_DATE timestamp, 
        IMPORT_DATE timestamp, 
        SOURCESYSTEM_CD varchar(50)
         ) WITH OIDS';
 EXECUTE 'CREATE INDEX idx_' || tempModifierTableName || '_pat_id ON ' || tempModifierTableName || '  (MODIFIER_PATH)';
EXCEPTION
        WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_modifier_table(tempmodifiertablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_patient_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_patient_table(temppatientdimensiontablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    -- Create temp table to store encounter/visit information
    EXECUTE 'create table ' ||  tempPatientDimensionTableName || ' (
        patient_id varchar(200), 
        patient_id_source varchar(50),
        patient_num numeric(38,0),
        vital_status_cd varchar(50), 
        birth_date timestamp, 
        death_date timestamp, 
        sex_cd char(50), 
        age_in_years_num numeric(5,0), 
        language_cd varchar(50), 
        race_cd varchar(50 ), 
        marital_status_cd varchar(50), 
        religion_cd varchar(50), 
        zip_cd varchar(50), 
        statecityzip_path varchar(700), 
        patient_blob text, 
        update_date timestamp, 
        download_date timestamp, 
        import_date timestamp, 
        sourcesystem_cd varchar(50)
    )';
    EXECUTE 'CREATE INDEX idx_' || tempPatientDimensionTableName || '_pat_id ON ' || tempPatientDimensionTableName || '  (patient_id, patient_id_source,patient_num)';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '%%%', SQLSTATE,  ' - ' , SQLERRM;
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_patient_table(temppatientdimensiontablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_pid_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_pid_table(temppatientmappingtablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
	EXECUTE 'create table ' ||  tempPatientMappingTableName || ' (
		PATIENT_MAP_ID varchar(200), 
		PATIENT_MAP_ID_SOURCE varchar(50), 
		PATIENT_ID_STATUS varchar(50), 
		PATIENT_ID  varchar(200),
		PATIENT_ID_SOURCE varchar(50),
		PROJECT_ID   VARCHAR(50) ,
		PATIENT_NUM numeric(38,0),
		PATIENT_MAP_ID_STATUS varchar(50), 
		PROCESS_STATUS_FLAG char(1), 
		UPDATE_DATE timestamp, 
		DOWNLOAD_DATE timestamp, 
		IMPORT_DATE timestamp, 
		SOURCESYSTEM_CD varchar(50)
	) WITH OIDS';
	EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || '_pid_id ON ' || tempPatientMappingTableName || '  ( PATIENT_ID, PATIENT_ID_SOURCE )';
	EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || 'map_pid_id ON ' || tempPatientMappingTableName || '  
	( PATIENT_ID, PATIENT_ID_SOURCE,PATIENT_MAP_ID, PATIENT_MAP_ID_SOURCE,  PATIENT_NUM )';
	EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || 'stat_pid_id ON ' || tempPatientMappingTableName || '  
	(PROCESS_STATUS_FLAG)';
	EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '%%%', SQLSTATE,  ' - ' , SQLERRM;
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_pid_table(temppatientmappingtablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_provider_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_provider_table(tempprovidertablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    EXECUTE 'create table ' ||  tempProviderTableName || ' (
        PROVIDER_ID varchar(50) NOT NULL, 
        PROVIDER_PATH varchar(700) NOT NULL, 
        NAME_CHAR varchar(2000), 
        PROVIDER_BLOB text, 
        UPDATE_DATE timestamp, 
        DOWNLOAD_DATE timestamp, 
        IMPORT_DATE timestamp, 
        SOURCESYSTEM_CD varchar(50), 
        UPLOAD_ID numeric
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempProviderTableName || '_ppath_id ON ' || tempProviderTableName || '  (PROVIDER_PATH)';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      

END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_provider_table(tempprovidertablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_table(temptablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    EXECUTE 'create table ' ||  tempTableName || '  (
        encounter_num  numeric(38,0),
        encounter_id varchar(200) not null, 
        encounter_id_source varchar(50) not null,
        concept_cd       varchar(50) not null, 
        patient_num numeric(38,0), 
        patient_id  varchar(200) not null,
        patient_id_source  varchar(50) not null,
        provider_id   varchar(50),
        start_date   timestamp, 
        modifier_cd varchar(100),
        instance_num numeric(18,0),
        valtype_cd varchar(50),
        tval_char varchar(255),
        nval_num numeric(18,5),
        valueflag_cd char(50),
        quantity_num numeric(18,5),
        confidence_num numeric(18,0),
        observation_blob text,
        units_cd varchar(50),
        end_date    timestamp,
        location_cd varchar(50),
        update_date  timestamp,
        download_date timestamp,
        import_date timestamp,
        sourcesystem_cd varchar(50) ,
        upload_id integer
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempTableName || '_pk ON ' || tempTableName || '  ( encounter_num,patient_num,concept_cd,provider_id,start_date,modifier_cd,instance_num)';
    EXECUTE 'CREATE INDEX idx_' || tempTableName || '_enc_pat_id ON ' || tempTableName || '  (encounter_id,encounter_id_source, patient_id,patient_id_source )';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM; 
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_table(temptablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_visit_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_visit_table(temptablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    -- Create temp table to store encounter/visit information
    EXECUTE 'create table ' ||  tempTableName || ' (
        encounter_id                    varchar(200) not null,
        encounter_id_source             varchar(50) not null, 
        project_id                      varchar(50) not null,
        patient_id                      varchar(200) not null,
        patient_id_source               varchar(50) not null,
        encounter_num                   numeric(38,0), 
        inout_cd                        varchar(50),
        location_cd                     varchar(50),
        location_path                   varchar(900),
        start_date                      timestamp, 
        end_date                        timestamp,
        visit_blob                      text,
        update_date                     timestamp,
        download_date                   timestamp,
        import_date                     timestamp,
        sourcesystem_cd                 varchar(50)
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempTableName || '_enc_id ON ' || tempTableName || '  ( encounter_id,encounter_id_source,patient_id,patient_id_source )';
    EXECUTE 'CREATE INDEX idx_' || tempTableName || '_patient_id ON ' || tempTableName || '  ( patient_id,patient_id_source )';
    EXCEPTION
    WHEN OTHERS THEN    
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;    
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_visit_table(temptablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_concept_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_concept_fromtemp(tempconcepttablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    --Delete duplicate rows with same encounter and patient combination
    EXECUTE 'DELETE 
    FROM
    ' || tempConceptTableName || ' t1 
    WHERE
    oid > (SELECT  
        min(oid) 
        FROM 
        ' || tempConceptTableName || ' t2
        WHERE 
        t1.concept_cd = t2.concept_cd 
        AND t1.concept_path = t2.concept_path
    )';
    EXECUTE ' UPDATE concept_dimension  
    SET  
    concept_cd=temp.concept_cd
    ,name_char=temp.name_char
    ,concept_blob=temp.concept_blob
    ,update_date=temp.update_date
    ,download_date=temp.download_date
    ,import_date=Now()
    ,sourcesystem_cd=temp.sourcesystem_cd
    ,upload_id=' || UPLOAD_ID  || '
    FROM 
    ' || tempConceptTableName || '  temp   
    WHERE 
    temp.concept_path = concept_dimension.concept_path 
    AND temp.update_date >= concept_dimension.update_date 
    AND EXISTS (SELECT 1 
        FROM ' || tempConceptTableName || ' temp  
        WHERE temp.concept_path = concept_dimension.concept_path 
        AND temp.update_date >= concept_dimension.update_date
    )
    ';
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
    -- in patient_mapping table.
    EXECUTE 'INSERT INTO concept_dimension  (
        concept_cd
        ,concept_path
        ,name_char
        ,concept_blob
        ,update_date
        ,download_date
        ,import_date
        ,sourcesystem_cd
        ,upload_id
    )
    SELECT  
    concept_cd
    ,concept_path
    ,name_char
    ,concept_blob
    ,update_date
    ,download_date
    ,Now()
    ,sourcesystem_cd
    ,' || upload_id || '
    FROM ' || tempConceptTableName || '  temp
    WHERE NOT EXISTS (SELECT concept_cd 
        FROM concept_dimension cd 
        WHERE cd.concept_path = temp.concept_path)
    ';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_concept_fromtemp(tempconcepttablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_eid_map_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_eid_map_fromtemp(tempeidtablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE

existingEncounterNum varchar(32);
maxEncounterNum bigint;
distinctEidCur REFCURSOR;
disEncounterId varchar(100); 
disEncounterIdSource varchar(100);

BEGIN
    EXECUTE ' delete  from ' || tempEidTableName ||  ' t1  where 
    oid > (select min(oid) from ' || tempEidTableName || ' t2 
        where t1.encounter_map_id = t2.encounter_map_id
        and t1.encounter_map_id_source = t2.encounter_map_id_source
        and t1.encounter_id = t2.encounter_id
        and t1.encounter_id_source = t2.encounter_id_source) ';
    LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;
    select max(encounter_num) into STRICT  maxEncounterNum from encounter_mapping ; 
    if coalesce(maxEncounterNum::text, '') = '' then 
        maxEncounterNum := 0;
    end if;
    open distinctEidCur for EXECUTE 'SELECT distinct encounter_id,encounter_id_source from ' || tempEidTableName ||' ' ;
    loop
        FETCH distinctEidCur INTO disEncounterId, disEncounterIdSource;
        IF NOT FOUND THEN EXIT; END IF; -- apply on distinctEidCur
            -- dbms_output.put_line(disEncounterId);
            if  disEncounterIdSource = 'HIVE'  THEN 
                begin
                    --check if hive number exist, if so assign that number to reset of map_id's within that pid
                    select encounter_num into existingEncounterNum from encounter_mapping where encounter_num = CAST(disEncounterId AS numeric) and encounter_ide_source = 'HIVE';
                    EXCEPTION  when NO_DATA_FOUND THEN
                        existingEncounterNum := null;
                end;
                if (existingEncounterNum IS NOT NULL AND existingEncounterNum::text <> '') then 
                    EXECUTE ' update ' || tempEidTableName ||' set encounter_num = CAST(encounter_id AS numeric), process_status_flag = ''P''
                    where encounter_id = $1 and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
                        and em.encounter_ide_source = encounter_map_id_source)' using disEncounterId;
                else 
                    -- generate new patient_num i.e. take max(_num) + 1 
                    if maxEncounterNum < CAST(disEncounterId AS numeric) then 
                        maxEncounterNum := disEncounterId;
                    end if ;
                    EXECUTE ' update ' || tempEidTableName ||' set encounter_num = CAST(encounter_id AS numeric), process_status_flag = ''P'' where 
                    encounter_id =  $1 and encounter_id_source = ''HIVE'' and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
                        and em.encounter_ide_source = encounter_map_id_source)' using disEncounterId;
                end if;    
                -- test if record fectched
                -- dbms_output.put_line(' HIVE ');
            else 
                begin
                    select encounter_num into STRICT  existingEncounterNum from encounter_mapping where encounter_ide = disEncounterId and 
                    encounter_ide_source = disEncounterIdSource ; 
                    -- test if record fetched. 
                    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        existingEncounterNum := null;
                end;
                if existingEncounterNum is not  null then 
                    EXECUTE ' update ' || tempEidTableName ||' set encounter_num = CAST($1 AS numeric) , process_status_flag = ''P''
                    where encounter_id = $2 and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
                        and em.encounter_ide_source = encounter_map_id_source)' using existingEncounterNum, disEncounterId;
                else 
                    maxEncounterNum := maxEncounterNum + 1 ;
                    --TODO : add update colunn
                    EXECUTE ' insert into ' || tempEidTableName ||' (encounter_map_id,encounter_map_id_source,encounter_id,encounter_id_source,encounter_num,process_status_flag
                        ,encounter_map_id_status,update_date,download_date,import_date,sourcesystem_cd,project_id) 
                    values($1,''HIVE'',$2,''HIVE'',$3,''P'',''A'',Now(),Now(),Now(),''edu.harvard.i2b2.crc'',''HIVE'')' using maxEncounterNum,maxEncounterNum,maxEncounterNum; 
                    EXECUTE ' update ' || tempEidTableName ||' set encounter_num =  $1 , process_status_flag = ''P'' 
                    where encounter_id = $2 and  not exists (select 1 from 
                        encounter_mapping em where em.encounter_ide = encounter_map_id
                        and em.encounter_ide_source = encounter_map_id_source)' using maxEncounterNum, disEncounterId;
                end if ;
                -- dbms_output.put_line(' NOT HIVE ');
            end if; 
    END LOOP;
    close distinctEidCur ;
    -- do the mapping update if the update date is old

EXECUTE 'UPDATE encounter_mapping
SET 
encounter_num = CAST(temp.encounter_id AS numeric)
,encounter_ide_status = temp.encounter_map_id_status
,update_date = temp.update_date
,download_date  = temp.download_date
,import_date = Now()
,sourcesystem_cd  = temp.sourcesystem_cd
,upload_id = ' || upload_id ||'
FROM '|| tempEidTableName || '  temp
WHERE 
temp.encounter_map_id = encounter_mapping.encounter_ide 
and temp.encounter_map_id_source = encounter_mapping.encounter_ide_source
and temp.encounter_id_source = ''HIVE''
and coalesce(temp.process_status_flag::text, '''') = ''''  
and coalesce(encounter_mapping.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) <= coalesce(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))
';

    -- insert new mapping records i.e flagged P
    EXECUTE ' insert into encounter_mapping (encounter_ide,encounter_ide_source,encounter_ide_status,encounter_num,patient_ide,patient_ide_source,update_date,download_date,import_date,sourcesystem_cd,upload_id,project_id) 
    SELECT encounter_map_id,encounter_map_id_source,encounter_map_id_status,encounter_num,patient_map_id,patient_map_id_source,update_date,download_date,Now(),sourcesystem_cd,' || upload_id || ' , project_id
    FROM ' || tempEidTableName || '  
    WHERE process_status_flag = ''P'' ' ; 
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;
    end;
    $_$;


ALTER FUNCTION i2b2demodata.insert_eid_map_fromtemp(tempeidtablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_encountervisit_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_encountervisit_fromtemp(temptablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE

maxEncounterNum bigint; 

BEGIN 
    --Delete duplicate rows with same encounter and patient combination
    EXECUTE 'DELETE FROM ' || tempTableName || ' t1 WHERE oid > 
    (SELECT  min(oid) FROM ' || tempTableName || ' t2
        WHERE t1.encounter_id = t2.encounter_id 
        AND t1.encounter_id_source = t2.encounter_id_source
        AND coalesce(t1.patient_id,'''') = coalesce(t2.patient_id,'''')
        AND coalesce(t1.patient_id_source,'''') = coalesce(t2.patient_id_source,''''))';
    LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;
    -- select max(encounter_num) into maxEncounterNum from encounter_mapping ;
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
    -- in patient_mapping table.
    EXECUTE 'INSERT INTO encounter_mapping (
        encounter_ide
        , encounter_ide_source
        , encounter_num
        , patient_ide
        , patient_ide_source
        , encounter_ide_status
        , upload_id
        , project_id
    )
    (SELECT 
        distinctTemp.encounter_id
        , distinctTemp.encounter_id_source
        , CAST(distinctTemp.encounter_id AS numeric)
        , distinctTemp.patient_id
        , distinctTemp.patient_id_source
        , ''A''
        ,  '|| upload_id ||'
        , distinctTemp.project_id
        FROM 
        (SELECT 
            distinct encounter_id
            , encounter_id_source
            , patient_id
            , patient_id_source 
            , project_id
            FROM ' || tempTableName || '  temp
            WHERE 
            NOT EXISTS (SELECT encounter_ide 
                FROM encounter_mapping em 
                WHERE 
                em.encounter_ide = temp.encounter_id 
                AND em.encounter_ide_source = temp.encounter_id_source
            )
            AND encounter_id_source = ''HIVE'' 
    )   distinctTemp
) ' ;
    -- update patient_num for temp table
    EXECUTE ' UPDATE ' ||  tempTableName
    || ' SET encounter_num = (SELECT em.encounter_num
        FROM encounter_mapping em
        WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
        and em.encounter_ide_source = '|| tempTableName ||'.encounter_id_source 
        and coalesce(em.patient_ide_source,'''') = coalesce('|| tempTableName ||'.patient_id_source,'''')
        and coalesce(em.patient_ide,'''')= coalesce('|| tempTableName ||'.patient_id,'''')
    )
    WHERE EXISTS (SELECT em.encounter_num 
        FROM encounter_mapping em
        WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
        and em.encounter_ide_source = '||tempTableName||'.encounter_id_source
        and coalesce(em.patient_ide_source,'''') = coalesce('|| tempTableName ||'.patient_id_source,'''')
        and coalesce(em.patient_ide,'''')= coalesce('|| tempTableName ||'.patient_id,''''))';      

    EXECUTE ' UPDATE visit_dimension  SET  
    start_date =temp.start_date
    ,end_date=temp.end_date
    ,inout_cd=temp.inout_cd
    ,location_cd=temp.location_cd
    ,visit_blob=temp.visit_blob
    ,update_date=temp.update_date
    ,download_date=temp.download_date
    ,import_date=Now()
    ,sourcesystem_cd=temp.sourcesystem_cd
    , upload_id=' || UPLOAD_ID  || '
    FROM ' || tempTableName || '  temp       
    WHERE
    temp.encounter_num = visit_dimension.encounter_num 
    AND temp.update_date >= visit_dimension.update_date 
    AND exists (SELECT 1 
        FROM ' || tempTableName || ' temp 
        WHERE temp.encounter_num = visit_dimension.encounter_num 
        AND temp.update_date >= visit_dimension.update_date
    ) ';

    EXECUTE 'INSERT INTO visit_dimension  (encounter_num,patient_num,start_date,end_date,inout_cd,location_cd,visit_blob,update_date,download_date,import_date,sourcesystem_cd, upload_id)
    SELECT temp.encounter_num
    , pm.patient_num,
    temp.start_date,temp.end_date,temp.inout_cd,temp.location_cd,temp.visit_blob,
    temp.update_date,
    temp.download_date,
    Now(), 
    temp.sourcesystem_cd,
    '|| upload_id ||'
    FROM 
    ' || tempTableName || '  temp , patient_mapping pm 
    WHERE 
    (temp.encounter_num IS NOT NULL AND temp.encounter_num::text <> '''') and 
    NOT EXISTS (SELECT encounter_num 
        FROM visit_dimension vd 
        WHERE 
        vd.encounter_num = temp.encounter_num) 
    AND pm.patient_ide = temp.patient_id 
    AND pm.patient_ide_source = temp.patient_id_source
    ';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_encountervisit_fromtemp(temptablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_modifier_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_modifier_fromtemp(tempmodifiertablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    --Delete duplicate rows 
    EXECUTE 'DELETE FROM ' || tempModifierTableName || ' t1 WHERE oid > 
    (SELECT  min(oid) FROM ' || tempModifierTableName || ' t2
        WHERE t1.modifier_cd = t2.modifier_cd 
        AND t1.modifier_path = t2.modifier_path
    )';
    EXECUTE ' UPDATE modifier_dimension  SET  
        modifier_cd=temp.modifier_cd
        ,name_char=temp.name_char
        ,modifier_blob=temp.modifier_blob
        ,update_date=temp.update_date
        ,download_date=temp.download_date
        ,import_date=Now()
        ,sourcesystem_cd=temp.SOURCESYSTEM_CD
        ,upload_id=' || UPLOAD_ID  || ' 
        FROM ' || tempModifierTableName || '  temp
        WHERE 
        temp.modifier_path = modifier_dimension.modifier_path 
        AND temp.update_date >= modifier_dimension.update_date
        AND EXISTS (SELECT 1 
            FROM ' || tempModifierTableName || ' temp  
            WHERE temp.modifier_path = modifier_dimension.modifier_path 
            AND temp.update_date >= modifier_dimension.update_date)
        ';
        --Create new modifier if temp table modifier_path does not exists 
        -- in modifier dimension table.
        EXECUTE 'INSERT INTO modifier_dimension  (
            modifier_cd
            ,modifier_path
            ,name_char
            ,modifier_blob
            ,update_date
            ,download_date
            ,import_date
            ,sourcesystem_cd
            ,upload_id
        )
        SELECT  
        modifier_cd
        ,modifier_path
        ,name_char
        ,modifier_blob
        ,update_date
        ,download_date
        ,Now()
        ,sourcesystem_cd
        ,' || upload_id || '  
        FROM
        ' || tempModifierTableName || '  temp
        WHERE NOT EXISTs (SELECT modifier_cd 
            FROM modifier_dimension cd
            WHERE cd.modifier_path = temp.modifier_path
        )
        ';
        EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_modifier_fromtemp(tempmodifiertablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_patient_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_patient_fromtemp(temptablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE

maxPatientNum bigint; 

BEGIN 
    LOCK TABLE  patient_mapping IN EXCLUSIVE MODE NOWAIT;
    --select max(patient_num) into maxPatientNum from patient_mapping ;
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
    -- in patient_mapping table.
    EXECUTE ' INSERT INTO patient_mapping (patient_ide,patient_ide_source,patient_num,patient_ide_status, upload_id)
    (SELECT distinctTemp.patient_id, distinctTemp.patient_id_source, CAST(distinctTemp.patient_id AS numeric), ''A'',   '|| upload_id ||'
        FROM 
        (SELECT distinct patient_id, patient_id_source from ' || tempTableName || '  temp
            where  not exists (SELECT patient_ide from patient_mapping pm where pm.patient_ide = temp.patient_id and pm.patient_ide_source = temp.patient_id_source)
            and patient_id_source = ''HIVE'' )   distinctTemp) ';

    -- update patient_num for temp table
    EXECUTE ' UPDATE ' ||  tempTableName
    || ' SET patient_num = (SELECT pm.patient_num
        FROM patient_mapping pm
        WHERE pm.patient_ide = '|| tempTableName ||'.patient_id
        AND pm.patient_ide_source = '|| tempTableName ||'.patient_id_source
    )
    WHERE EXISTS (SELECT pm.patient_num 
        FROM patient_mapping pm
        WHERE pm.patient_ide = '|| tempTableName ||'.patient_id
        AND pm.patient_ide_source = '||tempTableName||'.patient_id_source)';       

    EXECUTE ' UPDATE patient_dimension  SET  
    vital_status_cd = temp.vital_status_cd
    , birth_date = temp.birth_date
    , death_date = temp.death_date
    , sex_cd = temp.sex_cd
    , age_in_years_num = temp.age_in_years_num
    , language_cd = temp.language_cd
    , race_cd = temp.race_cd
    , marital_status_cd = temp.marital_status_cd
    , religion_cd = temp.religion_cd
    , zip_cd = temp.zip_cd
    , statecityzip_path = temp.statecityzip_path
    , patient_blob = temp.patient_blob
    , update_date = temp.update_date
    , download_date = temp.download_date
    , import_date = Now()
    , sourcesystem_cd = temp.sourcesystem_cd 
    , upload_id =  ' || UPLOAD_ID  || '
    FROM  ' || tempTableName || '  temp
    WHERE 
    temp.patient_num = patient_dimension.patient_num 
    AND temp.update_date >= patient_dimension.update_date
    AND EXISTS (select 1 
        FROM ' || tempTableName || ' temp  
        WHERE 
        temp.patient_num = patient_dimension.patient_num 
        AND temp.update_date >= patient_dimension.update_date
    )    ';

    --Create new patient(patient_dimension) for above inserted patient's.
    --If patient_dimension table's patient num does match temp table,
    --then new patient_dimension information is inserted.
    EXECUTE 'INSERT INTO patient_dimension  (patient_num,vital_status_cd, birth_date, death_date,
        sex_cd, age_in_years_num,language_cd,race_cd,marital_status_cd, religion_cd,
        zip_cd,statecityzip_path,patient_blob,update_date,download_date,import_date,sourcesystem_cd,
        upload_id)
    SELECT temp.patient_num,
    temp.vital_status_cd, temp.birth_date, temp.death_date,
    temp.sex_cd, temp.age_in_years_num,temp.language_cd,temp.race_cd,temp.marital_status_cd, temp.religion_cd,
    temp.zip_cd,temp.statecityzip_path,temp.patient_blob,
    temp.update_date,
    temp.download_date,
    Now(),
    temp.sourcesystem_cd,
    '|| upload_id ||'
    FROM 
    ' || tempTableName || '  temp 
    WHERE 
    NOT EXISTS (SELECT patient_num 
        FROM patient_dimension pd 
        WHERE pd.patient_num = temp.patient_num) 
    AND 
    (patient_num IS NOT NULL AND patient_num::text <> '''')
    ';
    EXCEPTION WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;

END;
$$;


ALTER FUNCTION i2b2demodata.insert_patient_fromtemp(temptablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_patient_map_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_patient_map_fromtemp(temppatienttablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
        --Create new patient mapping entry for HIVE patient's if they are not already mapped in mapping table
        EXECUTE 'insert into patient_mapping (
                PERFORM distinct temp.patient_id, temp.patient_id_source,''A'',temp.patient_id ,' || upload_id || '
                from ' || tempPatientTableName ||'  temp 
                where temp.patient_id_source = ''HIVE'' and 
                not exists (select patient_ide from patient_mapping pm where pm.patient_num = temp.patient_id and pm.patient_ide_source = temp.patient_id_source) 
                )'; 
    --Create new visit for above inserted encounter's
        --If Visit table's encounter and patient num does match temp table,
        --then new visit information is created.
        EXECUTE 'MERGE  INTO patient_dimension pd
                   USING ( select case when (ptemp.patient_id_source=''HIVE'') then  cast(ptemp.patient_id as int)
                                       else pmap.patient_num end patient_num,
                                  ptemp.VITAL_STATUS_CD, 
                                  ptemp.BIRTH_DATE,
                                  ptemp.DEATH_DATE, 
                                  ptemp.SEX_CD ,
                                  ptemp.AGE_IN_YEARS_NUM,
                                  ptemp.LANGUAGE_CD,
                                  ptemp.RACE_CD,
                                  ptemp.MARITAL_STATUS_CD,
                                  ptemp.RELIGION_CD,
                                  ptemp.ZIP_CD,
                                                                  ptemp.STATECITYZIP_PATH , 
                                                                  ptemp.PATIENT_BLOB, 
                                                                  ptemp.UPDATE_DATE, 
                                                                  ptemp.DOWNLOAD_DATE, 
                                                                  ptemp.IMPORT_DATE, 
                                                                  ptemp.SOURCESYSTEM_CD
                   from ' || tempPatientTableName || '  ptemp , patient_mapping pmap
                   where   ptemp.patient_id = pmap.patient_ide(+)
                   and ptemp.patient_id_source = pmap.patient_ide_source(+)
           ) temp
                   on (
                                pd.patient_num = temp.patient_num
                    )    
                        when matched then 
                                update  set 
                                        pd.VITAL_STATUS_CD= temp.VITAL_STATUS_CD,
                    pd.BIRTH_DATE= temp.BIRTH_DATE,
                    pd.DEATH_DATE= temp.DEATH_DATE,
                    pd.SEX_CD= temp.SEX_CD,
                    pd.AGE_IN_YEARS_NUM=temp.AGE_IN_YEARS_NUM,
                    pd.LANGUAGE_CD=temp.LANGUAGE_CD,
                    pd.RACE_CD=temp.RACE_CD,
                    pd.MARITAL_STATUS_CD=temp.MARITAL_STATUS_CD,
                    pd.RELIGION_CD=temp.RELIGION_CD,
                    pd.ZIP_CD=temp.ZIP_CD,
                                        pd.STATECITYZIP_PATH =temp.STATECITYZIP_PATH,
                                        pd.PATIENT_BLOB=temp.PATIENT_BLOB,
                                        pd.UPDATE_DATE=temp.UPDATE_DATE,
                                        pd.DOWNLOAD_DATE=temp.DOWNLOAD_DATE,
                                        pd.SOURCESYSTEM_CD=temp.SOURCESYSTEM_CD,
                                        pd.UPLOAD_ID = '||upload_id||'
                    where temp.update_date > pd.update_date
                         when not matched then 
                                insert (
                                        PATIENT_NUM,
                                        VITAL_STATUS_CD,
                    BIRTH_DATE,
                    DEATH_DATE,
                    SEX_CD,
                    AGE_IN_YEARS_NUM,
                    LANGUAGE_CD,
                    RACE_CD,
                    MARITAL_STATUS_CD,
                    RELIGION_CD,
                    ZIP_CD,
                                        STATECITYZIP_PATH,
                                        PATIENT_BLOB,
                                        UPDATE_DATE,
                                        DOWNLOAD_DATE,
                                        SOURCESYSTEM_CD,
                                        import_date,
                        upload_id
                                        ) 
                                values (
                                        temp.PATIENT_NUM,
                                        temp.VITAL_STATUS_CD,
                    temp.BIRTH_DATE,
                    temp.DEATH_DATE,
                    temp.SEX_CD,
                    temp.AGE_IN_YEARS_NUM,
                    temp.LANGUAGE_CD,
                    temp.RACE_CD,
                    temp.MARITAL_STATUS_CD,
                    temp.RELIGION_CD,
                    temp.ZIP_CD,
                                        temp.STATECITYZIP_PATH,
                                        temp.PATIENT_BLOB,
                                        temp.UPDATE_DATE,
                                        temp.DOWNLOAD_DATE,
                                        temp.SOURCESYSTEM_CD,
                                        LOCALTIMESTAMP,
                                '||upload_id||'
                                )';
EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_patient_map_fromtemp(temppatienttablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_pid_map_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_pid_map_fromtemp(temppidtablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE
existingPatientNum varchar(32);
maxPatientNum bigint;
distinctPidCur REFCURSOR;
disPatientId varchar(100); 
disPatientIdSource varchar(100);
BEGIN
	--delete the doublons
	EXECUTE ' delete  from ' || tempPidTableName ||  ' t1  where 
	oid > (select min(oid) from ' || tempPidTableName || ' t2 
		where t1.patient_map_id = t2.patient_map_id
		and t1.patient_map_id_source = t2.patient_map_id_source) ';
	LOCK TABLE  patient_mapping IN EXCLUSIVE MODE NOWAIT;
	select max(patient_num) into STRICT  maxPatientNum from patient_mapping ; 
	-- set max patient num to zero of the value is null
	if coalesce(maxPatientNum::text, '') = '' then 
		maxPatientNum := 0;
	end if;
	open distinctPidCur for EXECUTE 'SELECT distinct patient_id,patient_id_source from ' || tempPidTableName || '' ;
	loop
		FETCH distinctPidCur INTO disPatientId, disPatientIdSource;
		IF NOT FOUND THEN EXIT; 
	END IF; -- apply on distinctPidCur
	-- dbms_output.put_line(disPatientId);
	if  disPatientIdSource = 'HIVE'  THEN 
		begin
			--check if hive number exist, if so assign that number to reset of map_id's within that pid
			select patient_num into existingPatientNum from patient_mapping where patient_num = CAST(disPatientId AS numeric) and patient_ide_source = 'HIVE';
			EXCEPTION  when NO_DATA_FOUND THEN
				existingPatientNum := null;
		end;
		if (existingPatientNum IS NOT NULL AND existingPatientNum::text <> '') then 
			EXECUTE ' update ' || tempPidTableName ||' set patient_num = CAST(patient_id AS numeric), process_status_flag = ''P''
			where patient_id = $1 and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
				and pm.patient_ide_source = patient_map_id_source)' using disPatientId;
		else 
			-- generate new patient_num i.e. take max(patient_num) + 1 
			if maxPatientNum < CAST(disPatientId AS numeric) then 
				maxPatientNum := disPatientId;
			end if ;
			EXECUTE ' update ' || tempPidTableName ||' set patient_num = CAST(patient_id AS numeric), process_status_flag = ''P'' where 
			patient_id = $1 and patient_id_source = ''HIVE'' and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
				and pm.patient_ide_source = patient_map_id_source)' using disPatientId;
		end if;    
		-- test if record fectched
		-- dbms_output.put_line(' HIVE ');
	else 
		begin
			select patient_num into STRICT  existingPatientNum from patient_mapping where patient_ide = disPatientId and 
			patient_ide_source = disPatientIdSource ; 
			-- test if record fetched. 
			EXCEPTION
	WHEN NO_DATA_FOUND THEN
		existingPatientNum := null;
		end;
		if (existingPatientNum IS NOT NULL AND existingPatientNum::text <> '') then 
			EXECUTE ' update ' || tempPidTableName ||' set patient_num = CAST($1 AS numeric) , process_status_flag = ''P''
			where patient_id = $2 and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
				and pm.patient_ide_source = patient_map_id_source)' using  existingPatientNum,disPatientId;
		else 
			maxPatientNum := maxPatientNum + 1 ; 
			EXECUTE 'insert into ' || tempPidTableName ||' (
				patient_map_id
				,patient_map_id_source
				,patient_id
				,patient_id_source
				,patient_num
				,process_status_flag
				,patient_map_id_status
				,update_date
				,download_date
				,import_date
				,sourcesystem_cd
				,project_id) 
			values(
				$1
				,''HIVE''
				,$2
				,''HIVE''
				,$3
				,''P''
				,''A''
				,Now()
				,Now()
				,Now()
				,''edu.harvard.i2b2.crc''
			,''HIVE''
			)' using maxPatientNum,maxPatientNum,maxPatientNum; 
			EXECUTE 'update ' || tempPidTableName ||' set patient_num =  $1 , process_status_flag = ''P'' 
			where patient_id = $2 and  not exists (select 1 from 
				patient_mapping pm where pm.patient_ide = patient_map_id
				and pm.patient_ide_source = patient_map_id_source)' using maxPatientNum, disPatientId  ;
		end if ;
		-- dbms_output.put_line(' NOT HIVE ');
	end if; 
	END LOOP;
	close distinctPidCur ;
	-- do the mapping update if the update date is old
EXECUTE ' UPDATE patient_mapping
SET 
patient_num = CAST(temp.patient_id AS numeric)
,patient_ide_status = temp.patient_map_id_status
,update_date = temp.update_date
,download_date  = temp.download_date
,import_date = Now()
,sourcesystem_cd  = temp.sourcesystem_cd
,upload_id = ' || upload_id ||'
FROM '|| tempPidTableName || '  temp
WHERE 
temp.patient_map_id = patient_mapping.patient_ide 
and temp.patient_map_id_source = patient_mapping.patient_ide_source
and temp.patient_id_source = ''HIVE''
and coalesce(temp.process_status_flag::text, '''') = ''''  
and coalesce(patient_mapping.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) <= coalesce(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))
';
	-- insert new mapping records i.e flagged P
	EXECUTE ' insert into patient_mapping (patient_ide,patient_ide_source,patient_ide_status,patient_num,update_date,download_date,import_date,sourcesystem_cd,upload_id,project_id)
	SELECT patient_map_id,patient_map_id_source,patient_map_id_status,patient_num,update_date,download_date,Now(),sourcesystem_cd,' || upload_id ||', project_id from '|| tempPidTableName || ' 
	where process_status_flag = ''P'' ' ; 
	EXCEPTION WHEN OTHERS THEN
		RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;
	END;
	$_$;


ALTER FUNCTION i2b2demodata.insert_pid_map_fromtemp(temppidtablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_provider_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_provider_fromtemp(tempprovidertablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    --Delete duplicate rows with same encounter and patient combination
    EXECUTE 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE oid > 
    (SELECT  min(oid) FROM ' || tempProviderTableName || ' t2
        WHERE t1.provider_id = t2.provider_id 
        AND t1.provider_path = t2.provider_path
    )';
    EXECUTE ' UPDATE provider_dimension  SET  
        provider_id =temp.provider_id
        , name_char = temp.name_char
        , provider_blob = temp.provider_blob
        , update_date=temp.update_date
        , download_date=temp.download_date
        , import_date=Now()
        , sourcesystem_cd=temp.sourcesystem_cd
        , upload_id = ' || upload_id || '
        FROM ' || tempProviderTableName || '  temp 
        WHERE 
        temp.provider_path = provider_dimension.provider_path and temp.update_date >= provider_dimension.update_date 
    AND EXISTS (select 1 from ' || tempProviderTableName || ' temp  where temp.provider_path = provider_dimension.provider_path 
        and temp.update_date >= provider_dimension.update_date) ';

    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
    -- in patient_mapping table.
    EXECUTE 'insert into provider_dimension  (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
    SELECT  provider_id,provider_path, 
    name_char,provider_blob,
    update_date,download_date,
    Now(),sourcesystem_cd, ' || upload_id || '
    FROM ' || tempProviderTableName || '  temp
    WHERE NOT EXISTS (SELECT provider_id 
        FROM provider_dimension pd 
        WHERE pd.provider_path = temp.provider_path 
    )';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_provider_fromtemp(tempprovidertablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: remove_temp_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION remove_temp_table(temptablename character varying, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$

DECLARE

BEGIN
    EXECUTE 'DROP TABLE ' || tempTableName|| ' CASCADE ';

EXCEPTION 
WHEN OTHERS THEN
    RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.remove_temp_table(temptablename character varying, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: sync_clear_concept_table(text, text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION sync_clear_concept_table(tempconcepttablename text, backupconcepttablename text, uploadid bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
 
interConceptTableName  varchar(400);

BEGIN 
        interConceptTableName := backupConceptTableName || '_inter';
                --Delete duplicate rows with same encounter and patient combination
        EXECUTE 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE oid > 
                                           (SELECT  min(oid) FROM ' || tempConceptTableName || ' t2
                                             WHERE t1.concept_cd = t2.concept_cd 
                                            AND t1.concept_path = t2.concept_path
                                            )';
    EXECUTE 'create table ' ||  interConceptTableName || ' (
    CONCEPT_CD          varchar(50) NOT NULL,
        CONCEPT_PATH            varchar(700) NOT NULL,
        NAME_CHAR               varchar(2000) NULL,
        CONCEPT_BLOB        text NULL,
        UPDATE_DATE         timestamp NULL,
        DOWNLOAD_DATE       timestamp NULL,
        IMPORT_DATE         timestamp NULL,
        SOURCESYSTEM_CD     varchar(50) NULL,
        UPLOAD_ID               numeric(38,0) NULL,
    CONSTRAINT '|| interConceptTableName ||'_pk  PRIMARY KEY(CONCEPT_PATH)
         )';
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
        -- in patient_mapping table.
        EXECUTE 'insert into '|| interConceptTableName ||'  (concept_cd,concept_path,name_char,concept_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
                            PERFORM  concept_cd, substring(concept_path from 1 for 700),
                        name_char,concept_blob,
                        update_date,download_date,
                        LOCALTIMESTAMP,sourcesystem_cd,
                         ' || uploadId || '  from ' || tempConceptTableName || '  temp ';
        --backup the concept_dimension table before creating a new one
        EXECUTE 'alter table concept_dimension rename to ' || backupConceptTableName  ||'' ;
        -- add index on upload_id 
    EXECUTE 'CREATE INDEX ' || interConceptTableName || '_uid_idx ON ' || interConceptTableName || '(UPLOAD_ID)';
    -- add index on upload_id 
    EXECUTE 'CREATE INDEX ' || interConceptTableName || '_cd_idx ON ' || interConceptTableName || '(concept_cd)';
    --backup the concept_dimension table before creating a new one
        EXECUTE 'alter table ' || interConceptTableName  || ' rename to concept_dimension' ;
EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.sync_clear_concept_table(tempconcepttablename text, backupconcepttablename text, uploadid bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: sync_clear_modifier_table(text, text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION sync_clear_modifier_table(tempmodifiertablename text, backupmodifiertablename text, uploadid bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
 
interModifierTableName  varchar(400);

BEGIN 
        interModifierTableName := backupModifierTableName || '_inter';
        --Delete duplicate rows with same modifier_path and modifier cd
        EXECUTE 'DELETE FROM ' || tempModifierTableName || ' t1 WHERE oid > 
                                           (SELECT  min(oid) FROM ' || tempModifierTableName || ' t2
                                             WHERE t1.modifier_cd = t2.modifier_cd 
                                            AND t1.modifier_path = t2.modifier_path
                                            )';
    EXECUTE 'create table ' ||  interModifierTableName || ' (
        MODIFIER_CD          varchar(50) NOT NULL,
        MODIFIER_PATH           varchar(700) NOT NULL,
        NAME_CHAR               varchar(2000) NULL,
        MODIFIER_BLOB        text NULL,
        UPDATE_DATE         timestamp NULL,
        DOWNLOAD_DATE       timestamp NULL,
        IMPORT_DATE         timestamp NULL,
        SOURCESYSTEM_CD     varchar(50) NULL,
        UPLOAD_ID               numeric(38,0) NULL,
    CONSTRAINT '|| interModifierTableName ||'_pk  PRIMARY KEY(MODIFIER_PATH)
         )';
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
        -- in patient_mapping table.
        EXECUTE 'insert into '|| interModifierTableName ||'  (modifier_cd,modifier_path,name_char,modifier_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
                            PERFORM  modifier_cd, substring(modifier_path from 1 for 700),
                        name_char,modifier_blob,
                        update_date,download_date,
                        LOCALTIMESTAMP,sourcesystem_cd,
                         ' || uploadId || '  from ' || tempModifierTableName || '  temp ';
        --backup the modifier_dimension table before creating a new one
        EXECUTE 'alter table modifier_dimension rename to ' || backupModifierTableName  ||'' ;
        -- add index on upload_id 
    EXECUTE 'CREATE INDEX ' || interModifierTableName || '_uid_idx ON ' || interModifierTableName || '(UPLOAD_ID)';
    -- add index on upload_id 
    EXECUTE 'CREATE INDEX ' || interModifierTableName || '_cd_idx ON ' || interModifierTableName || '(modifier_cd)';
       --backup the modifier_dimension table before creating a new one
        EXECUTE 'alter table ' || interModifierTableName  || ' rename to modifier_dimension' ;
EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.sync_clear_modifier_table(tempmodifiertablename text, backupmodifiertablename text, uploadid bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: sync_clear_provider_table(text, text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION sync_clear_provider_table(tempprovidertablename text, backupprovidertablename text, uploadid bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
 
interProviderTableName  varchar(400);

BEGIN 
        interProviderTableName := backupProviderTableName || '_inter';
                --Delete duplicate rows with same encounter and patient combination
        EXECUTE 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE oid > 
                                           (SELECT  min(oid) FROM ' || tempProviderTableName || ' t2
                                             WHERE t1.provider_id = t2.provider_id 
                                            AND t1.provider_path = t2.provider_path
                                            )';
    EXECUTE 'create table ' ||  interProviderTableName || ' (
    PROVIDER_ID         varchar(50) NOT NULL,
        PROVIDER_PATH       varchar(700) NOT NULL,
        NAME_CHAR               varchar(850) NULL,
        PROVIDER_BLOB       text NULL,
        UPDATE_DATE             timestamp NULL,
        DOWNLOAD_DATE       timestamp NULL,
        IMPORT_DATE         timestamp NULL,
        SOURCESYSTEM_CD     varchar(50) NULL,
        UPLOAD_ID               numeric(38,0) NULL ,
    CONSTRAINT  ' || interProviderTableName || '_pk PRIMARY KEY(PROVIDER_PATH,provider_id)
         )';
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
        -- in patient_mapping table.
        EXECUTE 'insert into ' ||  interProviderTableName || ' (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
                            PERFORM  provider_id,provider_path, 
                        name_char,provider_blob,
                        update_date,download_date,
                        LOCALTIMESTAMP,sourcesystem_cd, ' || uploadId || '
                             from ' || tempProviderTableName || '  temp ';
        --backup the concept_dimension table before creating a new one
        EXECUTE 'alter table provider_dimension rename to ' || backupProviderTableName  ||'' ;
        -- add index on provider_id, name_char 
    EXECUTE 'CREATE INDEX ' || interProviderTableName || '_id_idx ON ' || interProviderTableName  || '(Provider_Id,name_char)';
    EXECUTE 'CREATE INDEX ' || interProviderTableName || '_uid_idx ON ' || interProviderTableName  || '(UPLOAD_ID)';
        --backup the concept_dimension table before creating a new one
        EXECUTE 'alter table ' || interProviderTableName  || ' rename to provider_dimension' ;
EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.sync_clear_provider_table(tempprovidertablename text, backupprovidertablename text, uploadid bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: update_observation_fact(text, bigint, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION update_observation_fact(upload_temptable_name text, upload_id bigint, appendflag bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- appendFlag = 0 -> remove all and then insert
    -- appendFlag <> 0 -> do update, then insert what have not been updated    

    --Delete duplicate records(encounter_ide,patient_ide,concept_cd,start_date,modifier_cd,provider_id)
    EXECUTE 'DELETE FROM ' || upload_temptable_name ||'  t1 
    WHERE oid > (select min(oid) FROM ' || upload_temptable_name ||' t2 
        WHERE t1.encounter_id = t2.encounter_id  
        AND
        t1.encounter_id_source = t2.encounter_id_source
        AND
        t1.patient_id = t2.patient_id 
        AND 
        t1.patient_id_source = t2.patient_id_source
        AND 
        t1.concept_cd = t2.concept_cd
        AND 
        t1.start_date = t2.start_date
        AND 
        coalesce(t1.modifier_cd,''xyz'') = coalesce(t2.modifier_cd,''xyz'')
        AND 
        t1.instance_num = t2.instance_num
        AND 
        t1.provider_id = t2.provider_id)';
    --Delete records having null in start_date
    EXECUTE 'DELETE FROM ' || upload_temptable_name ||'  t1           
    WHERE coalesce(t1.start_date::text, '''') = '''' 
    ';
    --One time lookup on encounter_ide to get encounter_num 
    EXECUTE 'UPDATE ' ||  upload_temptable_name
    || ' SET encounter_num = (SELECT distinct em.encounter_num
        FROM encounter_mapping em
        WHERE em.encounter_ide = ' || upload_temptable_name||'.encounter_id
        AND em.encounter_ide_source = '|| upload_temptable_name||'.encounter_id_source
    )
    WHERE EXISTS (SELECT distinct em.encounter_num
        FROM encounter_mapping em
        WHERE em.encounter_ide = '|| upload_temptable_name||'.encounter_id
        AND em.encounter_ide_source = '||upload_temptable_name||'.encounter_id_source)';                
    --One time lookup on patient_ide to get patient_num 
    EXECUTE 'UPDATE ' ||  upload_temptable_name
    || ' SET patient_num = (SELECT distinct pm.patient_num
        FROM patient_mapping pm
        WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
        AND pm.patient_ide_source = '|| upload_temptable_name||'.patient_id_source
    )
    WHERE EXISTS (SELECT distinct pm.patient_num 
        FROM patient_mapping pm
        WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
        AND pm.patient_ide_source = '||upload_temptable_name||'.patient_id_source)';                    
    IF (appendFlag = 0) THEN
        --Archive records which are to be deleted in observation_fact table
        EXECUTE 'INSERT INTO  archive_observation_fact 
        SELECT obsfact.*, ' || upload_id ||'
        FROM observation_fact obsfact
        WHERE obsfact.encounter_num IN 
        (SELECT temp_obsfact.encounter_num
            FROM  ' ||upload_temptable_name ||' temp_obsfact
            GROUP BY temp_obsfact.encounter_num  
        )';
        --Delete above archived row FROM observation_fact
        EXECUTE 'DELETE  
        FROM observation_fact 
        WHERE EXISTS (
            SELECT archive.encounter_num
            FROM archive_observation_fact  archive
            WHERE archive.archive_upload_id = '||upload_id ||'
            AND archive.encounter_num=observation_fact.encounter_num
            AND archive.concept_cd = observation_fact.concept_cd
            AND archive.start_date = observation_fact.start_date
        )';
END IF;
-- if the append is true, then do the update else do insert all
IF (appendFlag <> 0) THEN -- update
    EXECUTE ' 
    UPDATE observation_fact f    
    SET valtype_cd = temp.valtype_cd ,
    tval_char=temp.tval_char, 
    nval_num = temp.nval_num,
    valueflag_cd=temp.valueflag_cd,
    quantity_num=temp.quantity_num,
    confidence_num=temp.confidence_num,
    observation_blob =temp.observation_blob,
    units_cd=temp.units_cd,
    end_date=temp.end_date,
    location_cd =temp.location_cd,
    update_date=temp.update_date ,
    download_date =temp.download_date,
    import_date=temp.import_date,
    sourcesystem_cd =temp.sourcesystem_cd,
    upload_id = temp.upload_id 
    FROM ' || upload_temptable_name ||' temp
    WHERE 
    temp.patient_num is not null 
    and temp.encounter_num is not null 
    and temp.encounter_num = f.encounter_num 
    and temp.patient_num = f.patient_num
    and temp.concept_cd = f.concept_cd
    and temp.start_date = f.start_date
    and temp.provider_id = f.provider_id
    and temp.modifier_cd = f.modifier_cd 
    and temp.instance_num = f.instance_num
    and coalesce(f.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) <= coalesce(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))';

    EXECUTE  'DELETE FROM ' || upload_temptable_name ||' temp WHERE EXISTS (SELECT 1 
        FROM observation_fact f 
        WHERE temp.patient_num is not null 
        and temp.encounter_num is not null 
        and temp.encounter_num = f.encounter_num 
        and temp.patient_num = f.patient_num
        and temp.concept_cd = f.concept_cd
        and temp.start_date = f.start_date
        and temp.provider_id = f.provider_id
        and temp.modifier_cd = f.modifier_cd 
        and temp.instance_num = f.instance_num
    )';

END IF;
--Transfer all rows FROM temp_obsfact to observation_fact
EXECUTE 'INSERT INTO observation_fact(
    encounter_num
    ,concept_cd
    , patient_num
    ,provider_id
    , start_date
    ,modifier_cd
    ,instance_num
    ,valtype_cd
    ,tval_char
    ,nval_num
    ,valueflag_cd
    ,quantity_num
    ,confidence_num
    ,observation_blob
    ,units_cd
    ,end_date
    ,location_cd
    , update_date
    ,download_date
    ,import_date
    ,sourcesystem_cd
    ,upload_id)
SELECT encounter_num
,concept_cd
, patient_num
,provider_id
, start_date
,modifier_cd
,instance_num
,valtype_cd
,tval_char
,nval_num
,valueflag_cd
,quantity_num
,confidence_num
,observation_blob
,units_cd
,end_date
,location_cd
, update_date
,download_date
,Now()
,sourcesystem_cd
,temp.upload_id 
FROM ' || upload_temptable_name ||' temp
WHERE (temp.patient_num IS NOT NULL AND temp.patient_num::text <> '''') AND  (temp.encounter_num IS NOT NULL AND temp.encounter_num::text <> '''')';


EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.update_observation_fact(upload_temptable_name text, upload_id bigint, appendflag bigint, OUT errormsg text) OWNER TO i2b2demodata;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: archive_observation_fact; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE archive_observation_fact (
    encounter_num integer,
    patient_num integer,
    concept_cd character varying(50),
    provider_id character varying(50),
    start_date timestamp without time zone,
    modifier_cd character varying(100),
    instance_num integer,
    valtype_cd character varying(50),
    tval_char character varying(255),
    nval_num numeric(18,5),
    valueflag_cd character varying(50),
    quantity_num numeric(18,5),
    units_cd character varying(50),
    end_date timestamp without time zone,
    location_cd character varying(50),
    observation_blob text,
    confidence_num numeric(18,5),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer,
    text_search_index integer,
    archive_upload_id integer
);


ALTER TABLE i2b2demodata.archive_observation_fact OWNER TO i2b2demodata;

--
-- Name: code_lookup; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE code_lookup (
    table_cd character varying(100) NOT NULL,
    column_cd character varying(100) NOT NULL,
    code_cd character varying(50) NOT NULL,
    name_char character varying(650),
    lookup_blob text,
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.code_lookup OWNER TO i2b2demodata;

--
-- Name: concept_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE concept_dimension (
    concept_path character varying(700) NOT NULL,
    concept_cd character varying(50),
    name_char character varying(2000),
    concept_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.concept_dimension OWNER TO i2b2demodata;

--
-- Name: datamart_report; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE datamart_report (
    total_patient integer,
    total_observationfact integer,
    total_event integer,
    report_date timestamp without time zone
);


ALTER TABLE i2b2demodata.datamart_report OWNER TO i2b2demodata;

--
-- Name: encounter_mapping; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE encounter_mapping (
    encounter_ide character varying(200) NOT NULL,
    encounter_ide_source character varying(50) NOT NULL,
    project_id character varying(50) NOT NULL,
    encounter_num integer NOT NULL,
    patient_ide character varying(200) NOT NULL,
    patient_ide_source character varying(50) NOT NULL,
    encounter_ide_status character varying(50),
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.encounter_mapping OWNER TO i2b2demodata;

--
-- Name: modifier_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE modifier_dimension (
    modifier_path character varying(700) NOT NULL,
    modifier_cd character varying(50),
    name_char character varying(2000),
    modifier_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.modifier_dimension OWNER TO i2b2demodata;

--
-- Name: observation_fact; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE observation_fact (
    encounter_num integer NOT NULL,
    patient_num integer NOT NULL,
    concept_cd character varying(50) NOT NULL,
    provider_id character varying(50) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    modifier_cd character varying(100) DEFAULT '@'::character varying NOT NULL,
    instance_num integer DEFAULT 1 NOT NULL,
    valtype_cd character varying(50),
    tval_char character varying(255),
    nval_num numeric(18,5),
    valueflag_cd character varying(50),
    quantity_num numeric(18,5),
    units_cd character varying(50),
    end_date timestamp without time zone,
    location_cd character varying(50),
    observation_blob text,
    confidence_num numeric(18,5),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer,
    text_search_index integer NOT NULL
);


ALTER TABLE i2b2demodata.observation_fact OWNER TO i2b2demodata;

--
-- Name: observation_fact_text_search_index_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE observation_fact_text_search_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.observation_fact_text_search_index_seq OWNER TO i2b2demodata;

--
-- Name: observation_fact_text_search_index_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE observation_fact_text_search_index_seq OWNED BY observation_fact.text_search_index;


--
-- Name: patient_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE patient_dimension (
    patient_num integer NOT NULL,
    vital_status_cd character varying(50),
    birth_date timestamp without time zone,
    death_date timestamp without time zone,
    sex_cd character varying(50),
    age_in_years_num integer,
    language_cd character varying(50),
    race_cd character varying(50),
    marital_status_cd character varying(50),
    religion_cd character varying(50),
    zip_cd character varying(10),
    statecityzip_path character varying(700),
    income_cd character varying(50),
    patient_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.patient_dimension OWNER TO i2b2demodata;

--
-- Name: patient_mapping; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE patient_mapping (
    patient_ide character varying(200) NOT NULL,
    patient_ide_source character varying(50) NOT NULL,
    patient_num integer NOT NULL,
    patient_ide_status character varying(50),
    project_id character varying(50) NOT NULL,
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.patient_mapping OWNER TO i2b2demodata;

--
-- Name: provider_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE provider_dimension (
    provider_id character varying(50) NOT NULL,
    provider_path character varying(700) NOT NULL,
    name_char character varying(850),
    provider_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.provider_dimension OWNER TO i2b2demodata;

--
-- Name: qt_analysis_plugin; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_analysis_plugin (
    plugin_id integer NOT NULL,
    plugin_name character varying(2000),
    description character varying(2000),
    version_cd character varying(50),
    parameter_info text,
    parameter_info_xsd text,
    command_line text,
    working_folder text,
    commandoption_cd text,
    plugin_icon text,
    status_cd character varying(50),
    user_id character varying(50),
    group_id character varying(50),
    create_date timestamp without time zone,
    update_date timestamp without time zone
);


ALTER TABLE i2b2demodata.qt_analysis_plugin OWNER TO i2b2demodata;

--
-- Name: qt_analysis_plugin_result_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_analysis_plugin_result_type (
    plugin_id integer NOT NULL,
    result_type_id integer NOT NULL
);


ALTER TABLE i2b2demodata.qt_analysis_plugin_result_type OWNER TO i2b2demodata;

--
-- Name: qt_breakdown_path; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_breakdown_path (
    name character varying(100),
    value character varying(2000),
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    user_id character varying(50)
);


ALTER TABLE i2b2demodata.qt_breakdown_path OWNER TO i2b2demodata;

--
-- Name: qt_patient_enc_collection; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_patient_enc_collection (
    patient_enc_coll_id integer NOT NULL,
    result_instance_id integer,
    set_index integer,
    patient_num integer,
    encounter_num integer
);


ALTER TABLE i2b2demodata.qt_patient_enc_collection OWNER TO i2b2demodata;

--
-- Name: qt_patient_enc_collection_patient_enc_coll_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_patient_enc_collection_patient_enc_coll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_patient_enc_collection_patient_enc_coll_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_patient_enc_collection_patient_enc_coll_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE qt_patient_enc_collection_patient_enc_coll_id_seq OWNED BY qt_patient_enc_collection.patient_enc_coll_id;


--
-- Name: qt_patient_set_collection; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_patient_set_collection (
    patient_set_coll_id bigint NOT NULL,
    result_instance_id integer,
    set_index integer,
    patient_num integer
);


ALTER TABLE i2b2demodata.qt_patient_set_collection OWNER TO i2b2demodata;

--
-- Name: qt_patient_set_collection_patient_set_coll_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_patient_set_collection_patient_set_coll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_patient_set_collection_patient_set_coll_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_patient_set_collection_patient_set_coll_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE qt_patient_set_collection_patient_set_coll_id_seq OWNED BY qt_patient_set_collection.patient_set_coll_id;


--
-- Name: qt_pdo_query_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_pdo_query_master (
    query_master_id integer NOT NULL,
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    request_xml text,
    i2b2_request_xml text
);


ALTER TABLE i2b2demodata.qt_pdo_query_master OWNER TO i2b2demodata;

--
-- Name: qt_pdo_query_master_query_master_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_pdo_query_master_query_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_pdo_query_master_query_master_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_pdo_query_master_query_master_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE qt_pdo_query_master_query_master_id_seq OWNED BY qt_pdo_query_master.query_master_id;


--
-- Name: qt_privilege; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_privilege (
    protection_label_cd character varying(1500),
    dataprot_cd character varying(1000),
    hivemgmt_cd character varying(1000),
    plugin_id integer
);


ALTER TABLE i2b2demodata.qt_privilege OWNER TO i2b2demodata;

--
-- Name: qt_query_instance; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_instance (
    query_instance_id integer NOT NULL,
    query_master_id integer,
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    batch_mode character varying(50),
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    delete_flag character varying(3),
    status_type_id integer,
    message text
);


ALTER TABLE i2b2demodata.qt_query_instance OWNER TO i2b2demodata;

--
-- Name: qt_query_instance_query_instance_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_query_instance_query_instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_query_instance_query_instance_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_query_instance_query_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE qt_query_instance_query_instance_id_seq OWNED BY qt_query_instance.query_instance_id;


--
-- Name: qt_query_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_master (
    query_master_id integer NOT NULL,
    name character varying(250) NOT NULL,
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    master_type_cd character varying(2000),
    plugin_id integer,
    create_date timestamp without time zone NOT NULL,
    delete_date timestamp without time zone,
    delete_flag character varying(3),
    request_xml text,
    generated_sql text,
    i2b2_request_xml text,
    pm_xml text
);


ALTER TABLE i2b2demodata.qt_query_master OWNER TO i2b2demodata;

--
-- Name: qt_query_master_query_master_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_query_master_query_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_query_master_query_master_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_query_master_query_master_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE qt_query_master_query_master_id_seq OWNED BY qt_query_master.query_master_id;


--
-- Name: qt_query_result_instance; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_result_instance (
    result_instance_id integer NOT NULL,
    query_instance_id integer,
    result_type_id integer NOT NULL,
    set_size integer,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    status_type_id integer NOT NULL,
    delete_flag character varying(3),
    message text,
    description character varying(200),
    real_set_size integer,
    obfusc_method character varying(500)
);


ALTER TABLE i2b2demodata.qt_query_result_instance OWNER TO i2b2demodata;

--
-- Name: qt_query_result_instance_result_instance_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_query_result_instance_result_instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_query_result_instance_result_instance_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_query_result_instance_result_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE qt_query_result_instance_result_instance_id_seq OWNED BY qt_query_result_instance.result_instance_id;


--
-- Name: qt_query_result_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_result_type (
    result_type_id integer NOT NULL,
    name character varying(100),
    description character varying(200),
    display_type_id character varying(500),
    visual_attribute_type_id character varying(3)
);


ALTER TABLE i2b2demodata.qt_query_result_type OWNER TO i2b2demodata;

--
-- Name: qt_query_status_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_status_type (
    status_type_id integer NOT NULL,
    name character varying(100),
    description character varying(200)
);


ALTER TABLE i2b2demodata.qt_query_status_type OWNER TO i2b2demodata;

--
-- Name: qt_xml_result; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_xml_result (
    xml_result_id integer NOT NULL,
    result_instance_id integer,
    xml_value text
);


ALTER TABLE i2b2demodata.qt_xml_result OWNER TO i2b2demodata;

--
-- Name: qt_xml_result_xml_result_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_xml_result_xml_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_xml_result_xml_result_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_xml_result_xml_result_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE qt_xml_result_xml_result_id_seq OWNED BY qt_xml_result.xml_result_id;


--
-- Name: set_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE set_type (
    id integer NOT NULL,
    name character varying(500),
    create_date timestamp without time zone
);


ALTER TABLE i2b2demodata.set_type OWNER TO i2b2demodata;

--
-- Name: set_upload_status; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE set_upload_status (
    upload_id integer NOT NULL,
    set_type_id integer NOT NULL,
    source_cd character varying(50) NOT NULL,
    no_of_record bigint,
    loaded_record bigint,
    deleted_record bigint,
    load_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    load_status character varying(100),
    message text,
    input_file_name text,
    log_file_name text,
    transform_name character varying(500)
);


ALTER TABLE i2b2demodata.set_upload_status OWNER TO i2b2demodata;

--
-- Name: source_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE source_master (
    source_cd character varying(50) NOT NULL,
    description character varying(300),
    create_date timestamp without time zone
);


ALTER TABLE i2b2demodata.source_master OWNER TO i2b2demodata;

--
-- Name: upload_status; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE upload_status (
    upload_id integer NOT NULL,
    upload_label character varying(500) NOT NULL,
    user_id character varying(100) NOT NULL,
    source_cd character varying(50) NOT NULL,
    no_of_record bigint,
    loaded_record bigint,
    deleted_record bigint,
    load_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    load_status character varying(100),
    message text,
    input_file_name text,
    log_file_name text,
    transform_name character varying(500)
);


ALTER TABLE i2b2demodata.upload_status OWNER TO i2b2demodata;

--
-- Name: upload_status_upload_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE upload_status_upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.upload_status_upload_id_seq OWNER TO i2b2demodata;

--
-- Name: upload_status_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE upload_status_upload_id_seq OWNED BY upload_status.upload_id;


--
-- Name: visit_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE visit_dimension (
    encounter_num integer NOT NULL,
    patient_num integer NOT NULL,
    active_status_cd character varying(50),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    inout_cd character varying(50),
    location_cd character varying(50),
    location_path character varying(900),
    length_of_stay integer,
    visit_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.visit_dimension OWNER TO i2b2demodata;

SET search_path = i2b2hive, pg_catalog;

--
-- Name: crc_analysis_job; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE crc_analysis_job (
    job_id character varying(10) NOT NULL,
    queue_name character varying(50),
    status_type_id integer,
    domain_id character varying(255),
    project_id character varying(500),
    user_id character varying(255),
    request_xml text,
    create_date timestamp without time zone,
    update_date timestamp without time zone
);


ALTER TABLE i2b2hive.crc_analysis_job OWNER TO i2b2hive;

--
-- Name: crc_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE crc_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.crc_db_lookup OWNER TO i2b2hive;

--
-- Name: im_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE im_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.im_db_lookup OWNER TO i2b2hive;

--
-- Name: ont_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE ont_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.ont_db_lookup OWNER TO i2b2hive;

--
-- Name: work_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE work_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.work_db_lookup OWNER TO i2b2hive;

SET search_path = i2b2metadata, pg_catalog;

--
-- Name: birn; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE birn (
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.birn OWNER TO i2b2metadata;

--
-- Name: custom_meta; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE custom_meta (
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.custom_meta OWNER TO i2b2metadata;

--
-- Name: i2b2; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE i2b2 (
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.i2b2 OWNER TO i2b2metadata;

--
-- Name: icd10_icd9; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE icd10_icd9 (
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50),
    plain_code character varying(25)
);


ALTER TABLE i2b2metadata.icd10_icd9 OWNER TO i2b2metadata;

--
-- Name: ont_process_status; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE ont_process_status (
    process_id integer NOT NULL,
    process_type_cd character varying(50),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    process_step_cd character varying(50),
    process_status_cd character varying(50),
    crc_upload_id integer,
    status_cd character varying(50),
    message text,
    entry_date timestamp without time zone,
    change_date timestamp without time zone,
    changedby_char character(50)
);


ALTER TABLE i2b2metadata.ont_process_status OWNER TO i2b2metadata;

--
-- Name: ont_process_status_process_id_seq; Type: SEQUENCE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE SEQUENCE ont_process_status_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2metadata.ont_process_status_process_id_seq OWNER TO i2b2metadata;

--
-- Name: ont_process_status_process_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2metadata; Owner: i2b2metadata
--

ALTER SEQUENCE ont_process_status_process_id_seq OWNED BY ont_process_status.process_id;


--
-- Name: schemes; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE schemes (
    c_key character varying(50) NOT NULL,
    c_name character varying(50) NOT NULL,
    c_description character varying(100)
);


ALTER TABLE i2b2metadata.schemes OWNER TO i2b2metadata;

--
-- Name: table_access; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE table_access (
    c_table_cd character varying(50) NOT NULL,
    c_table_name character varying(50) NOT NULL,
    c_protected_access character(1),
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_dimtablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1),
    valuetype_cd character varying(50)
);


ALTER TABLE i2b2metadata.table_access OWNER TO i2b2metadata;

SET search_path = i2b2pm, pg_catalog;

--
-- Name: pm_approvals; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_approvals (
    approval_id character varying(50) NOT NULL,
    approval_name character varying(255),
    approval_description character varying(2000),
    approval_activation_date timestamp without time zone,
    approval_expiration_date timestamp without time zone,
    object_cd character varying(50),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_approvals OWNER TO i2b2pm;

--
-- Name: pm_approvals_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_approvals_params (
    id integer NOT NULL,
    approval_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    activation_date timestamp without time zone,
    expiration_date timestamp without time zone,
    datatype_cd character varying(50),
    object_cd character varying(50),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_approvals_params OWNER TO i2b2pm;

--
-- Name: pm_approvals_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_approvals_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_approvals_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_approvals_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE pm_approvals_params_id_seq OWNED BY pm_approvals_params.id;


--
-- Name: pm_cell_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_cell_data (
    cell_id character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    name character varying(255),
    method_cd character varying(255),
    url character varying(255),
    can_override integer,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_cell_data OWNER TO i2b2pm;

--
-- Name: pm_cell_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_cell_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    cell_id character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    can_override integer,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_cell_params OWNER TO i2b2pm;

--
-- Name: pm_cell_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_cell_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_cell_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_cell_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE pm_cell_params_id_seq OWNED BY pm_cell_params.id;


--
-- Name: pm_global_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_global_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    param_name_cd character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    value text,
    can_override integer,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_global_params OWNER TO i2b2pm;

--
-- Name: pm_global_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_global_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_global_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_global_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE pm_global_params_id_seq OWNED BY pm_global_params.id;


--
-- Name: pm_hive_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_hive_data (
    domain_id character varying(50) NOT NULL,
    helpurl character varying(255),
    domain_name character varying(255),
    environment_cd character varying(255),
    active integer,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_hive_data OWNER TO i2b2pm;

--
-- Name: pm_hive_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_hive_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    domain_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_hive_params OWNER TO i2b2pm;

--
-- Name: pm_hive_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_hive_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_hive_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_hive_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE pm_hive_params_id_seq OWNED BY pm_hive_params.id;


--
-- Name: pm_project_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_data (
    project_id character varying(50) NOT NULL,
    project_name character varying(255),
    project_wiki character varying(255),
    project_key character varying(255),
    project_path character varying(255),
    project_description character varying(2000),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_data OWNER TO i2b2pm;

--
-- Name: pm_project_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    project_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_params OWNER TO i2b2pm;

--
-- Name: pm_project_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_project_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_project_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_project_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE pm_project_params_id_seq OWNED BY pm_project_params.id;


--
-- Name: pm_project_request; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_request (
    id integer NOT NULL,
    title character varying(255),
    request_xml text NOT NULL,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50),
    project_id character varying(50),
    submit_char character varying(50)
);


ALTER TABLE i2b2pm.pm_project_request OWNER TO i2b2pm;

--
-- Name: pm_project_request_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_project_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_project_request_id_seq OWNER TO i2b2pm;

--
-- Name: pm_project_request_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE pm_project_request_id_seq OWNED BY pm_project_request.id;


--
-- Name: pm_project_user_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_user_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    project_id character varying(50) NOT NULL,
    user_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_user_params OWNER TO i2b2pm;

--
-- Name: pm_project_user_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_project_user_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_project_user_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_project_user_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE pm_project_user_params_id_seq OWNED BY pm_project_user_params.id;


--
-- Name: pm_project_user_roles; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_user_roles (
    project_id character varying(50) NOT NULL,
    user_id character varying(50) NOT NULL,
    user_role_cd character varying(255) NOT NULL,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_user_roles OWNER TO i2b2pm;

--
-- Name: pm_role_requirement; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_role_requirement (
    table_cd character varying(50) NOT NULL,
    column_cd character varying(50) NOT NULL,
    read_hivemgmt_cd character varying(50) NOT NULL,
    write_hivemgmt_cd character varying(50) NOT NULL,
    name_char character varying(2000),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_role_requirement OWNER TO i2b2pm;

--
-- Name: pm_user_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_user_data (
    user_id character varying(50) NOT NULL,
    full_name character varying(255),
    password character varying(255),
    email character varying(255),
    project_path character varying(255),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_data OWNER TO i2b2pm;

--
-- Name: pm_user_login; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_user_login (
    user_id character varying(50) NOT NULL,
    attempt_cd character varying(50) NOT NULL,
    entry_date timestamp without time zone NOT NULL,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_login OWNER TO i2b2pm;

--
-- Name: pm_user_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_user_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    user_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_params OWNER TO i2b2pm;

--
-- Name: pm_user_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_user_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_user_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_user_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE pm_user_params_id_seq OWNED BY pm_user_params.id;


--
-- Name: pm_user_session; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_user_session (
    user_id character varying(50) NOT NULL,
    session_id character varying(50) NOT NULL,
    expired_date timestamp without time zone,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_session OWNER TO i2b2pm;

SET search_path = i2b2workdata, pg_catalog;

--
-- Name: workplace; Type: TABLE; Schema: i2b2workdata; Owner: i2b2workdata; Tablespace: 
--

CREATE TABLE workplace (
    c_name character varying(255) NOT NULL,
    c_user_id character varying(255) NOT NULL,
    c_group_id character varying(255) NOT NULL,
    c_share_id character varying(255),
    c_index character varying(255) NOT NULL,
    c_parent_index character varying(255),
    c_visualattributes character(3) NOT NULL,
    c_protected_access character(1),
    c_tooltip character varying(255),
    c_work_xml text,
    c_work_xml_schema text,
    c_work_xml_i2b2_type character varying(255),
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2workdata.workplace OWNER TO i2b2workdata;

--
-- Name: workplace_access; Type: TABLE; Schema: i2b2workdata; Owner: i2b2workdata; Tablespace: 
--

CREATE TABLE workplace_access (
    c_table_cd character varying(255) NOT NULL,
    c_table_name character varying(255) NOT NULL,
    c_protected_access character(1),
    c_hlevel integer NOT NULL,
    c_name character varying(255) NOT NULL,
    c_user_id character varying(255) NOT NULL,
    c_group_id character varying(255) NOT NULL,
    c_share_id character varying(255),
    c_index character varying(255) NOT NULL,
    c_parent_index character varying(255),
    c_visualattributes character(3) NOT NULL,
    c_tooltip character varying(255),
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2workdata.workplace_access OWNER TO i2b2workdata;

SET search_path = i2b2demodata, pg_catalog;

--
-- Name: text_search_index; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY observation_fact ALTER COLUMN text_search_index SET DEFAULT nextval('observation_fact_text_search_index_seq'::regclass);


--
-- Name: patient_enc_coll_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_patient_enc_collection ALTER COLUMN patient_enc_coll_id SET DEFAULT nextval('qt_patient_enc_collection_patient_enc_coll_id_seq'::regclass);


--
-- Name: patient_set_coll_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_patient_set_collection ALTER COLUMN patient_set_coll_id SET DEFAULT nextval('qt_patient_set_collection_patient_set_coll_id_seq'::regclass);


--
-- Name: query_master_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_pdo_query_master ALTER COLUMN query_master_id SET DEFAULT nextval('qt_pdo_query_master_query_master_id_seq'::regclass);


--
-- Name: query_instance_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_instance ALTER COLUMN query_instance_id SET DEFAULT nextval('qt_query_instance_query_instance_id_seq'::regclass);


--
-- Name: query_master_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_master ALTER COLUMN query_master_id SET DEFAULT nextval('qt_query_master_query_master_id_seq'::regclass);


--
-- Name: result_instance_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_result_instance ALTER COLUMN result_instance_id SET DEFAULT nextval('qt_query_result_instance_result_instance_id_seq'::regclass);


--
-- Name: xml_result_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_xml_result ALTER COLUMN xml_result_id SET DEFAULT nextval('qt_xml_result_xml_result_id_seq'::regclass);


--
-- Name: upload_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY upload_status ALTER COLUMN upload_id SET DEFAULT nextval('upload_status_upload_id_seq'::regclass);


SET search_path = i2b2metadata, pg_catalog;

--
-- Name: process_id; Type: DEFAULT; Schema: i2b2metadata; Owner: i2b2metadata
--

ALTER TABLE ONLY ont_process_status ALTER COLUMN process_id SET DEFAULT nextval('ont_process_status_process_id_seq'::regclass);


SET search_path = i2b2pm, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY pm_approvals_params ALTER COLUMN id SET DEFAULT nextval('pm_approvals_params_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY pm_cell_params ALTER COLUMN id SET DEFAULT nextval('pm_cell_params_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY pm_global_params ALTER COLUMN id SET DEFAULT nextval('pm_global_params_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY pm_hive_params ALTER COLUMN id SET DEFAULT nextval('pm_hive_params_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY pm_project_params ALTER COLUMN id SET DEFAULT nextval('pm_project_params_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY pm_project_request ALTER COLUMN id SET DEFAULT nextval('pm_project_request_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY pm_project_user_params ALTER COLUMN id SET DEFAULT nextval('pm_project_user_params_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY pm_user_params ALTER COLUMN id SET DEFAULT nextval('pm_user_params_id_seq'::regclass);


SET search_path = i2b2demodata, pg_catalog;

--
-- Name: analysis_plugin_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_analysis_plugin
    ADD CONSTRAINT analysis_plugin_pk PRIMARY KEY (plugin_id);


--
-- Name: analysis_plugin_result_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_analysis_plugin_result_type
    ADD CONSTRAINT analysis_plugin_result_pk PRIMARY KEY (plugin_id, result_type_id);


--
-- Name: code_lookup_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY code_lookup
    ADD CONSTRAINT code_lookup_pk PRIMARY KEY (table_cd, column_cd, code_cd);


--
-- Name: concept_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY concept_dimension
    ADD CONSTRAINT concept_dimension_pk PRIMARY KEY (concept_path);


--
-- Name: encounter_mapping_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY encounter_mapping
    ADD CONSTRAINT encounter_mapping_pk PRIMARY KEY (encounter_ide, encounter_ide_source, project_id, patient_ide, patient_ide_source);


--
-- Name: modifier_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY modifier_dimension
    ADD CONSTRAINT modifier_dimension_pk PRIMARY KEY (modifier_path);


--
-- Name: observation_fact_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY observation_fact
    ADD CONSTRAINT observation_fact_pk PRIMARY KEY (patient_num, concept_cd, modifier_cd, start_date, encounter_num, instance_num, provider_id);


--
-- Name: patient_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY patient_dimension
    ADD CONSTRAINT patient_dimension_pk PRIMARY KEY (patient_num);


--
-- Name: patient_mapping_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY patient_mapping
    ADD CONSTRAINT patient_mapping_pk PRIMARY KEY (patient_ide, patient_ide_source, project_id);


--
-- Name: pk_sourcemaster_sourcecd; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY source_master
    ADD CONSTRAINT pk_sourcemaster_sourcecd PRIMARY KEY (source_cd);


--
-- Name: pk_st_id; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY set_type
    ADD CONSTRAINT pk_st_id PRIMARY KEY (id);


--
-- Name: pk_up_upstatus_idsettypeid; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY set_upload_status
    ADD CONSTRAINT pk_up_upstatus_idsettypeid PRIMARY KEY (upload_id, set_type_id);


--
-- Name: provider_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY provider_dimension
    ADD CONSTRAINT provider_dimension_pk PRIMARY KEY (provider_path, provider_id);


--
-- Name: qt_patient_enc_collection_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_patient_enc_collection
    ADD CONSTRAINT qt_patient_enc_collection_pkey PRIMARY KEY (patient_enc_coll_id);


--
-- Name: qt_patient_set_collection_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_patient_set_collection
    ADD CONSTRAINT qt_patient_set_collection_pkey PRIMARY KEY (patient_set_coll_id);


--
-- Name: qt_pdo_query_master_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_pdo_query_master
    ADD CONSTRAINT qt_pdo_query_master_pkey PRIMARY KEY (query_master_id);


--
-- Name: qt_query_instance_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_instance
    ADD CONSTRAINT qt_query_instance_pkey PRIMARY KEY (query_instance_id);


--
-- Name: qt_query_master_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_master
    ADD CONSTRAINT qt_query_master_pkey PRIMARY KEY (query_master_id);


--
-- Name: qt_query_result_instance_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_result_instance
    ADD CONSTRAINT qt_query_result_instance_pkey PRIMARY KEY (result_instance_id);


--
-- Name: qt_query_result_type_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_result_type
    ADD CONSTRAINT qt_query_result_type_pkey PRIMARY KEY (result_type_id);


--
-- Name: qt_query_status_type_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_status_type
    ADD CONSTRAINT qt_query_status_type_pkey PRIMARY KEY (status_type_id);


--
-- Name: qt_xml_result_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_xml_result
    ADD CONSTRAINT qt_xml_result_pkey PRIMARY KEY (xml_result_id);


--
-- Name: upload_status_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY upload_status
    ADD CONSTRAINT upload_status_pkey PRIMARY KEY (upload_id);


--
-- Name: visit_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY visit_dimension
    ADD CONSTRAINT visit_dimension_pk PRIMARY KEY (encounter_num, patient_num);


SET search_path = i2b2hive, pg_catalog;

--
-- Name: analsis_job_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY crc_analysis_job
    ADD CONSTRAINT analsis_job_pk PRIMARY KEY (job_id);


--
-- Name: crc_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY crc_db_lookup
    ADD CONSTRAINT crc_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- Name: im_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY im_db_lookup
    ADD CONSTRAINT im_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- Name: ont_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY ont_db_lookup
    ADD CONSTRAINT ont_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- Name: work_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY work_db_lookup
    ADD CONSTRAINT work_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


SET search_path = i2b2metadata, pg_catalog;

--
-- Name: ont_process_status_pkey; Type: CONSTRAINT; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

ALTER TABLE ONLY ont_process_status
    ADD CONSTRAINT ont_process_status_pkey PRIMARY KEY (process_id);


--
-- Name: schemes_pk; Type: CONSTRAINT; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

ALTER TABLE ONLY schemes
    ADD CONSTRAINT schemes_pk PRIMARY KEY (c_key);


SET search_path = i2b2pm, pg_catalog;

--
-- Name: pm_approvals_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_approvals_params
    ADD CONSTRAINT pm_approvals_params_pkey PRIMARY KEY (id);


--
-- Name: pm_cell_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_cell_data
    ADD CONSTRAINT pm_cell_data_pkey PRIMARY KEY (cell_id, project_path);


--
-- Name: pm_cell_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_cell_params
    ADD CONSTRAINT pm_cell_params_pkey PRIMARY KEY (id);


--
-- Name: pm_global_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_global_params
    ADD CONSTRAINT pm_global_params_pkey PRIMARY KEY (id);


--
-- Name: pm_hive_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_hive_data
    ADD CONSTRAINT pm_hive_data_pkey PRIMARY KEY (domain_id);


--
-- Name: pm_hive_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_hive_params
    ADD CONSTRAINT pm_hive_params_pkey PRIMARY KEY (id);


--
-- Name: pm_project_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_data
    ADD CONSTRAINT pm_project_data_pkey PRIMARY KEY (project_id);


--
-- Name: pm_project_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_params
    ADD CONSTRAINT pm_project_params_pkey PRIMARY KEY (id);


--
-- Name: pm_project_request_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_request
    ADD CONSTRAINT pm_project_request_pkey PRIMARY KEY (id);


--
-- Name: pm_project_user_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_user_params
    ADD CONSTRAINT pm_project_user_params_pkey PRIMARY KEY (id);


--
-- Name: pm_project_user_roles_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_user_roles
    ADD CONSTRAINT pm_project_user_roles_pkey PRIMARY KEY (project_id, user_id, user_role_cd);


--
-- Name: pm_role_requirement_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_role_requirement
    ADD CONSTRAINT pm_role_requirement_pkey PRIMARY KEY (table_cd, column_cd, read_hivemgmt_cd, write_hivemgmt_cd);


--
-- Name: pm_user_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_user_data
    ADD CONSTRAINT pm_user_data_pkey PRIMARY KEY (user_id);


--
-- Name: pm_user_login_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_user_login
    ADD CONSTRAINT pm_user_login_pkey PRIMARY KEY (entry_date, user_id);


--
-- Name: pm_user_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_user_params
    ADD CONSTRAINT pm_user_params_pkey PRIMARY KEY (id);


--
-- Name: pm_user_session_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_user_session
    ADD CONSTRAINT pm_user_session_pkey PRIMARY KEY (session_id, user_id);


SET search_path = i2b2workdata, pg_catalog;

--
-- Name: workplace_access_pk; Type: CONSTRAINT; Schema: i2b2workdata; Owner: i2b2workdata; Tablespace: 
--

ALTER TABLE ONLY workplace_access
    ADD CONSTRAINT workplace_access_pk PRIMARY KEY (c_index);


--
-- Name: workplace_pk; Type: CONSTRAINT; Schema: i2b2workdata; Owner: i2b2workdata; Tablespace: 
--

ALTER TABLE ONLY workplace
    ADD CONSTRAINT workplace_pk PRIMARY KEY (c_index);


SET search_path = i2b2demodata, pg_catalog;

--
-- Name: cd_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX cd_idx_uploadid ON concept_dimension USING btree (upload_id);


--
-- Name: cl_idx_name_char; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX cl_idx_name_char ON code_lookup USING btree (name_char);


--
-- Name: cl_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX cl_idx_uploadid ON code_lookup USING btree (upload_id);


--
-- Name: em_encnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX em_encnum_idx ON encounter_mapping USING btree (encounter_num);


--
-- Name: em_idx_encpath; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX em_idx_encpath ON encounter_mapping USING btree (encounter_ide, encounter_ide_source, patient_ide, patient_ide_source, encounter_num);


--
-- Name: em_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX em_idx_uploadid ON encounter_mapping USING btree (upload_id);


--
-- Name: md_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX md_idx_uploadid ON modifier_dimension USING btree (upload_id);


--
-- Name: of_idx_allobservation_fact; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX of_idx_allobservation_fact ON observation_fact USING btree (patient_num, encounter_num, concept_cd, start_date, provider_id, modifier_cd, instance_num, valtype_cd, tval_char, nval_num, valueflag_cd, quantity_num, units_cd, end_date, location_cd, confidence_num);


--
-- Name: of_idx_clusteredconcept; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX of_idx_clusteredconcept ON observation_fact USING btree (concept_cd);


--
-- Name: of_idx_encounter_patient; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX of_idx_encounter_patient ON observation_fact USING btree (encounter_num, patient_num, instance_num);


--
-- Name: of_idx_modifier; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX of_idx_modifier ON observation_fact USING btree (modifier_cd);


--
-- Name: of_idx_sourcesystem_cd; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX of_idx_sourcesystem_cd ON observation_fact USING btree (sourcesystem_cd);


--
-- Name: of_idx_start_date; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX of_idx_start_date ON observation_fact USING btree (start_date, patient_num);


--
-- Name: of_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX of_idx_uploadid ON observation_fact USING btree (upload_id);


--
-- Name: of_text_search_unique; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE UNIQUE INDEX of_text_search_unique ON observation_fact USING btree (text_search_index);


--
-- Name: pa_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pa_idx_uploadid ON patient_dimension USING btree (upload_id);


--
-- Name: pd_idx_allpatientdim; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_allpatientdim ON patient_dimension USING btree (patient_num, vital_status_cd, birth_date, death_date, sex_cd, age_in_years_num, language_cd, race_cd, marital_status_cd, income_cd, religion_cd, zip_cd);


--
-- Name: pd_idx_dates; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_dates ON patient_dimension USING btree (patient_num, vital_status_cd, birth_date, death_date);


--
-- Name: pd_idx_name_char; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_name_char ON provider_dimension USING btree (provider_id, name_char);


--
-- Name: pd_idx_statecityzip; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_statecityzip ON patient_dimension USING btree (statecityzip_path, patient_num);


--
-- Name: pd_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_uploadid ON provider_dimension USING btree (upload_id);


--
-- Name: pk_archive_obsfact; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pk_archive_obsfact ON archive_observation_fact USING btree (encounter_num, patient_num, concept_cd, provider_id, start_date, modifier_cd, archive_upload_id);


--
-- Name: pm_encpnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pm_encpnum_idx ON patient_mapping USING btree (patient_ide, patient_ide_source, patient_num);


--
-- Name: pm_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pm_idx_uploadid ON patient_mapping USING btree (upload_id);


--
-- Name: pm_patnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pm_patnum_idx ON patient_mapping USING btree (patient_num);


--
-- Name: qt_apnamevergrp_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_apnamevergrp_idx ON qt_analysis_plugin USING btree (plugin_name, version_cd, group_id);


--
-- Name: qt_idx_pqm_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_pqm_ugid ON qt_pdo_query_master USING btree (user_id, group_id);


--
-- Name: qt_idx_qi_mstartid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_qi_mstartid ON qt_query_instance USING btree (query_master_id, start_date);


--
-- Name: qt_idx_qi_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_qi_ugid ON qt_query_instance USING btree (user_id, group_id);


--
-- Name: qt_idx_qm_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_qm_ugid ON qt_query_master USING btree (user_id, group_id, master_type_cd);


--
-- Name: qt_idx_qpsc_riid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_qpsc_riid ON qt_patient_set_collection USING btree (result_instance_id);


--
-- Name: vd_idx_allvisitdim; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX vd_idx_allvisitdim ON visit_dimension USING btree (encounter_num, patient_num, inout_cd, location_cd, start_date, length_of_stay, end_date);


--
-- Name: vd_idx_dates; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX vd_idx_dates ON visit_dimension USING btree (encounter_num, start_date, end_date);


--
-- Name: vd_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX vd_idx_uploadid ON visit_dimension USING btree (upload_id);


SET search_path = i2b2hive, pg_catalog;

--
-- Name: crc_idx_aj_qnstid; Type: INDEX; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE INDEX crc_idx_aj_qnstid ON crc_analysis_job USING btree (queue_name, status_type_id);


SET search_path = i2b2metadata, pg_catalog;

--
-- Name: meta_appl_path_icd10_icd9_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_appl_path_icd10_icd9_idx ON icd10_icd9 USING btree (m_applied_path);


--
-- Name: meta_applied_path_idx_birn; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_applied_path_idx_birn ON birn USING btree (m_applied_path);


--
-- Name: meta_applied_path_idx_custom; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_applied_path_idx_custom ON custom_meta USING btree (m_applied_path);


--
-- Name: meta_applied_path_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_applied_path_idx_i2b2 ON i2b2 USING btree (m_applied_path);


--
-- Name: meta_exclusion_icd10_icd9_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_exclusion_icd10_icd9_idx ON icd10_icd9 USING btree (m_exclusion_cd);


--
-- Name: meta_exclusion_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_exclusion_idx_i2b2 ON i2b2 USING btree (m_exclusion_cd);


--
-- Name: meta_fullname_idx_birn; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_fullname_idx_birn ON birn USING btree (c_fullname);


--
-- Name: meta_fullname_idx_custom; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_fullname_idx_custom ON custom_meta USING btree (c_fullname);


--
-- Name: meta_fullname_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_fullname_idx_i2b2 ON i2b2 USING btree (c_fullname);


--
-- Name: meta_fullname_idx_icd10_icd9; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_fullname_idx_icd10_icd9 ON icd10_icd9 USING btree (c_fullname);


--
-- Name: meta_hlevel_icd10_icd9_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_hlevel_icd10_icd9_idx ON icd10_icd9 USING btree (c_hlevel);


--
-- Name: meta_hlevel_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_hlevel_idx_i2b2 ON i2b2 USING btree (c_hlevel);


--
-- Name: meta_synonym_icd10_icd9_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_synonym_icd10_icd9_idx ON icd10_icd9 USING btree (c_synonym_cd);


--
-- Name: meta_synonym_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE INDEX meta_synonym_idx_i2b2 ON i2b2 USING btree (c_synonym_cd);


SET search_path = i2b2demodata, pg_catalog;

--
-- Name: fk_up_set_type_id; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY set_upload_status
    ADD CONSTRAINT fk_up_set_type_id FOREIGN KEY (set_type_id) REFERENCES set_type(id);


--
-- Name: qt_fk_pesc_ri; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_patient_enc_collection
    ADD CONSTRAINT qt_fk_pesc_ri FOREIGN KEY (result_instance_id) REFERENCES qt_query_result_instance(result_instance_id);


--
-- Name: qt_fk_psc_ri; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_patient_set_collection
    ADD CONSTRAINT qt_fk_psc_ri FOREIGN KEY (result_instance_id) REFERENCES qt_query_result_instance(result_instance_id);


--
-- Name: qt_fk_qi_mid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_instance
    ADD CONSTRAINT qt_fk_qi_mid FOREIGN KEY (query_master_id) REFERENCES qt_query_master(query_master_id);


--
-- Name: qt_fk_qi_stid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_instance
    ADD CONSTRAINT qt_fk_qi_stid FOREIGN KEY (status_type_id) REFERENCES qt_query_status_type(status_type_id);


--
-- Name: qt_fk_qri_rid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_rid FOREIGN KEY (query_instance_id) REFERENCES qt_query_instance(query_instance_id);


--
-- Name: qt_fk_qri_rtid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_rtid FOREIGN KEY (result_type_id) REFERENCES qt_query_result_type(result_type_id);


--
-- Name: qt_fk_qri_stid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_stid FOREIGN KEY (status_type_id) REFERENCES qt_query_status_type(status_type_id);


--
-- Name: qt_fk_xmlr_riid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_xml_result
    ADD CONSTRAINT qt_fk_xmlr_riid FOREIGN KEY (result_instance_id) REFERENCES qt_query_result_instance(result_instance_id);


--
-- Name: i2b2hive; Type: ACL; Schema: -; Owner: weymouth
--

REVOKE ALL ON SCHEMA i2b2hive FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2hive FROM weymouth;
GRANT ALL ON SCHEMA i2b2hive TO weymouth;
GRANT USAGE ON SCHEMA i2b2hive TO i2b2hive;


--
-- Name: i2b2imdata; Type: ACL; Schema: -; Owner: weymouth
--

REVOKE ALL ON SCHEMA i2b2imdata FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2imdata FROM weymouth;
GRANT ALL ON SCHEMA i2b2imdata TO weymouth;
GRANT USAGE ON SCHEMA i2b2imdata TO i2b2imdata;


--
-- Name: i2b2metadata; Type: ACL; Schema: -; Owner: weymouth
--

REVOKE ALL ON SCHEMA i2b2metadata FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2metadata FROM weymouth;
GRANT ALL ON SCHEMA i2b2metadata TO weymouth;
GRANT USAGE ON SCHEMA i2b2metadata TO i2b2metadata;


--
-- Name: i2b2pm; Type: ACL; Schema: -; Owner: weymouth
--

REVOKE ALL ON SCHEMA i2b2pm FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2pm FROM weymouth;
GRANT ALL ON SCHEMA i2b2pm TO weymouth;
GRANT USAGE ON SCHEMA i2b2pm TO i2b2pm;


--
-- Name: i2b2workdata; Type: ACL; Schema: -; Owner: weymouth
--

REVOKE ALL ON SCHEMA i2b2workdata FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2workdata FROM weymouth;
GRANT ALL ON SCHEMA i2b2workdata TO weymouth;
GRANT USAGE ON SCHEMA i2b2workdata TO i2b2workdata;


--
-- Name: public; Type: ACL; Schema: -; Owner: weymouth
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM weymouth;
GRANT ALL ON SCHEMA public TO weymouth;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

