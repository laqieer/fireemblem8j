	.syntax unified
	.section .text.sub_807BEE8, "ax", %progbits
@ sub_807BEE8 @ JP 0x0807BEE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BEE8
	.thumb_func
sub_807BEE8:
	push {r4, lr}
	ldr r1, [r0, #0x2c]
	ldr r4, [r1, #0x30]
	ldr r3, [r1, #0x34]
	ldrb r2, [r3, #1]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	ldrh r3, [r3, #2]
	adds r0, r0, r3
	adds r1, #0x46
	ldrh r1, [r1]
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

