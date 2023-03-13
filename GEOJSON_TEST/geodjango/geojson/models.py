# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.contrib.gis.db import models


class Site(models.Model):
    id = models.IntegerField(primary_key=True)
    surrounding_polygon = models.PolygonField()  # This field type is a guess.
    name = models.CharField(max_length=254, blank=True, null=True)
    national_site_code = models.IntegerField(unique=True, blank=True, null=True)
    country_iso = models.CharField(max_length=2, blank=True, null=True)
    parish = models.CharField(max_length=254, blank=True, null=True)
    location = models.TextField(blank=True, null=True)  # This field type is a guess.
    status_site = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'site'
