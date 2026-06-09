	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.section .text.sub_808575C, "ax", %progbits
@ sub_808575C @ JP 0x0808575C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808575C
	.thumb_func
sub_808575C:
	push {lr}
	ldr r0, _08085794 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	beq _08085798
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq _08085798
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _08085798
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	beq _08085798
	ldr r0, [r1, #0x40]
	cmp r0, #0
	beq _08085798
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _08085798
	movs r0, #1
	b _0808579A
	.align 2, 0
_08085794: .4byte 0x0202BCEC
_08085798:
	movs r0, #0
_0808579A:
	pop {r1}
	bx r1
	.align 2, 0

