import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isExpanded = false;
  final String text =
      'DeepSeek AI is a cutting-edge artificial intelligence research and development initiative focused on pushing the boundaries of natural language processing (NLP), deep learning, and machine learning. With a commitment to innovation, it develops state-of-the-art AI models that enhance comprehension, reasoning, and decision-making capabilities. DeepSeek AI aims to bridge the gap between human intelligence and artificial intelligence by building more efficient, scalable, and context-aware systems. By leveraging massive datasets, high-performance computing, and novel AI architectures, DeepSeek AI is at the forefront of breakthroughs in AI-driven solutions for diverse applications, including conversational agents, content generation, code understanding, and real-time decision support.';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/post-elements/logo-post.webp',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tech News World',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '41 minutes ago',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        minimumSize: Size(80, 35),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Subscribe',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert_rounded, size: 20),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            LayoutBuilder(
              builder: (context, constraints) {
                final TextPainter textPainter = TextPainter(
                  text: TextSpan(
                    text: text,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                  maxLines: 6,
                  textDirection: TextDirection.ltr,
                )..layout(maxWidth: constraints.maxWidth);

                if (textPainter.didExceedMaxLines && !isExpanded) {
                  // Get the cutoff index for the last visible character before truncation
                  final cutoffIndex =
                      textPainter.getPositionForOffset(Offset(constraints.maxWidth - 60, 0)).offset;

                  return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: text.substring(0, cutoffIndex) + '... ',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = true;
                              });
                            },
                            child: Text(
                              'Read More',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: text,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                        if (isExpanded)
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = false;
                                });
                              },
                              child: Text(
                                ' Read Less',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }
              },
            ),
            Image.asset('assets/images/post-elements/image-post.webp'),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_outlined)),
                    Text('35'),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt_outlined))
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.send)),
                    Text('35'),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt_outlined))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
