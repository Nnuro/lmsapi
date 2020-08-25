"""LMSAPI URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from apps.users import views
from apps.users.views import activate, UserProfileView
# from apps.users.views import ConfirmEmailView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/lms/users/', include('apps.users.urls')), # Get all users
    path('api/lms/courses/', include('apps.courses.urls')), #Get all coursers
    path('api/lms/certificates/', include('apps.certificate.urls')), # Get all certificates
    path('api/lms/badge/', include('apps.badge.urls')), #Get all badges
    path('accounts/activate/<slug:uidb64>/<slug:token>/', activate, name='activate'), # Activate your account via email
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')), # Defualt rest authentication
    path('', include('rest_auth.urls')),
    path('api/lms/register/', include('rest_auth.registration.urls')), # Register an account unused
    # path('api/lms/profile/update', UserProfileView.as_view(), name='update profile'), # Register an account unused
]

