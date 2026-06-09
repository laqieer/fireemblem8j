	.syntax unified
	.set sub_807D544, 0x0807D544 + 1
	.section .text.sub_807D5D4, "ax", %progbits
@ sub_807D5D4 @ JP 0x0807D5D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D5D4
	.thumb_func
sub_807D5D4:
	push {lr}
	ldr r2, _0807D5F0 @ =0x0203A4E8
	ldrb r1, [r2, #0x10]
	adds r1, #4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #4
	bl sub_807D544
	pop {r0}
	bx r0
	.align 2, 0
_0807D5F0: .4byte 0x0203A4E8

