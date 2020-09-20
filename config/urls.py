from django.contrib import admin
from django.urls import path, include, reverse_lazy
from apps.users import views
from apps.users.views import activate, UserProfileView, CurrentUserView
from django.conf import settings

from rest_framework_simplejwt.views import (TokenObtainPairView, TokenRefreshView)

from django.contrib.auth import views as auth_views
    
app_name = 'app.users'

urlpatterns = [
    # Auth Tokens
    path('api-token/', TokenObtainPairView.as_view()),
    path('api-token-refresh/', TokenRefreshView.as_view()),

    # Admin Dashboard
    path('admin/', admin.site.urls),

    # User data (login and reg, userlist)
    path('api/users/', include('apps.users.urls')), # Get all users

    # Course data
    path('api/courses/', include('apps.courses.urls')), #Get all courses

    # Course data
    path('api/modules/', include('apps.course_modules.urls')), #Get all courses

    # Lesson data
    path('api/lessons/', include('apps.lessons.urls')), #Get all lessons

    # Cert data
    path('api/certificates/', include('apps.certificate.urls')), # Get all certificates

    # Badge data
    path('api/badge/', include('apps.badge.urls')), #Get all badges

    # Account activation
    path('accounts/activate/<slug:uidb64>/<slug:token>/', activate, name='activate'), # Activate your account via email

    # Register a user (unused)
    path('api/register/', include('rest_auth.registration.urls')), # Register an account unused

    # User Update Profile info
    path('api/profile/update', UserProfileView.as_view(), name='update profile'), # Update Profile

    # User Update Profile info
    path('api/current', CurrentUserView.as_view(), name='current profile'), # Update Profile

    # Forgot password
    path('api/password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),

    path('', include('rest_auth.urls')),
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        path('__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns
