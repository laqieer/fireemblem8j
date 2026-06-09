	.syntax unified
	.set IsTacticianDivinationAvailable, 0x080A2CE8 + 1
	.set sub_80A2D24, 0x080A2D24 + 1
	.section .text.sub_80A29FC, "ax", %progbits
@ sub_80A29FC @ JP 0x080A29FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A29FC
	.thumb_func
sub_80A29FC:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	movs r4, #1
	strb r4, [r0]
	bl IsTacticianDivinationAvailable
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	bl sub_80A2D24
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

