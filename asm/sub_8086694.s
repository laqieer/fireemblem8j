	.syntax unified
	.set CallEndEvent, 0x080855B8 + 1
	.set CheckFlag, 0x080860D0 + 1
	.set ClearFlag, 0x080860BC + 1
	.set CountAvailableBlueUnits, 0x08018D04 + 1
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set SearchNextAvailableEvent, 0x08085260 + 1
	.set SetFlag, 0x080860A8 + 1
	.set sub_80851B8, 0x080851B8 + 1
	.set sub_80851FC, 0x080851FC + 1
	.set sub_8085AE8, 0x08085AE8 + 1
	.set sub_808618C, 0x0808618C + 1
	.set sub_8086870, 0x08086870 + 1
	.set sub_80871B4, 0x080871B4 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8086694, "ax", %progbits
@ sub_8086694 @ JP 0x08086694 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086694
	.thumb_func
sub_8086694:
	push {lr}
	sub sp, #0x1c
	bl sub_80871B4
	cmp r0, #0
	bne _080866B4
	movs r0, #6
	bl SetFlag
	bl sub_80C1E74
	cmp r0, #2
	bne _080866BA
	bl CallEndEvent
	b _08086722
_080866B4:
	movs r0, #6
	bl ClearFlag
_080866BA:
	movs r0, #0x65
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080866D0
	bl CountAvailableBlueUnits
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080866D6
_080866D0:
	bl sub_8085AE8
	b _08086722
_080866D6:
	bl sub_80C1E74
	cmp r0, #2
	beq _08086722
	movs r0, #1
	bl sub_808618C
	ldr r0, _08086728 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _0808672C @ =0x03004DF0
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_80851FC
	cmp r0, #0
	beq _08086722
	bl sub_8086870
_08086710:
	mov r0, sp
	movs r1, #1
	bl sub_80851B8
	mov r0, sp
	bl SearchNextAvailableEvent
	cmp r0, #0
	bne _08086710
_08086722:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0
_08086728: .4byte 0x0202BCEC
_0808672C: .4byte 0x03004DF0

