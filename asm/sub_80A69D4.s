	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80A69D4, "ax", %progbits
@ StartSupportUnitSubScreen @ JP 0x080A69D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartSupportUnitSubScreen
	.thumb_func
StartSupportUnitSubScreen:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldr r0, _080A69F4 @ =0x08A95C94
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A69F4: .4byte 0x08A95C94

