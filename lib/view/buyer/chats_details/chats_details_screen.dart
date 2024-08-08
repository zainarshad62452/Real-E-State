// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:realstate/view/buyer/chats_details/chat_detail_controller.dart';

// class ChatDetailScreen extends StatelessWidget {
//   final ChatDetailsController chatController = Get.put(ChatDetailsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFe5ddd5),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         titleSpacing: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black87),
//           onPressed: () {
//             // Handle back action
//           },
//         ),
//         title: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage('assets/images/user1.png'),
//               radius: 20,
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Rakesh',
//                   style: TextStyle(
//                     color: Colors.black87,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Active',
//                   style: TextStyle(
//                     color: Colors.green,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           // IconButton(
//           //   icon: Icon(Icons.videocam, color: Colors.black87),
//           //   onPressed: () {
//           //     // Handle video call action
//           //   },
//           // ),
//           // IconButton(
//           //   icon: Icon(Icons.call, color: Colors.black87),
//           //   onPressed: () {
//           //     // Handle voice call action
//           //   },
//           // ),
//           IconButton(
//             icon: Icon(Icons.more_vert, color: Colors.black87),
//             onPressed: () {
//               // Handle more options action
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 padding: EdgeInsets.all(10),
//                 itemCount: chatController.messagesList.length,
//                 itemBuilder: (context, index) {
//                   final message = chatController.messagesList[index];
//                   return Align(
//                     alignment: message.isSentByMe
//                         ? Alignment.centerRight
//                         : Alignment.centerLeft,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(vertical: 5),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       decoration: BoxDecoration(
//                         color: message.isSentByMe
//                             ? Color(0xFFdcf8c6)
//                             : Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           topRight: Radius.circular(15),
//                           bottomLeft:
//                               Radius.circular(message.isSentByMe ? 15 : 0),
//                           bottomRight:
//                               Radius.circular(message.isSentByMe ? 0 : 15),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: message.isSentByMe
//                             ? CrossAxisAlignment.end
//                             : CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             message.content,
//                             style: TextStyle(
//                               color: Colors.black87,
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 message.time,
//                                 style: TextStyle(
//                                   color: Colors.black45,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               if (message.isSentByMe)
//                                 Icon(
//                                   Icons.check,
//                                   size: 16,
//                                   color: message.isRead
//                                       ? Colors.blue
//                                       : Colors.grey,
//                                 ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageInput() {
//     TextEditingController _controller = TextEditingController();

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//       color: Colors.white,
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: 'Message',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.attach_file, color: Colors.grey),
//             onPressed: () {
//               // Handle attachment action
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
