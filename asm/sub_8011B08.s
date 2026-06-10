	.syntax unified
	.section .text.sub_8011B08, "ax", %progbits
@ sub_8011B08 @ JP 0x08011B08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011B08
	.thumb_func
sub_8011B08:
	push {lr}
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, #0
	beq _08011B26
	cmp r1, #0
	beq _08011B22
	adds r1, r0, #0
	adds r1, #0x48
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
	b _08011B26
_08011B22:
	adds r0, #0x48
	strh r1, [r0]
_08011B26:
	pop {r0}
	bx r0
	.align 2, 0

