from django.shortcuts import render

# Create your views here.
from rest_framework import generics
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from .models import Site

class PointOfInterestGeoJSONSerializer(GeoFeatureModelSerializer):
    class Meta:
        model = Site
        geo_field = 'surrounding_polygon'
        fields = ['id', 'name']

class PointOfInterestGeoJSONView(generics.ListAPIView):
    queryset = Site.objects.all()
    serializer_class = PointOfInterestGeoJSONSerializer
