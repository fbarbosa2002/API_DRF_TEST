from rest_framework import serializers
from .models import Site

class TableSerializer(serializers.ModelSerializer):
    class Meta:
        model = Site
        fields = '__all__'