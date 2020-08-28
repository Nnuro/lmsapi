from django_rest_passwordreset.signals import reset_password_token_created
from django.urls import reverse
from django.template.loader import render_to_string
from django.dispatch import receiver
from django.core.mail import EmailMultiAlternatives
from rest_framework import serializers, viewsets
from django.contrib.auth import get_user_model

from .models import User, UserProfile
# # Create your views here.
from rest_framework.views import APIView
from rest_framework.response import Response

from django.http import JsonResponse


from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from .tokens import account_activation_token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required

from django.core.mail import send_mail
from config import settings
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode

from rest_framework import status
from rest_framework import generics
from rest_framework.response import Response
from django.contrib.auth import get_user_model
from .serializers import ChangePasswordSerializer



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
        fields = ('id', #'firstname', 'lastname',
                  'email', 'password', 'student_type')
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


@permission_classes([IsAuthenticated])
class UserViewSet(viewsets.ModelViewSet):
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer



@permission_classes([IsAuthenticated])
class UserProfileView(APIView):
    def get(self, request, pk):
        profile = UserProfile.objects.get(user=request.user)
        serializer = UserProfileSerializer(profile)
        return Response(serializer.data)

# ==================================================

            #CHANGE PASSWORD

# ==================================================

class ChangePasswordView(generics.UpdateAPIView):
    """
    An endpoint for changing password.
    """
    serializer_class = ChangePasswordSerializer
    model = User
    permission_classes = (IsAuthenticated,)

    def get_object(self, queryset=None):
        obj = self.request.user
        return obj

    def update(self, request, *args, **kwargs):
        self.object = self.get_object()
        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid():
            # Check old password
            if not self.object.check_password(serializer.data.get("old_password")):
                return Response({"old_password": ["Wrong password."]}, status=status.HTTP_400_BAD_REQUEST)
            # set_password also hashes the password that the user will get
            self.object.set_password(serializer.data.get("new_password"))
            self.object.save()
            response = {
                'status': 'success',
                'code': status.HTTP_200_OK,
                'message': 'Password updated successfully',
                'data': []
            }

            return Response(response)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


User = get_user_model()

@receiver(reset_password_token_created)
def password_reset_token_created(sender, instance, reset_password_token, *args, **kwargs):
    """
    Handles password reset tokens
    When a token is created, an e-mail needs to be sent to the user
    :param sender: View Class that sent the signal
    :param instance: View Instance that sent the signal
    :param reset_password_token: Token Model Object
    :param args:
    :param kwargs:
    :return:
    """
    # send an e-mail to the user
    # context = {
    #     'current_user': reset_password_token.user,
    #     # 'username': reset_password_token.user.email,
    #     'email': reset_password_token.user.email,
    #     'reset_password_url': "{}?token={}".format(reverse('password_reset:reset-password-request'), reset_password_token.key)
    # }

    email_plaintext_message = "{}?token={}".format(reverse('password_reset:reset-password-request'), reset_password_token.key)
    # render email text
    # email_html_message = render_to_string(
    #     'email/user_reset_password.html', context)
    # email_plaintext_message = render_to_string(
    #     'email/user_reset_password.txt', context)

    # msg = EmailMultiAlternatives(
    #     # title:
    #     "Password Reset for {title}".format(title="Some website title"),
    #     # message:
    #     email_plaintext_message,
    #     # from:
    #     "noreply@somehost.local",
    #     # to:
    #     [reset_password_token.user.email]
    # )
    # msg.attach_alternative(email_html_message, "text/html")
    # msg.send()

    current_site = '127.0.0.1'

    subject = "Password Reset for {title}".format(title="LiTT LMS"),
    # message = {
    #     'user': reset_password_token.user,
    #     'domain': current_site,
    #     'uid': urlsafe_base64_encode(force_bytes(reset_password_token.user.pk)),
    #     'token': account_activation_token.make_token(reset_password_token.user),
    # }
    
    email_from = settings.EMAIL_HOST_USER
    send_mail(
        subject,
        # 'Please Activate your account' + message.token,
        email_plaintext_message,
        'no-reply@gmail.com',
        [reset_password_token.user.email],
        fail_silently=False
    )
