view: more_users {
  # or day_week._is_selected or datamart_granularity._parameter_value == "day" or adReached._in_query %}
    sql_table_name:
    {% if created_date._is_selected %}
      `looker-private-demo.thelook.users`
    {% elsif created_month._is_selected %}
      `foo`
    {% else %}
      `bar`
    {% endif %};;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  measure: count {
    type: count
  }
}
