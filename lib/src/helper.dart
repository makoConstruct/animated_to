import 'package:animated_to/src/action.dart';
import 'package:flutter/rendering.dart';

/// cached values for calculation
class OffsetCache {
  OffsetCache({
    this.startOffset,
    this.lastOffset,
    this.lastGlobalOffset,
    this.lastBoundaryOffset,
    this.lastAncestorGlobalOffset,
    this.lastReferenceGlobalOffset,
    this.lastAncestorReferenceGlobalOffset,
  });

  final Offset? startOffset;
  final Offset? lastOffset;
  final Offset? lastGlobalOffset;
  final Offset? lastBoundaryOffset;
  final Offset? lastAncestorGlobalOffset;
  final Offset? lastReferenceGlobalOffset;
  final Offset? lastAncestorReferenceGlobalOffset;

  OffsetCache copyWith({
    Offset? startOffset,
    Offset? lastOffset,
    Offset? lastGlobalOffset,
    Offset? lastBoundaryOffset,
    Offset? lastAncestorGlobalOffset,
    Offset? lastReferenceGlobalOffset,
    Offset? lastAncestorReferenceGlobalOffset,
  }) =>
      OffsetCache(
        startOffset: startOffset ?? this.startOffset,
        lastOffset: lastOffset ?? this.lastOffset,
        lastGlobalOffset: lastGlobalOffset ?? this.lastGlobalOffset,
        lastBoundaryOffset: lastBoundaryOffset ?? this.lastBoundaryOffset,
        lastAncestorGlobalOffset:
            lastAncestorGlobalOffset ?? this.lastAncestorGlobalOffset,
        lastReferenceGlobalOffset:
            lastReferenceGlobalOffset ?? this.lastReferenceGlobalOffset,
        lastAncestorReferenceGlobalOffset: lastAncestorReferenceGlobalOffset ??
            this.lastAncestorReferenceGlobalOffset,
      );
}

extension ProvideContextExt on List<MutationAction> {
  List<MutationAction> contextPovided(PaintingContext context) => map(
        (mutation) =>
            mutation is PaintChild ? mutation.provide(context) : mutation,
      ).toList();
}
