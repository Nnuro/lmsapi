# Generated by Django 3.0.7 on 2020-08-26 13:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='course_content_five',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='course',
            name='course_content_four',
            field=models.TextField(null=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='course_content_one',
            field=models.TextField(),
        ),
        migrations.AlterField(
            model_name='course',
            name='course_content_three',
            field=models.TextField(null=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='course_content_two',
            field=models.TextField(null=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='duration',
            field=models.IntegerField(help_text='Enter number of hours', null=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='is_required',
            field=models.BooleanField(default=True, null=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='resource_url',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='title',
            field=models.CharField(max_length=100, unique=True),
        ),
        migrations.AlterField(
            model_name='course',
            name='video_url',
            field=models.CharField(max_length=255, null=True),
        ),
    ]