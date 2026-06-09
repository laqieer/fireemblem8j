	.syntax unified
	.section .text.sub_8088BF0, "ax", %progbits
@ sub_8088BF0 @ JP 0x08088BF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088BF0
	.thumb_func
sub_8088BF0:
	push {r4, r5, lr}
	adds r3, r0, r2
	movs r5, #4
	strb r5, [r3]
	adds r3, r1, r2
	adds r3, r0, r3
	strb r5, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r4, r0, r4
	strb r5, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

