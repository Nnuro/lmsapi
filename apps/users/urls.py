from django.urls import path, include
from rest_framework import routers

from .views import UserViewSet, UserProfileView #, ChangePasswordView

router = routers.SimpleRouter()
router.register(r'', UserViewSet)
# router.register(r'profile/', UserProfileView)

urlpatterns = [
    path('', include(router.urls)),
    path('<int:pk>/profile/',
         UserProfileView.as_view(), name='user-profile'),

    # ========================#
    # Create change password
    # ========================#
    
    #path('change-password/', ChangePasswordView.as_view(), name='change-password'),

    # path('login', CustomAuthToken.as_view()),
]
