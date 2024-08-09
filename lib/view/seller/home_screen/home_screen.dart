import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/property_controller.dart';
import 'package:realstate/view/seller/home_screen/home_screen_controller.dart';

class SellerHomeScreen extends StatelessWidget {
  final SellerHomeController controller = Get.put(SellerHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Real Estate Ads'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: controller.addNewProperty,
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.allProperties.isEmpty) {
            return Center(child: Text('No properties found.'));
          }

          return ListView.builder(
            itemCount: propertyCntr.allProperties?.length,
            itemBuilder: (context, index) {
              final property = propertyCntr.allProperties?[index];
              return Dismissible(
                key: Key(property!.uid!),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                confirmDismiss: (direction) async {
                  return await _confirmDelete(context);
                },
                onDismissed: (direction) {
                  controller.deleteProperty(property.uid!);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: property.propertyImages != null &&
                          property.propertyImages!.isNotEmpty
                      ? Image.network(property.propertyImages![0],
                          fit: BoxFit.cover, width: 100, height: 100)
                      : Icon(Icons.home, size: 100),
                  title: Text(property.title ?? 'No Title'),
                  subtitle: Text('${property.price ?? 'No Price'} USD'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => controller.editProperty(property),
                  ),
                  onTap: () => controller.viewPropertyDetails(property),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addNewProperty,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<bool?> _confirmDelete(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Property'),
          content: Text('Are you sure you want to delete this property?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }
}
