	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set sub_80851FC, 0x080851FC + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8086350, "ax", %progbits
@ sub_8086350 @ JP 0x08086350 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086350
	.thumb_func
sub_8086350:
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	ldr r0, _0808638C @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_80851FC
	cmp r0, #0
	beq _08086390
	bl sub_80C1E74
	cmp r0, #2
	beq _08086390
	ldr r0, [sp, #0xc]
	b _08086392
	.align 2, 0
_0808638C: .4byte 0x0202BCEC
_08086390:
	movs r0, #0
_08086392:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

