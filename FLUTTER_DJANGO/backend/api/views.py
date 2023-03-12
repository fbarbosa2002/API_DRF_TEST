from django.shortcuts import render
from rest_framework import generics
from .models import Site
from .serializers import SiteSerializer

# Create your views here.

class SiteGetCreate(generics.ListCreateAPIView):
    queryset = Site.objects.all()
    serializer_class = SiteSerializer


class SiteUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = Site.objects.all()
    serializer_class = SiteSerializer
    