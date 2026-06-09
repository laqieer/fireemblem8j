	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807848C, "ax", %progbits
@ sub_807848C @ JP 0x0807848C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807848C
	.thumb_func
sub_807848C:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080784A4
	adds r0, r1, #0
	bl sub_8002DE4
_080784A4:
	pop {r0}
	bx r0

