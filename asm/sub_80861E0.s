	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set SearchNextAvailableEvent, 0x08085260 + 1
	.set sub_80851B8, 0x080851B8 + 1
	.set sub_80851FC, 0x080851FC + 1
	.set sub_808618C, 0x0808618C + 1
	.set sub_8086870, 0x08086870 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_80861E0, "ax", %progbits
@ sub_80861E0 @ JP 0x080861E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80861E0
	.thumb_func
sub_80861E0:
	push {r4, lr}
	sub sp, #0x1c
	bl sub_80C1E74
	cmp r0, #2
	bne _080861F0
	movs r0, #0
	b _08086236
_080861F0:
	movs r0, #0
	bl sub_808618C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	ldr r0, _08086230 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_80851FC
	cmp r0, #0
	beq _08086234
	bl sub_8086870
_08086218:
	mov r0, sp
	movs r1, #1
	bl sub_80851B8
	mov r0, sp
	bl SearchNextAvailableEvent
	cmp r0, #0
	bne _08086218
	movs r0, #1
	b _08086236
	.align 2, 0
_08086230: .4byte 0x0202BCEC
_08086234:
	adds r0, r4, #0
_08086236:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

