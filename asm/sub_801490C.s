	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_801490C, "ax", %progbits
@ sub_801490C @ JP 0x0801490C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801490C
	.thumb_func
sub_801490C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08014928 @ =0x085C2590
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014928: .4byte 0x085C2590

