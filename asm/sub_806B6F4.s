	.syntax unified
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806B6F4, "ax", %progbits
@ sub_806B6F4 @ JP 0x0806B6F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B6F4
	.thumb_func
sub_806B6F4:
	push {lr}
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0806B718 @ =0x080E413C
	str r1, [r0, #0x48]
	ldr r1, _0806B71C @ =0x08602AC8
	str r1, [r0, #0x4c]
	ldr r1, _0806B720 @ =0x08602ACC
	str r1, [r0, #0x54]
	ldr r0, _0806B724 @ =0x086E1EA4
	movs r1, #0x20
	bl sub_80567E0
	pop {r0}
	bx r0
	.align 2, 0
_0806B718: .4byte 0x080E413C
_0806B71C: .4byte 0x08602AC8
_0806B720: .4byte 0x08602ACC
_0806B724: .4byte 0x086E1EA4

