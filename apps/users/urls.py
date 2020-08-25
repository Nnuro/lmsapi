from django.urls import path, include
from rest_framework import routers
from .views import UserViewSet, UserProfileView

router = routers.SimpleRouter()
router.register(r'', UserViewSet)
# router.register(r'profile/', UserProfileView)

urlpatterns = [
    path('', include(router.urls)),
    path('<int:pk>/profile/',
         UserProfileView.as_view(), name='user-profile'),
    # path('login', CustomAuthToken.as_view()),
]
