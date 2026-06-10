	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80065E4, "ax", %progbits
@ sub_80065E4 @ JP 0x080065E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80065E4
	.thumb_func
sub_80065E4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080065FC @ =0x085B909C
	adds r1, r4, #0
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080065FC: .4byte 0x085B909C

