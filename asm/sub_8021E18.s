	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.section .text.sub_8021E18, "ax", %progbits
@ sub_8021E18 @ JP 0x08021E18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021E18
	.thumb_func
sub_8021E18:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	str r0, [r4, #0x3c]
	bl AdvanceGetLCGRNValue
	ldr r1, _08021E48 @ =0x000003FF
	ands r1, r0
	ldr r0, [r4, #0x14]
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r1, r1, r0
	rsbs r1, r1, #0
	str r1, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021E48: .4byte 0x000003FF

