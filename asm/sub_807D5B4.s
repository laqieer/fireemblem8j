	.syntax unified
	.set sub_807D544, 0x0807D544 + 1
	.section .text.sub_807D5B4, "ax", %progbits
@ sub_807D5B4 @ JP 0x0807D5B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D5B4
	.thumb_func
sub_807D5B4:
	push {lr}
	ldr r2, _0807D5D0 @ =0x0203A4E8
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	adds r2, #4
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #3
	bl sub_807D544
	pop {r0}
	bx r0
	.align 2, 0
_0807D5D0: .4byte 0x0203A4E8

