import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/cuti_constant_finals.dart';

class LoadingRekapShimmer extends StatelessWidget {
  const LoadingRekapShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kWhite,
      highlightColor: kNeutral40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: boxShadow,
                color: kWhite,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 49,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: boxShadow,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 49,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: boxShadow,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 49,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
