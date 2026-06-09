	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.section .text.sub_80856E8, "ax", %progbits
@ sub_80856E8 @ JP 0x080856E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80856E8
	.thumb_func
sub_80856E8:
	push {lr}
	ldr r0, _08085718 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	adds r2, r0, #0
	movs r3, #0
	ldr r0, _0808571C @ =0x03005270
	adds r1, r0, #0
	adds r1, #0xcc
	adds r0, #0xc9
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808572A
	cmp r0, #1
	bgt _08085720
	cmp r0, #0
	beq _08085726
	b _08085730
	.align 2, 0
_08085718: .4byte 0x0202BCEC
_0808571C: .4byte 0x03005270
_08085720:
	cmp r0, #2
	beq _0808572E
	b _08085730
_08085726:
	ldr r3, [r2, #0x3c]
	b _08085730
_0808572A:
	ldr r3, [r2, #0x40]
	b _08085730
_0808572E:
	ldr r3, [r2, #0x44]
_08085730:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0

