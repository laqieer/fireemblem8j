	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set sub_80851B8, 0x080851B8 + 1
	.set sub_80851FC, 0x080851FC + 1
	.set sub_8086870, 0x08086870 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8086288, "ax", %progbits
@ sub_8086288 @ JP 0x08086288 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086288
	.thumb_func
sub_8086288:
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl sub_80C1E74
	cmp r0, #2
	beq _080862C6
	ldr r0, _080862D0 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl sub_80851FC
	cmp r0, #0
	beq _080862C6
	bl sub_8086870
	mov r0, sp
	movs r1, #1
	bl sub_80851B8
_080862C6:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080862D0: .4byte 0x0202BCEC

