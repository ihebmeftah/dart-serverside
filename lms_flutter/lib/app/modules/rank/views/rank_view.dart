import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/component/appdropdown.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';

import '../../../component/appelevatedbutton.dart';
import '../../../component/apptextformfield.dart';
import '../controllers/rank_controller.dart';

class RankView extends GetView<RankController> {
  const RankView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Form(
                  key: controller.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextFormField(
                          controller: controller.rankname,
                          label: "Rank name",
                          hint: "e.g: Rank 1"),
                      20.spaceH,
                      AppDropdown(
                          value: controller.selectedRankLevel,
                          label: "Rank level",
                          hint: "e.g: 1",
                          onChange: controller.selectLevel,
                          items: controller.ranklevel
                              .map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.toString())))
                              .toList()),
                      20.spaceH,
                      Row(
                        children: [
                          Expanded(
                            child: AppTextFormField(
                              controller: controller.rankmin,
                              keyboardType: TextInputType.number,
                              label: "Rank min points",
                              hint: "eg: 0",
                            ),
                          ),
                          20.spaceW,
                          Expanded(
                            child: AppTextFormField(
                              controller: controller.rankmax,
                              keyboardType: TextInputType.number,
                              label: "Rank max points",
                              hint: "eg: 100",
                            ),
                          )
                        ],
                      ),
                      40.spaceH,
                      AppElevatedButton(
                        title: "ADD ",
                        onPressed: controller.createRank,
                      )
                    ],
                  )),
            ),
          ),
          Expanded(
            child: controller.obx(
              (state) => ListView.builder(
                  itemCount: controller.ranks.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                            "${controller.ranks[index].name} (${controller.ranks[index].level})"),
                        subtitle: Text(
                            "${controller.ranks[index].minpoints} ${controller.ranks[index].maxpoints}"),
                        trailing: IconButton(
                          onPressed: () => controller
                              .deleteRank(controller.ranks[index].id!),
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      )),
              onEmpty: const Center(child: Text("No ranks found")),
              onError: (error) => Text(
                error.toString(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
