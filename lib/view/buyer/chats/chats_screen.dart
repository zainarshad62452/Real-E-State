// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:realstate/view/buyer/chats/chats_controller.dart';

// class ChatScreen extends StatelessWidget {
//   final ChatController chatController = Get.put(ChatController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Messenger',
//           style: TextStyle(
//             color: Colors.black87,
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black87),
//           onPressed: () {
//             // Handle back button action
//           },
//         ),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           padding: EdgeInsets.symmetric(vertical: 8),
//           itemCount: chatController.chatList.length,
//           itemBuilder: (context, index) {
//             final chat = chatController.chatList[index];
//             return Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade100,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: ListTile(
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                   leading: CircleAvatar(
//                     backgroundImage: AssetImage(chat.imageUrl),
//                     radius: 28,
//                   ),
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         chat.name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         chat.time,
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                   subtitle: Padding(
//                     padding: const EdgeInsets.only(top: 4.0),
//                     child: Text(
//                       chat.isTyping ? 'Typing...' : chat.message,
//                       style: TextStyle(
//                         color: chat.isTyping ? Colors.blue : Colors.black54,
//                         fontStyle:
//                             chat.isTyping ? FontStyle.italic : FontStyle.normal,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   trailing: chat.unreadCount > 0
//                       ? Container(
//                           padding: EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Text(
//                             chat.unreadCount.toString(),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                         )
//                       : SizedBox.shrink(),
//                   onTap: () {
//                     Get.toNamed("/chats-detail");
//                     // Handle chat tap
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
