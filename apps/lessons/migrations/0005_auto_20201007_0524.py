# Generated by Django 3.0.7 on 2020-10-07 05:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lessons', '0004_remove_lesson_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='lesson_status',
            name='lesson_status',
        ),
        migrations.AddField(
            model_name='lesson_status',
            name='completed',
            field=models.BooleanField(default=False),
        ),
    ]
