	.syntax unified
	.set MakeNewItem, 0x080162E8 + 1
	.set sub_801DCF4, 0x0801DCF4 + 1
	.section .text.sub_8011624, "ax", %progbits
@ sub_8011624 @ JP 0x08011624 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011624
	.thumb_func
sub_8011624:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x58]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_801DCF4
	pop {r4, r5}
	pop {r0}
	bx r0

