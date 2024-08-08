import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_property_controller.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddPropertyController controller = Get.put(AddPropertyController());
    bool isLargeScreen = Get.width > 900;
    return Scaffold(
      appBar: isLargeScreen
          ? null
          : AppBar(
              centerTitle: true,
              title: Text("Seller Dashboard"),
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 900;

            return isLargeScreen
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildFormSection(controller),
                            ),
                            SizedBox(
                              width: Get.width / 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: _buildImageSection(controller),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFormSection(controller),
                        SizedBox(height: 20),
                        _buildImageSection(controller),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _buildFormSection(AddPropertyController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.height / 80),
        Text(
          'Property Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
            'Share some of the details related to your property. This helps the user get to know the property a little better'),
        SizedBox(height: Get.height / 60),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 16, color: Colors.black),
            border: OutlineInputBorder(),
            labelText: 'Select Property Type',
          ),
          value: controller.selectedPropertyType!.value,
          onChanged: (newValue) {
            controller.selectedPropertyType!.value = newValue!;
          },
          items: controller.propertyTypes
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: Get.height / 60),
        Obx(() => Center(
              child: Text(
                controller.inputValue.value.isEmpty
                    ? 'Please enter the dimensions of your house in sq ft.'
                    : 'Entered dimensions: ${controller.inputValue.value} sq ft',
              ),
            )),
        SizedBox(height: Get.height / 60),
        SizedBox(
          height: Get.height / 15,
          child: TextField(
            style: TextStyle(fontWeight: FontWeight.normal),
            controller: controller.dimensionController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Dimensions in sq ft',
              labelStyle: TextStyle(fontSize: 16, color: Colors.black),
              hintText: 'e.g., 1200',
            ),
            onChanged: (text) {
              controller.inputValue.value = text;
            },
          ),
        ),
        SizedBox(height: Get.height / 80),
        _buildBedroomWashroomCounter(
          icon: Icons.bed_outlined,
          text: 'No. of Bedrooms: ${controller.numberOfBedrooms.value}',
          onDecrement: controller.decrementBedrooms,
          onIncrement: controller.incrementBedrooms,
        ),
        SizedBox(height: Get.height / 60),
        _buildBedroomWashroomCounter(
          icon: Icons.bathroom_outlined,
          text: 'No. of Washrooms: ${controller.numberOfWashrooms.value}',
          onDecrement: controller.decrementWashrooms,
          onIncrement: controller.incrementWashrooms,
        ),
        SizedBox(height: Get.height / 60),
        Text(
          'Furnishing',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text('Tell us about the furnishing your apartment has'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => Radio<String>(
                    value: 'Fully Furnished',
                    groupValue: controller.furnishingStatus.value,
                    onChanged: controller.setFurnishingStatus,
                  )),
              Text('Fully Furnished'),
              Obx(() => Radio<String>(
                    value: 'Semi-Furnished',
                    groupValue: controller.furnishingStatus.value,
                    onChanged: controller.setFurnishingStatus,
                  )),
              Text('Semi-Furnished'),
              Obx(() => Radio<String>(
                    value: 'Unfurnished',
                    groupValue: controller.furnishingStatus.value,
                    onChanged: controller.setFurnishingStatus,
                  )),
              Text('Unfurnished'),
            ],
          ),
        ),
        SizedBox(height: Get.height / 60),
        TextField(
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          controller: controller.descriptionController,
          decoration: InputDecoration(
            labelText: 'Description',
            labelStyle: TextStyle(
                fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        SizedBox(height: Get.height / 60),
        TextField(
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          controller: controller.priceController,
          decoration: InputDecoration(
            labelText: 'Price',
            labelStyle: TextStyle(fontSize: 16, color: Colors.black),
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: Get.height / 60),
        TextField(
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          controller: controller.locationController,
          decoration: InputDecoration(
            labelText: 'Location',
            labelStyle: TextStyle(fontSize: 16, color: Colors.black),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection(AddPropertyController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => controller.image == null
            ? Center(
                child: Text('No image selected.'),
              )
            : Image.file(controller.image!)),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.pickImage,
            child: Text(
              'Select at least One Picture',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBedroomWashroomCounter({
    required IconData icon,
    required String text,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(text),
          ],
        ),
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.remove),
                onPressed: onDecrement,
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.add),
                onPressed: onIncrement,
              ),
            ),
          ],
        )
      ],
    );
  }
}
