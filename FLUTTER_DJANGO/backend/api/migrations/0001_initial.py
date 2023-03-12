# Generated by Django 3.2.12 on 2023-03-11 18:36

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Site',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=254, null=True)),
                ('national_site_code', models.IntegerField(blank=True, null=True, unique=True)),
                ('country_iso', models.CharField(blank=True, max_length=2, null=True)),
                ('parish', models.CharField(blank=True, max_length=254, null=True)),
                ('status_site', models.CharField(blank=True, max_length=1, null=True)),
            ],
        ),
    ]
