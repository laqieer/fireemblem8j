	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8077394, "ax", %progbits
@ sub_8077394 @ JP 0x08077394 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077394
	.thumb_func
sub_8077394:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080773B0 @ =0x087A9AD8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	ldr r1, _080773B4 @ =0x0202013C
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080773B0: .4byte 0x087A9AD8
_080773B4: .4byte 0x0202013C

