	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_804DD78, "ax", %progbits
@ sub_804DD78 @ JP 0x0804DD78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804DD78
	.thumb_func
sub_804DD78:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x45
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #7
	ldrb r0, [r0]
	ldr r4, [r6, #0x34]
	muls r0, r4, r0
	lsls r0, r0, #3
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

