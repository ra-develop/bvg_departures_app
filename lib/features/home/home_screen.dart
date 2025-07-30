import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          title: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
          ),
          onPressed: () => context.go('/search'),
          icon:
              SvgPicture.asset('assets/svg/search.svg', width: 24, height: 24),
          label: Text(
            'Search for a Station and Stop',
            style: theme.textTheme.bodyLarge,
          ),
        ),
      )),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16.0,
                children: [
                  Image.asset('assets/images/watching_eyes.png',
                      width: 48, height: 48),
                  Text(
                    'Find the best public transport connections',
                    style: theme.textTheme.displayLarge,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique.',
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text('Cupping aesthetic chambray',
                      style: theme.textTheme.titleSmall),
                  Text(
                      'Intelligentsia asymmetrical stumptown banhmi, bodega boys ugh pop-up 90`s cardigan tonx humblebrag DIY. Chicharrones DIY 8-bit gluten-free. Vibecession palo santo pickled fashion axe skateboard hoodie vapor ware vegan lumbersexual. Mumblecore celiac schlitz, DSA chambray hashtag enamel pinet hical before t hey sold out tote bag drinking vinegar hot chicken intelligentsia mukbanggorpcore.',
                      style: theme.textTheme.bodyLarge),
                  Text('Intelligentsia asymmetrical stumptown',
                      style: theme.textTheme.titleSmall),
                  Text(
                      'Chicharrones DIY 8-bit gluten-free. Vibecession palo santo pickled fashion axe skateboard hoodie vapor ware vegan lumbersexual. Mumblecore celiac schlitz',
                      style: theme.textTheme.bodyLarge),
                  Text('Cupping aesthetic chambray',
                      style: theme.textTheme.titleSmall),
                  Text(
                      'Intelligentsia asymmetrical stumptown banhmi, bodega boys ugh pop-up 90`s cardigan tonx humblebrag DIY. Chicharrones DIY 8-bit gluten-free. Vibecession palo santo pickled fashion axe skateboard hoodie vapor ware vegan lumbersexual. Mumblecore celiac schlitz, DSA chambray hashtag enamel pinet hical before t hey sold out tote bag drinking vinegar hot chicken intelligentsia mukbanggorpcore.',
                      style: theme.textTheme.bodyLarge),
                  Text('Intelligentsia asymmetrical stumptown',
                      style: theme.textTheme.titleSmall),
                  Text(
                      'Chicharrones DIY 8-bit gluten-free. Vibecession palo santo pickled fashion axe skateboard hoodie vapor ware vegan lumbersexual. Mumblecore celiac schlitz',
                      style: theme.textTheme.bodyLarge),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
