# Generated by Django 3.0.7 on 2020-09-21 04:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0002_auto_20200913_1323'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='course_content_two',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='resource_url',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='video_url',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
