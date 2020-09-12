# Generated by Django 3.0.7 on 2020-09-11 01:26

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('email', models.EmailField(max_length=255, unique=True, verbose_name='email address')),
                ('student_type', models.CharField(default='individual', max_length=15)),
                ('is_active', models.BooleanField(default=True)),
                ('is_admin', models.BooleanField(default=False)),
                ('is_staff', models.BooleanField(default=False)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('image', models.ImageField(null=True, upload_to='profile-images')),
                ('phone', models.CharField(max_length=50, null=True)),
                ('timezone', models.CharField(max_length=50, null=True)),
                ('location', models.CharField(max_length=60, null=True)),
                ('linkedIn_address', models.CharField(max_length=60, null=True)),
                ('facebook_address', models.CharField(max_length=60, null=True)),
            ],
        ),
    ]
