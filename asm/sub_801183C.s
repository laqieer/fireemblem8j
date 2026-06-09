	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.section .text.sub_801183C, "ax", %progbits
@ sub_801183C @ JP 0x0801183C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801183C
	.thumb_func
sub_801183C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r2, #0
	ldr r0, _0801186C @ =0x030005C8
	movs r4, #0
	movs r2, #0xa
	strb r2, [r0]
	str r1, [r0, #4]
	movs r1, #6
	strb r1, [r0, #8]
	str r4, [r0, #0xc]
	movs r1, #4
	strb r1, [r0, #0x10]
	str r5, [r0, #0x14]
	strb r4, [r0, #0x18]
	str r4, [r0, #0x1c]
	movs r1, #0x60
	movs r2, #0
	bl NewPopup_Simple
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801186C: .4byte 0x030005C8

