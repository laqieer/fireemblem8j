	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set sub_80851FC, 0x080851FC + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8086240, "ax", %progbits
@ sub_8086240 @ JP 0x08086240 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086240
	.thumb_func
sub_8086240:
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl sub_80C1E74
	cmp r0, #2
	beq _08086272
	ldr r0, _08086278 @ =0x0202BCEC
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
	bne _0808627C
_08086272:
	movs r0, #0
	b _0808627E
	.align 2, 0
_08086278: .4byte 0x0202BCEC
_0808627C:
	movs r0, #1
_0808627E:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

