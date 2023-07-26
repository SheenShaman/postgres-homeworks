"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import os.path
import csv

# Универсальный путь
UNI_PATH = os.path.join(os.path.abspath('..'), 'homework-1', 'north_data')


def get_data(path):
    """ Получает содержимое файла, записывает его в список и возвращает """
    with open(path, 'r', encoding='utf-8') as csv_file:
        data = [data for data in csv.reader(csv_file)]

    return data


def add_data(table_name, data, cur):
    """ Заполняет таблицы """
    sum_colum = ', '.join(['%s'] * len(data[0]))
    cur.executemany(f"INSERT INTO {table_name} VALUES ({sum_colum})", data[1:])


if __name__ == '__main__':
    """ Получение данных из файлов """
    emp_data = get_data(os.path.join(UNI_PATH, 'employees_data.csv'))
    cust_data = get_data(os.path.join(UNI_PATH, 'customers_data.csv'))
    ord_data = get_data(os.path.join(UNI_PATH, 'orders_data.csv'))

    """ Подключение к БД """
    with psycopg2.connect(host='localhost', database='north', user='postgres', password='1902') as conn:
        with conn.cursor() as cur:
            add_data('employees', emp_data, cur)
            add_data('customers', cust_data, cur)
            add_data('orders', ord_data, cur)

    conn.close()
