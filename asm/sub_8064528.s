	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_8064528, "ax", %progbits
@ sub_8064528 @ JP 0x08064528 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064528
	.thumb_func
sub_8064528:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806455C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064560 @ =0x0860116C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08064564 @ =0x086BF24C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806455C: .4byte 0x0201774C
_08064560: .4byte 0x0860116C
_08064564: .4byte 0x086BF24C

