from django.urls import path

from . import views

urlpatterns = [
    path('',views.api_home),
    path('site/', views.site),
    path('table/', views.TableList.as_view()),

]