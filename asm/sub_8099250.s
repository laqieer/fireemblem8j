	.syntax unified
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_8099250, "ax", %progbits
@ sub_8099250 @ JP 0x08099250 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099250
	.thumb_func
sub_8099250:
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #6
	bl sub_80B1FBC
	pop {r0}
	bx r0

