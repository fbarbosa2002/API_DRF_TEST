from django.http import JsonResponse
from .models import Site
from django.forms.models import model_to_dict
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import generics
from .serializers import TableSerializer

@api_view(['GET'])
def api_home(request, *args, **kwargs):
    return Response({"message": "Olá, essa é a sua resposta da API Django!!!"})
 
 
@api_view(['GET'])
def site(request, *args, **kwargs):
    site = Site.objects.all().order_by("?").first()
    
    data = {}
    if site:
        data = model_to_dict(site)
        # print(data)
    return Response(data)

class TableList(generics.ListAPIView):
    queryset = Site.objects.all()
    serializer_class = TableSerializer
