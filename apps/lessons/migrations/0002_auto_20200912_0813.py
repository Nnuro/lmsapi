# Generated by Django 3.0.7 on 2020-09-12 08:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('course_modules', '0001_initial'),
        ('lessons', '0001_initial'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='lesson',
            unique_together={('course_module', 'title')},
        ),
    ]