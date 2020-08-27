from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)

from apps.badge.models import Badge


class CustomUserManager(BaseUserManager):
    def create_user(self, email, password=None): #firstname, lastname,
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),

        )
        username = models.CharField(('username'), max_length=30, blank=True)

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None):
        user = self.create_user(
            email,
            password=password,
        )
        user.is_admin = True
        user.is_staff = True
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, models.Model):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )

    # firstname = models.CharField(max_length=50)
    # lastname = models.CharField(max_length=50)
    student_type = models.CharField(default='individual', max_length=15)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'

    objects = CustomUserManager()

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True


class UserProfile(models.Model):
    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        primary_key=True,
    )
    # preferred_name = models.CharField(max_length=100)
    image = models.ImageField(upload_to='profile-images', null=True)

    phone = models.CharField(max_length=50, null=True)
    timezone = models.CharField(max_length=50, null=True)
    location = models.CharField(max_length=60, null=True)
    linkedIn_address = models.CharField(max_length=60, null=True)
    facebook_address = models.CharField(max_length=60, null=True)

    def __str__(self):
        return f'{self.first_name} {self.last_name}'
