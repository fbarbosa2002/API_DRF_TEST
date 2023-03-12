from django.urls import path
from .views import SiteGetCreate,SiteUpdateDelete
urlpatterns = [
    path('',SiteGetCreate.as_view()),
    path('<int:pk>',SiteUpdateDelete.as_view())
]