# Generated by Django 3.0.7 on 2021-05-06 10:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('practice_test', '0008_question_image_url'),
    ]

    operations = [
        migrations.AlterField(
            model_name='question',
            name='image_url',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]