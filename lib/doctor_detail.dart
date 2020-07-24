import 'package:example_widget_1/my_colors.dart';
import 'package:example_widget_1/my_images.dart';
import 'package:flutter/material.dart';

class DetailDoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                baseInfo,
                about,
                address,
                activity,
              ],
            ),
          ),
        ),
      ),
    );
  }

  get baseInfo {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: CustomContainer(
            height: 150,
            color: MyColors.macaroni,
            child: Image.asset(
              MyImages.avatar,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Dr. Stefeni Albert",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                Text(
                  "Heart Speailist",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Spacer(),
                Row(
                  children: <Widget>[
                    CustomContainer(
                      color: MyColors.macaroni.withOpacity(0.3),
                      child: Icon(
                        Icons.mail,
                        color: MyColors.macaroni,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomContainer(
                        color: MyColors.brinkPink.withOpacity(0.3),
                        child: Icon(
                          Icons.phone,
                          color: MyColors.brinkPink,
                          size: 25,
                        ),
                      ),
                    ),
                    CustomContainer(
                      color: MyColors.spunPearl.withOpacity(0.3),
                      child: Icon(
                        Icons.videocam,
                        color: MyColors.spunPearl,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        )
      ],
    );
  }

  get about {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "About",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(height: 16),
          Text(
            _dataAbout,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }

  get address {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AddressView(
                title: "Address",
                content: "13F Keangnam Hanoi Landmark 72 Tower, Plot E6, Pham Hung Road, Nam Tu Liem Dist., Ha Noi",
                icon: Icon(
                  Icons.location_on,
                  color: MyColors.spunPearl,
                ),
              ),
              SizedBox(height: 16),
              AddressView(
                title: "Daily Practict",
                content: "Mountain View, California, California, Hoa Kỳ",
                icon: Icon(
                  Icons.access_time,
                  color: MyColors.spunPearl,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: CustomContainer(
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                MyImages.address,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }

  get activity {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Activity",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: CustomContainer(
                color: MyColors.macaroni,
                height: 80,
                child: ActivityItem(
                  icon: Icon(
                    Icons.event_note,
                    size: 16,
                    color: Colors.white70,
                  ),
                  activityName: "List Of Schedule",
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CustomContainer(
                color: MyColors.spunPearl,
                height: 80,
                child: ActivityItem(
                  icon: Icon(
                    Icons.event_note,
                    size: 16,
                    color: Colors.white70,
                  ),
                  activityName: "Doctor's Daily Post",
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final double width;
  final double height;

  const CustomContainer({
    Key key,
    this.color = Colors.grey,
    this.width = 40,
    this.height = 40,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}

class AddressView extends StatelessWidget {
  final String title;
  final String content;
  final Icon icon;

  const AddressView({Key key, this.title = "", this.content = "", this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (icon != null) ...[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: icon,
          ),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                content,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String activityName;
  final Icon icon;

  const ActivityItem({Key key, this.activityName = "", this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null)
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white38,
              ),
              child: icon,
            ),
          Expanded(
            child: Text(
              activityName,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

final _dataAbout =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
    " The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',"
    " making it look like readable English.";
