	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.section .text.sub_8011340, "ax", %progbits
@ sub_8011340 @ JP 0x08011340 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011340
	.thumb_func
sub_8011340:
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	ldr r2, _08011358 @ =0x085B8CE4
	adds r0, #0x4a
	ldrh r3, [r0]
	adds r0, r4, #0
	bl CallARM_PushToSecondaryOAM
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011358: .4byte 0x085B8CE4

