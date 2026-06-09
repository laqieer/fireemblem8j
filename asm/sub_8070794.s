	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8070794, "ax", %progbits
@ sub_8070794 @ JP 0x08070794 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070794
	.thumb_func
sub_8070794:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080707B8 @ =0x08603A00
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [r0, #0x48]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080707B8: .4byte 0x08603A00

