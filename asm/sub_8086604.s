	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set CheckTutorialEvent, 0x0808615C + 1
	.set ClearFlag, 0x080860BC + 1
	.set CountAvailableBlueUnits, 0x08018D04 + 1
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set SetFlag, 0x080860A8 + 1
	.set sub_80851FC, 0x080851FC + 1
	.set sub_80871B4, 0x080871B4 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8086604, "ax", %progbits
@ sub_8086604 @ JP 0x08086604 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086604
	.thumb_func
sub_8086604:
	push {r4, lr}
	sub sp, #0x1c
	bl sub_80871B4
	cmp r0, #0
	bne _08086620
	movs r0, #6
	bl SetFlag
	bl sub_80C1E74
	cmp r0, #2
	bne _08086626
	b _08086688
_08086620:
	movs r0, #6
	bl ClearFlag
_08086626:
	movs r0, #0x65
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08086688
	bl CountAvailableBlueUnits
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08086688
	bl sub_80C1E74
	cmp r0, #2
	bne _08086648
	movs r0, #0
	b _0808668A
_08086648:
	movs r0, #1
	bl CheckTutorialEvent
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	ldr r0, _08086680 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _08086684 @ =0x03004DF0
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_80851FC
	cmp r0, #0
	bne _08086688
	adds r0, r4, #0
	b _0808668A
	.align 2, 0
_08086680: .4byte 0x0202BCEC
_08086684: .4byte 0x03004DF0
_08086688:
	movs r0, #1
_0808668A:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

