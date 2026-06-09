	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B2D70, "ax", %progbits
@ sub_80B2D70 @ JP 0x080B2D70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2D70
	.thumb_func
sub_80B2D70:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B2D90 @ =0x08A9DD34
	movs r1, #4
	bl sub_8002BCC
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2D90: .4byte 0x08A9DD34

