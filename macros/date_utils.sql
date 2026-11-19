{% macro get_season (x) %}

case
when month (to_timestamp ({{x}})) in ('12','1','2')
then 'winter'
when  month (to_timestamp ({{x}})) in ('3','4')
then 'spring'
when  month (to_timestamp ({{x}})) in ('5','6','7')
then 'summer'
else 'autumn'
end




{% endmacro %}



{% macro day(x) %}
case
when dayname (to_timestamp ({{x}})) in ('sat','sun')
then 'weekends'
else 'businessday'
end 




{% endmacro %}