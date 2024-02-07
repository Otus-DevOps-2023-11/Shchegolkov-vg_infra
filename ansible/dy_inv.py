#!/usr/bin/python3
# -*- coding: utf-8 -*-
import boto3
import json
import os

# Переменные
bucket_name = "terraform-state-block"
ENDPOINT = "https://storage.yandexcloud.net"

# Настройка сессии
session = boto3.Session(
    aws_access_key_id="YCAJEF6W6LsWNRyomF_gw2Gr1",
    aws_secret_access_key="YCMmpOGcRQA6YwlXMJ6W8wFHTqJr8fAzQYgyL8Vl",
    region_name="ru-central1",
)
s3 = session.client("s3", endpoint_url=ENDPOINT)

# Проверка наличия файла
if os.path.exists('data.json'):
    os.remove('data.json')

get_object_response = s3.get_object(Bucket=bucket_name, Key='terraform/stage/terraform.tfstate')
object_content = get_object_response['Body'].read().decode('utf-8')
data = json.loads(object_content)

# Запись данных в файл "data.json"
with open('data.json', 'w') as json_file:
    json.dump(data, json_file,)
