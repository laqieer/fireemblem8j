	.syntax unified
	.set HideGmUnit, 0x080C4354 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C3218, 0x080C3218 + 1
	.section .text.sub_800C8D0, "ax", %progbits
@ sub_800C8D0 @ JP 0x0800C8D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C8D0
	.thumb_func
sub_800C8D0:
	push {r4, r5, lr}
	ldr r1, [r0, #0x38]
	ldrh r4, [r1, #4]
	movs r2, #6
	ldrsh r5, [r1, r2]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C8FC
	ldr r0, _0800C8F8 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80C3218
	b _0800C902
	.align 2, 0
_0800C8F8: .4byte 0x08AC1108
_0800C8FC:
	adds r0, r4, #0
	bl HideGmUnit
_0800C902:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

