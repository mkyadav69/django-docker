# from django.shortcuts import render

# # Create your views here.
# # pages/views.py
# from django.http import HttpResponse


# def homePageView(request):
#     return HttpResponse('tested, successfully!')


# django/views.py
from django.views.generic import TemplateView

class HomePageView(TemplateView):
    template_name = 'home.html'

class AboutPageView(TemplateView):
    template_name = 'about.html'