with geo_location AS(
    select
        state_fips :: INT as state_id,
        state ::VARCHAR AS state,
        state_abbr ::VARCHAR AS state_abbr,
        zipcode ::VARCHAR AS zipcode,
        county ::VARCHAR AS county,
        city ::VARCHAR AS city

    from {{ref("geo_data_new")}}
)

select * from geo_location