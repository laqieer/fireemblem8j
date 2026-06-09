	.syntax unified
	.section .text.sub_8011548, "ax", %progbits
@ sub_8011548 @ JP 0x08011548 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011548
	.thumb_func
sub_8011548:
	ldr r1, _08011550 @ =0x030005EC
	strh r0, [r1]
	bx lr
	.align 2, 0
_08011550: .4byte 0x030005EC

