from django.shortcuts import render
from rest_framework import serializers, viewsets
from django.contrib.auth import get_user_model

from .models import User, UserProfile
# # Create your views here.
from rest_framework.views import APIView
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated, DjangoModelPermissions
from rest_framework.response import Response

from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required


from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from .tokens import account_activation_token
from django.http import HttpResponse

from django.core.mail import send_mail
from config import settings
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode


@api_view(["GET"])
@csrf_exempt
@permission_classes([IsAuthenticated])
def welcome(request):
    content = {"message": "Welcome to the To the LMS API!"}
    return JsonResponse(content)


def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        content = {"message": "Your account has been confirmed"}
        return JsonResponse(content)
    else:
        content = {"message": "Your account acitvation is invalid"}
        return JsonResponse(content)


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ('id', 'firstname', 'lastname', 'email', 'password', 'student_type')
        extra_kwargs = {'password': {'write_only': True, 'min_length': 8}}

    def create(self, validated_data):
        is_student = validated_data.pop('student_type')
        user = get_user_model().objects.create_user(**validated_data)
        user.is_student = is_student
        user.is_active = False  # Deactivate account till it is confirmed

        user.save()

        current_site = '127.0.0.1'

        subject = 'Activate Your LMS Account'
        message = {
            'user': user,
            'domain': current_site,
            'uid': urlsafe_base64_encode(force_bytes(user.pk)),
            'token': account_activation_token.make_token(user),
        }
        # user.email_user(subject, message)

        email_from = settings.EMAIL_HOST_USER
        send_mail(
            subject,
            # 'Please Activate your account' + message.token,
            'http://127.0.0.1:8000/accounts/activate/' + \
            message['uid'] + '/' + message['token'] + '/',
            email_from,
            [user.email],
            fail_silently=False
        )
        message_content = {
            "message": "Please Confirm your email to complete registration."}

        return user


class UserProfileSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(
        queryset=get_user_model().objects.all())

    class Meta:
        model = UserProfile
        fields = ('__all__')


# @permission_classes([IsAuthenticated])
# @api_view(["GET", "POST"])
# @csrf_exempt
# @permission_classes([IsAuthenticated])
class UserViewSet(viewsets.ModelViewSet):
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer


# @permission_classes([IsAuthenticated])
# @api_view(["GET", "POST", "PUT"])
# @csrf_exempt
# @permission_classes([IsAuthenticated])
class UserProfileView(APIView):
    def get(self, request, pk):
        profile = UserProfile.objects.get(user=request.user)
        serializer = UserProfileSerializer(profile)
        return Response(serializer.data)

# class BadgeSerializer(serializers.ModelSerializer):
#     project = serializers.PrimaryKeyRelatedField(
#         queryset=Project.objects.all())
#     student = serializers.PrimaryKeyRelatedField(
#         queryset=get_user_model().objects.all())

#     class Meta:
#         model = StudentSubmission
#         fields = ('id', 'project', 'student',
#                   'url', 'feedback', 'approved')
#         read_only_fields = ['feedback', 'approved']
