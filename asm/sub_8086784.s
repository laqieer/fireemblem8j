	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set sub_80851B8, 0x080851B8 + 1
	.set sub_80851FC, 0x080851FC + 1
	.set sub_808618C, 0x0808618C + 1
	.set sub_8086870, 0x08086870 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8086784, "ax", %progbits
@ sub_8086784 @ JP 0x08086784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086784
	.thumb_func
sub_8086784:
	push {r4, lr}
	sub sp, #0x1c
	bl sub_80C1E74
	cmp r0, #2
	bne _08086794
	movs r0, #0
	b _080867CE
_08086794:
	movs r0, #3
	bl sub_808618C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	ldr r0, _080867BC @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0x14]
	str r0, [sp]
	mov r0, sp
	bl sub_80851FC
	cmp r0, #0
	bne _080867C0
	adds r0, r4, #0
	b _080867CE
	.align 2, 0
_080867BC: .4byte 0x0202BCEC
_080867C0:
	bl sub_8086870
	mov r0, sp
	movs r1, #1
	bl sub_80851B8
	movs r0, #1
_080867CE:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

