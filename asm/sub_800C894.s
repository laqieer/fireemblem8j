	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set ShowGmUnit, 0x080C4338 + 1
	.set sub_80C31F8, 0x080C31F8 + 1
	.section .text.sub_800C894, "ax", %progbits
@ sub_800C894 @ JP 0x0800C894 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C894
	.thumb_func
sub_800C894:
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
	bne _0800C8C0
	ldr r0, _0800C8BC @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80C31F8
	b _0800C8C6
	.align 2, 0
_0800C8BC: .4byte 0x08AC1108
_0800C8C0:
	adds r0, r4, #0
	bl ShowGmUnit
_0800C8C6:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

