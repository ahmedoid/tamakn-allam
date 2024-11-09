import 'package:flutter/material.dart';
import 'dart:math';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  List<Map<String, dynamic>> getFakeData() {
    // Generate fake data with random scores
    final random = Random();
    return List.generate(10, (index) {
      return {
        'rank': index + 1,
        'name': [
          'محمد',
          'أحمد',
          'علي',
          'سارة',
          'فاطمة',
          'خالد',
          'منى',
          'يوسف',
          'نورة',
          'سعد'
        ][index],
        'score': random.nextInt(100) + 1,
      };
    });
  }

  // sort the data
  List<Map<String, dynamic>> sortData(List<Map<String, dynamic>> data) {
    data.sort((a, b) => b['score'].compareTo(a['score']));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fakeData = getFakeData();
    fakeData = sortData(fakeData);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('لوحة القيادة'),
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // const SizedBox(height: 20.0),
            // Image.asset('assets/images/logo.png', width: 200),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'أفضل النتائج',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: fakeData.length,
                    itemBuilder: (context, index) {
                      final data = fakeData[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.primaries[
                                data['rank'] % Colors.primaries.length],
                            child: Text(data['rank'].toString()),
                          ),
                          title: Text(data['name']),
                          subtitle: Text('نقاط: ${data['score']}'),
                          trailing: Icon(
                            data['rank'] == 1 ? Icons.star : Icons.star_border,
                            color:
                                data['rank'] == 1 ? Colors.amber : Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
