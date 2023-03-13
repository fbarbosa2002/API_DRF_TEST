from django.urls import path
from .views import PointOfInterestGeoJSONView

urlpatterns = [
    path('points-of-interest.geojson', PointOfInterestGeoJSONView.as_view(), name='points_of_interest_geojson'),
]
