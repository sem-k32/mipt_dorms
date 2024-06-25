import os
import pytest
import pandas as pd

sql_query_first = """
WITH great_st AS(
    SELECT max(average_grade) max_grade, school
    FROM student s
    WHERE exists(SELECT * FROM residing_student r_s WHERE r_s.student_id = s.student_id)
    GROUP BY school
)
SELECT student_id, average_grade
FROM student s
WHERE EXISTS(SELECT * FROM great_st WHERE great_st.school = s.school AND great_st.max_grade = s.average_grade)
ORDER BY average_grade DESC;
"""

@pytest.fixture()
def select_df(sqlalchemy_conn):
    return pd.read_sql_query(sql=sql_query_first, con=sqlalchemy_conn)
    

def test_first_script(select_df):
    # правильные id студентов на запрос
    right_answers = [4, 3, 5, 1]
    # результат скрипта
    select_df: pd.DataFrame = select_df
    # проверка выбора нужных студентов
    assert len(right_answers) == select_df.shape[0]

    for row, data in select_df.iterrows():
        assert data['student_id'] == right_answers[row]




