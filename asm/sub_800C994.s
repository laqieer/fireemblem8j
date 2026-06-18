	.syntax unified
	.set HideGmUnit, 0x080C4354 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C3144, 0x080C3144 + 1
	.set sub_80C818C, 0x080C818C + 1
	.section .text.sub_800C994, "ax", %progbits
@ EventA8_WmUnitMoveFree @ JP 0x0800C994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EventA8_WmUnitMoveFree
	.thumb_func
EventA8_WmUnitMoveFree:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r4, [r1, r2]
	movs r3, #6
	ldrsh r2, [r1, r3]
	movs r5, #8
	ldrsh r3, [r1, r5]
	movs r7, #0xa
	ldrsh r6, [r1, r7]
	mov sl, r6
	movs r5, #0xc
	ldrsh r6, [r1, r5]
	movs r5, #0xe
	ldrsh r7, [r1, r5]
	mov r8, r7
	ldrh r7, [r1, #0x10]
	mov sb, r7
	ldrh r5, [r1, #0x12]
	ldrh r1, [r1, #0x14]
	mov ip, r1
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800C9FC
	ldr r0, _0800C9F8 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	adds r2, r6, #0
	mov r3, r8
	bl sub_80C3144
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0800CA20
	adds r0, r4, #0
	bl HideGmUnit
	b _0800CA20
	.align 2, 0
_0800C9F8: .4byte 0x08AC1108
_0800C9FC:
	mov r0, sp
	strb r4, [r0]
	strb r2, [r0, #1]
	strb r1, [r0, #2]
	strh r3, [r0, #6]
	mov r1, sl
	strh r1, [r0, #8]
	strh r6, [r0, #0xa]
	mov r2, r8
	strh r2, [r0, #0xc]
	mov r3, sb
	str r3, [sp, #0x10]
	mov r6, ip
	strh r6, [r0, #0xe]
	adds r1, r5, #0
	movs r2, #0
	bl sub_80C818C
_0800CA20:
	movs r0, #0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

