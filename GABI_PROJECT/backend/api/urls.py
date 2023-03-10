from django.urls import path
from rest_framework.decorators import api_view
from rest_framework.response import Response
from . import views

urlpatterns = [
    path('', views.api_home),   # localhost:8000/api/
    path('site/', views.site)
]