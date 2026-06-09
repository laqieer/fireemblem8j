	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_806EFB8, 0x0806EFB8 + 1
	.section .text.sub_806EF84, "ax", %progbits
@ sub_806EF84 @ JP 0x0806EF84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EF84
	.thumb_func
sub_806EF84:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806EFA8 @ =0x08603514
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_806EFB8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EFA8: .4byte 0x08603514

