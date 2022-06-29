import 'package:flutter/material.dart';

class HospitalsList with ChangeNotifier {
  final List _hospitalsList = [
    {
      'logo': 'https://picsum.photos/500/300?random=11',
      'name': 'Kiran Hospital',
      'category': 'Homeopathy',
      'rating': '4.2',
      'area': 'Katargam',
      'city': 'Surat',
      'images': [
        'https://picsum.photos/500/300?random=21',
        'https://picsum.photos/500/300?random=22',
        'https://picsum.photos/500/300?random=23',
        'https://picsum.photos/500/300?random=24',
        'https://picsum.photos/500/300?random=25',
      ],
      'aboutus': {
        'time': {
          'Sunday': '9:00 AM to 6:00 PM',
          'Monday': '9:00 AM to 9:00 PM',
          'Tuesday': '9:00 AM to 9:00 PM',
          'Wednesday': '9:00 AM to 9:00 PM',
          'Thursday': '9:00 AM to 9:00 PM',
          'Friday': '9:00 AM to 9:00 PM',
          'Saturday': '9:00 AM to 8:00 PM',
        },
        'service':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat. Praesent aliquam at nisl nec tincidunt. Nulla vestibulum ipsum et orci tincidunt, at tempor eros dictum. Aliquam erat volutpat. Cras aliquam finibus',
        'doctorList': [
          {
            'img': 'https://picsum.photos/500/300?random=1',
            'name': 'Dr. Jeremy Stone',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=2',
            'name': 'Dr. Peter Leavitt',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=3',
            'name': 'Dr. Mark Hall',
            'edu': 'B.H.M.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=4',
            'name': 'Dr. Charles Burton',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=5',
            'name': 'Dr. Edward George Armstrong',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=6',
            'name': 'Dr. Finlay',
            'edu': 'B.H.M.S',
          },
        ],
      },
      'review': [
        {
          'authorName': 'User1',
          'authorImage': 'https://picsum.photos/500/300?random=51',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.5',
        },
        {
          'authorName': 'User2',
          'authorImage': 'https://picsum.photos/500/300?random=52',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.7',
        },
        {
          'authorName': 'User3',
          'authorImage': 'https://picsum.photos/500/300?random=53',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '3.7',
        },
        {
          'authorName': 'User4',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User5',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User6',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User7',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User8',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
      ],
      'call': '1234567890',
      'location': {
        'lat': '21.218716735740884',
        'lng': '72.83674673845448',
      },
    },
    {
      'logo': 'https://picsum.photos/500/300?random=12',
      'name': 'Civil Hospital',
      'category': 'Allopathy',
      'rating': '4.5',
      'area': 'Majura',
      'city': 'Surat',
      'images': [
        'https://picsum.photos/500/300?random=21',
        'https://picsum.photos/500/300?random=22',
        'https://picsum.photos/500/300?random=23',
        'https://picsum.photos/500/300?random=24',
        'https://picsum.photos/500/300?random=25',
      ],
      'aboutus': {
        'time': {
          'Sunday': '9:00 AM to 6:00 PM',
          'Monday': '9:00 AM to 9:00 PM',
          'Tuesday': '9:00 AM to 9:00 PM',
          'Wednesday': '9:00 AM to 9:00 PM',
          'Thursday': '9:00 AM to 9:00 PM',
          'Friday': '9:00 AM to 9:00 PM',
          'Saturday': '9:00 AM to 8:00 PM',
        },
        'service':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat. Praesent aliquam at nisl nec tincidunt. Nulla vestibulum ipsum et orci tincidunt, at tempor eros dictum. Aliquam erat volutpat. Cras aliquam finibus',
        'doctorList': [
          {
            'img': 'https://picsum.photos/500/300?random=1',
            'name': 'Dr. Jeremy Stone',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=2',
            'name': 'Dr. Peter Leavitt',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=3',
            'name': 'Dr. Mark Hall',
            'edu': 'B.H.M.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=4',
            'name': 'Dr. Charles Burton',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=5',
            'name': 'Dr. Edward George Armstrong',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=6',
            'name': 'Dr. Finlay',
            'edu': 'B.H.M.S',
          },
        ],
      },
      'review': [
        {
          'authorName': 'User1',
          'authorImage': 'https://picsum.photos/500/300?random=51',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.5',
        },
        {
          'authorName': 'User2',
          'authorImage': 'https://picsum.photos/500/300?random=52',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.7',
        },
        {
          'authorName': 'User3',
          'authorImage': 'https://picsum.photos/500/300?random=53',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '3.7',
        },
        {
          'authorName': 'User4',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User5',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User6',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
      ],
      'call': '1234567890',
      'location': {
        'lat': '21.179132152586778',
        'lng': '72.82163003974546',
      },
    },
    {
      'logo': 'https://picsum.photos/500/300?random=13',
      'name': 'P.P.Savani Hospital',
      'category': 'Homeopathy',
      'rating': '3.2',
      'area': 'Kapodra',
      'city': 'Surat',
      'images': [
        'https://picsum.photos/500/300?random=21',
        'https://picsum.photos/500/300?random=22',
        'https://picsum.photos/500/300?random=23',
        'https://picsum.photos/500/300?random=24',
        'https://picsum.photos/500/300?random=25',
      ],
      'aboutus': {
        'time': {
          'Sunday': '9:00 AM to 6:00 PM',
          'Monday': '9:00 AM to 9:00 PM',
          'Tuesday': '9:00 AM to 9:00 PM',
          'Wednesday': '9:00 AM to 9:00 PM',
          'Thursday': '9:00 AM to 9:00 PM',
          'Friday': '9:00 AM to 9:00 PM',
          'Saturday': '9:00 AM to 8:00 PM',
        },
        'service':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat. Praesent aliquam at nisl nec tincidunt. Nulla vestibulum ipsum et orci tincidunt, at tempor eros dictum. Aliquam erat volutpat. Cras aliquam finibus',
        'doctorList': [
          {
            'img': 'https://picsum.photos/500/300?random=1',
            'name': 'Dr. Jeremy Stone',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=2',
            'name': 'Dr. Peter Leavitt',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=3',
            'name': 'Dr. Mark Hall',
            'edu': 'B.H.M.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=4',
            'name': 'Dr. Charles Burton',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=5',
            'name': 'Dr. Edward George Armstrong',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=6',
            'name': 'Dr. Finlay',
            'edu': 'B.H.M.S',
          },
        ],
      },
      'review': [
        {
          'authorName': 'User1',
          'authorImage': 'https://picsum.photos/500/300?random=51',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.5',
        },
        {
          'authorName': 'User2',
          'authorImage': 'https://picsum.photos/500/300?random=52',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.7',
        },
        {
          'authorName': 'User3',
          'authorImage': 'https://picsum.photos/500/300?random=53',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '3.7',
        },
        {
          'authorName': 'User4',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User5',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User6',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
      ],
      'call': '1234567890',
      'location': {
        'lat': '21.22214841858378',
        'lng': '72.87430914160139',
      },
    },
    {
      'logo': 'https://picsum.photos/500/300?random=14',
      'name': 'Surat Hospital',
      'category': 'Ayurvedic',
      'rating': '2.5',
      'area': 'Katargam',
      'city': 'Surat',
      'images': [
        'https://picsum.photos/500/300?random=21',
        'https://picsum.photos/500/300?random=22',
        'https://picsum.photos/500/300?random=23',
        'https://picsum.photos/500/300?random=24',
        'https://picsum.photos/500/300?random=25',
      ],
      'aboutus': {
        'time': {
          'Sunday': '9:00 AM to 6:00 PM',
          'Monday': '9:00 AM to 9:00 PM',
          'Tuesday': '9:00 AM to 9:00 PM',
          'Wednesday': '9:00 AM to 9:00 PM',
          'Thursday': '9:00 AM to 9:00 PM',
          'Friday': '9:00 AM to 9:00 PM',
          'Saturday': '9:00 AM to 8:00 PM',
        },
        'service':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat. Praesent aliquam at nisl nec tincidunt. Nulla vestibulum ipsum et orci tincidunt, at tempor eros dictum. Aliquam erat volutpat. Cras aliquam finibus',
        'doctorList': [
          {
            'img': 'https://picsum.photos/500/300?random=1',
            'name': 'Dr. Jeremy Stone',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=2',
            'name': 'Dr. Peter Leavitt',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=3',
            'name': 'Dr. Mark Hall',
            'edu': 'B.H.M.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=4',
            'name': 'Dr. Charles Burton',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=5',
            'name': 'Dr. Edward George Armstrong',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=6',
            'name': 'Dr. Finlay',
            'edu': 'B.H.M.S',
          },
        ],
      },
      'review': [
        {
          'authorName': 'User1',
          'authorImage': 'https://picsum.photos/500/300?random=51',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.5',
        },
        {
          'authorName': 'User2',
          'authorImage': 'https://picsum.photos/500/300?random=52',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.7',
        },
        {
          'authorName': 'User3',
          'authorImage': 'https://picsum.photos/500/300?random=53',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '3.7',
        },
        {
          'authorName': 'User4',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User5',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User6',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
      ],
      'call': '1234567890',
      'location': 'https://goo.gl/maps/KuAiGKdGfRXVPDUw7',
    },
    {
      'logo': 'https://picsum.photos/500/300?random=15',
      'name': 'Diamond Hospital',
      'category': 'Naturopathy',
      'rating': '3.2',
      'area': 'Kathor',
      'city': 'Surat',
      'images': [
        'https://picsum.photos/500/300?random=21',
        'https://picsum.photos/500/300?random=22',
        'https://picsum.photos/500/300?random=23',
        'https://picsum.photos/500/300?random=24',
        'https://picsum.photos/500/300?random=25',
      ],
      'aboutus': {
        'time': {
          'Sunday': '9:00 AM to 6:00 PM',
          'Monday': '9:00 AM to 9:00 PM',
          'Tuesday': '9:00 AM to 9:00 PM',
          'Wednesday': '9:00 AM to 9:00 PM',
          'Thursday': '9:00 AM to 9:00 PM',
          'Friday': '9:00 AM to 9:00 PM',
          'Saturday': '9:00 AM to 8:00 PM',
        },
        'service':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat. Praesent aliquam at nisl nec tincidunt. Nulla vestibulum ipsum et orci tincidunt, at tempor eros dictum. Aliquam erat volutpat. Cras aliquam finibus',
        'doctorList': [
          {
            'img': 'https://picsum.photos/500/300?random=1',
            'name': 'Dr. Jeremy Stone',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=2',
            'name': 'Dr. Peter Leavitt',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=3',
            'name': 'Dr. Mark Hall',
            'edu': 'B.H.M.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=4',
            'name': 'Dr. Charles Burton',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=5',
            'name': 'Dr. Edward George Armstrong',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=6',
            'name': 'Dr. Finlay',
            'edu': 'B.H.M.S',
          },
        ],
      },
      'review': [
        {
          'authorName': 'User1',
          'authorImage': 'https://picsum.photos/500/300?random=51',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.5',
        },
        {
          'authorName': 'User2',
          'authorImage': 'https://picsum.photos/500/300?random=52',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.7',
        },
        {
          'authorName': 'User3',
          'authorImage': 'https://picsum.photos/500/300?random=53',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '3.7',
        },
        {
          'authorName': 'User4',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User5',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User6',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
      ],
      'call': '1234567890',
      'location': {
        'lat': '21.218716735740884',
        'lng': '72.83674673845448',
      },
    },
    {
      'logo': 'https://picsum.photos/500/300?random=16',
      'name': 'Civil Hospital',
      'category': 'Allopathy',
      'rating': '5',
      'area': 'Kosad',
      'city': 'Surat',
      'images': [
        'https://picsum.photos/500/300?random=21',
        'https://picsum.photos/500/300?random=22',
        'https://picsum.photos/500/300?random=23',
        'https://picsum.photos/500/300?random=24',
        'https://picsum.photos/500/300?random=25',
      ],
      'aboutus': {
        'time': {
          'Sunday': '9:00 AM to 6:00 PM',
          'Monday': '9:00 AM to 9:00 PM',
          'Tuesday': '9:00 AM to 9:00 PM',
          'Wednesday': '9:00 AM to 9:00 PM',
          'Thursday': '9:00 AM to 9:00 PM',
          'Friday': '9:00 AM to 9:00 PM',
          'Saturday': '9:00 AM to 8:00 PM',
        },
        'service':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat. Praesent aliquam at nisl nec tincidunt. Nulla vestibulum ipsum et orci tincidunt, at tempor eros dictum. Aliquam erat volutpat. Cras aliquam finibus',
        'doctorList': [
          {
            'img': 'https://picsum.photos/500/300?random=1',
            'name': 'Dr. Jeremy Stone',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=2',
            'name': 'Dr. Peter Leavitt',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=3',
            'name': 'Dr. Mark Hall',
            'edu': 'B.H.M.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=4',
            'name': 'Dr. Charles Burton',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=5',
            'name': 'Dr. Edward George Armstrong',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=6',
            'name': 'Dr. Finlay',
            'edu': 'B.H.M.S',
          },
        ],
      },
      'review': [
        {
          'authorName': 'User1',
          'authorImage': 'https://picsum.photos/500/300?random=51',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.5',
        },
        {
          'authorName': 'User2',
          'authorImage': 'https://picsum.photos/500/300?random=52',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.7',
        },
        {
          'authorName': 'User3',
          'authorImage': 'https://picsum.photos/500/300?random=53',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '3.7',
        },
        {
          'authorName': 'User4',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User5',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User6',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
      ],
      'call': '1234567890',
      'location': 'https://goo.gl/maps/KuAiGKdGfRXVPDUw7',
    },
    {
      'logo': 'https://picsum.photos/500/300?random=17',
      'name': 'Kiran Hospital',
      'category': 'Homeopathy',
      'rating': '3.2',
      'area': 'Laskana',
      'city': 'Surat',
      'images': [
        'https://picsum.photos/500/300?random=21',
        'https://picsum.photos/500/300?random=22',
        'https://picsum.photos/500/300?random=23',
        'https://picsum.photos/500/300?random=24',
        'https://picsum.photos/500/300?random=25',
      ],
      'aboutus': {
        'time': {
          'Sunday': '9:00 AM to 6:00 PM',
          'Monday': '9:00 AM to 9:00 PM',
          'Tuesday': '9:00 AM to 9:00 PM',
          'Wednesday': '9:00 AM to 9:00 PM',
          'Thursday': '9:00 AM to 9:00 PM',
          'Friday': '9:00 AM to 9:00 PM',
          'Saturday': '9:00 AM to 8:00 PM',
        },
        'service':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat. Praesent aliquam at nisl nec tincidunt. Nulla vestibulum ipsum et orci tincidunt, at tempor eros dictum. Aliquam erat volutpat. Cras aliquam finibus',
        'doctorList': [
          {
            'img': 'https://picsum.photos/500/300?random=1',
            'name': 'Dr. Jeremy Stone',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=2',
            'name': 'Dr. Peter Leavitt',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=3',
            'name': 'Dr. Mark Hall',
            'edu': 'B.H.M.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=4',
            'name': 'Dr. Charles Burton',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=5',
            'name': 'Dr. Edward George Armstrong',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=6',
            'name': 'Dr. Finlay',
            'edu': 'B.H.M.S',
          },
        ],
      },
      'review': [
        {
          'authorName': 'User1',
          'authorImage': 'https://picsum.photos/500/300?random=51',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.5',
        },
        {
          'authorName': 'User2',
          'authorImage': 'https://picsum.photos/500/300?random=52',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.7',
        },
        {
          'authorName': 'User3',
          'authorImage': 'https://picsum.photos/500/300?random=53',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '3.7',
        },
        {
          'authorName': 'User4',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User5',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User6',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
      ],
      'call': '1234567890',
      'location': {
        'lat': '21.218716735740884',
        'lng': '72.83674673845448',
      },
    },
    {
      'logo': 'https://picsum.photos/500/300?random=18',
      'name': 'Civil Hospital',
      'category': 'Allopathy',
      'rating': '5',
      'area': 'Kapodra',
      'city': 'Surat',
      'images': [
        'https://picsum.photos/500/300?random=21',
        'https://picsum.photos/500/300?random=22',
        'https://picsum.photos/500/300?random=23',
        'https://picsum.photos/500/300?random=24',
        'https://picsum.photos/500/300?random=25',
      ],
      'aboutus': {
        'time': {
          'Sunday': '9:00 AM to 6:00 PM',
          'Monday': '9:00 AM to 9:00 PM',
          'Tuesday': '9:00 AM to 9:00 PM',
          'Wednesday': '9:00 AM to 9:00 PM',
          'Thursday': '9:00 AM to 9:00 PM',
          'Friday': '9:00 AM to 9:00 PM',
          'Saturday': '9:00 AM to 8:00 PM',
        },
        'service':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat. Praesent aliquam at nisl nec tincidunt. Nulla vestibulum ipsum et orci tincidunt, at tempor eros dictum. Aliquam erat volutpat. Cras aliquam finibus',
        'doctorList': [
          {
            'img': 'https://picsum.photos/500/300?random=1',
            'name': 'Dr. Jeremy Stone',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=2',
            'name': 'Dr. Peter Leavitt',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=3',
            'name': 'Dr. Mark Hall',
            'edu': 'B.H.M.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=4',
            'name': 'Dr. Charles Burton',
            'edu': 'M.B.B.S',
          },
          {
            'img': 'https://picsum.photos/500/300?random=5',
            'name': 'Dr. Edward George Armstrong',
            'edu': 'Dentist',
          },
          {
            'img': 'https://picsum.photos/500/300?random=6',
            'name': 'Dr. Finlay',
            'edu': 'B.H.M.S',
          },
        ],
      },
      'review': [
        {
          'authorName': 'User1',
          'authorImage': 'https://picsum.photos/500/300?random=51',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.5',
        },
        {
          'authorName': 'User2',
          'authorImage': 'https://picsum.photos/500/300?random=52',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.7',
        },
        {
          'authorName': 'User3',
          'authorImage': 'https://picsum.photos/500/300?random=53',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '3.7',
        },
        {
          'authorName': 'User4',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User5',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
        {
          'authorName': 'User6',
          'authorImage': 'https://picsum.photos/500/300?random=54',
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at euismod augue. Vivamus accumsan lorem vitae commodo volutpat.',
          'rating': '4.9',
        },
      ],
      'call': '1234567890',
      'location': 'https://goo.gl/maps/KuAiGKdGfRXVPDUw7',
    },
  ];

  List get getList {
    return _hospitalsList;
  }

  int get getLength {
    return _hospitalsList.length;
  }
}
