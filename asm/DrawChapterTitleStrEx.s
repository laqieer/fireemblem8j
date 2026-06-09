	.syntax unified
	.section .text.DrawChapterTitleStrEx, "ax", %progbits
@ DrawChapterTitleStrEx @ JP 0x0808B99C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawChapterTitleStrEx
	.thumb_func
DrawChapterTitleStrEx:
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808B9BC @ =0x0203E788
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r1, r1, r0
	movs r0, #0x3f
_0808B9AA:
	strh r1, [r2]
	adds r1, #1
	adds r2, #2
	subs r0, #1
	cmp r0, #0
	bge _0808B9AA
	pop {r0}
	bx r0
	.align 2, 0
_0808B9BC: .4byte 0x0203E788

