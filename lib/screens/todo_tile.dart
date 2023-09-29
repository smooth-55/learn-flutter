import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  var title;
  var status;
  var id;
  var onChanged;
  var desc;

  // constructor
  TodoTile({
    super.key,
    required this.title,
    required this.status,
    required this.id,
    required this.desc,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(value: status, onChanged: onChanged),
            Container(
              width: 50,

              child: Column(
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                    style: TextStyle(
                        decoration: status ? TextDecoration.lineThrough : null,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,

                    ),
                  ),
                  if (!status)
                    Text(
                      "desc",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration: status ? TextDecoration.lineThrough : null,
                          fontSize: 13),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "...",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
