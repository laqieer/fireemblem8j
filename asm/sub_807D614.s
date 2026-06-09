	.syntax unified
	.set sub_807D544, 0x0807D544 + 1
	.section .text.sub_807D614, "ax", %progbits
@ sub_807D614 @ JP 0x0807D614 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D614
	.thumb_func
sub_807D614:
	push {lr}
	ldr r2, _0807D630 @ =0x0203A4E8
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	subs r2, #4
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #6
	bl sub_807D544
	pop {r0}
	bx r0
	.align 2, 0
_0807D630: .4byte 0x0203A4E8

