import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:flutter/material.dart';

class ItemsListPreview extends StatefulWidget {
  const ItemsListPreview({
    super.key,
    required this.clothingItems,
  });
  final List<String> clothingItems;

  @override
  // ignore: library_private_types_in_public_api
  _ItemsListPreviewState createState() => _ItemsListPreviewState();
}

class _ItemsListPreviewState extends State<ItemsListPreview> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    // Trigger the animation for each item after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < widget.clothingItems.length; i++) {
        _listKey.currentState?.insertItem(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      initialItemCount: widget.clothingItems.length,
      itemBuilder: (context, index, animation) {
        if (index >= widget.clothingItems.length) {
          return const SizedBox
              .shrink(); // Return an empty widget if index is out of bounds
        }
        return _buildItem(widget.clothingItems[index], animation);
      },
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0), // Slide from the left
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut, // Smooth slide
        ),
      ),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.5, // Start scaled down
          end: 1.0, // End at normal size
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut, // Bouncy scaling effect
          ),
        ),
        child: FadeTransition(
          opacity: Tween<double>(
            begin: 0.0, // Start fully transparent
            end: 1.0, // End fully opaque
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManger.greyCustom,
                      ),
                      child: const Icon(
                        color: ColorManger.customGrey2,
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
