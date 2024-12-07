

import 'package:evera/components/ticket.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/event.dart';
import '../models/ticket.dart';

class DbEvent{

  // static Map getnEvents(){
  //   var data = Supabase.instance.client.realtime
  // }

  static Future<int> getCount() async {
    try {
      final response = await Supabase.instance.client
          .from('events').count();

      return response;
    } catch (error) {
      // print('Error getting event count: $error');
      return 0;
    }
  }

  static Future<List<Event>> fetchEvents() async {
    try {
      final response = await Supabase.instance.client
          .from('events')
          .select();

      List<Event> events=[];
      for(int i=0;i<response.length;i++){
        Map item = response[i];
        // for(var key in item.keys){
          events.add(
              Event(
                  id : item['id'],
                  title : item['title'],
                  description : item['description'],
                  place : item['place'],
                  date : item['date'],
                  startTime : item['start_time'],
                  endTime : item['end_time'],
                  type: item['event_type'],
                  imageUrl : item['image_url']
              )
          );
        // }
    }

      // print(events);
      return events;
    } catch (error) {
      // print('Error fetching events: $error');
      return [];
    }
  }

  static Future<String> getEventTitle(int id)async{
    final response = await Supabase.instance.client
        .from('events')
        .select().eq('id', id.toString());
    // print(response);
    return '';

  }

  static Future<List<ticket>> fetchRandomTickets(int n)async{

    final response = await Supabase.instance.client
        .from('tickets')
        .select().limit(n-1);

    // print(response);

    List<ticket> tickets=[];
    for(int i=0;i<n-1;i++){



      Map item = response[i];
      // for(var key in item.keys){
      getEventTitle(i);
      tickets.add(
         ticket(
             id: item['ticket_id'],
             event_id: item['event_id'],
             type: item['ticket_type'],
             price: item['price'],
             quantity: item['quantity']
         )
      );
      // }
    }

    // print(tickets);
    return tickets;

  }



}