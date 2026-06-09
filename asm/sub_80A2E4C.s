	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80A2E4C, "ax", %progbits
@ sub_80A2E4C @ JP 0x080A2E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2E4C
	.thumb_func
sub_80A2E4C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A2E60 @ =0x08A9548C
	bl sub_8002BCC
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E60: .4byte 0x08A9548C

