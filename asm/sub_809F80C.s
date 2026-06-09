	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C8E00, 0x080C8E00 + 1
	.section .text.sub_809F80C, "ax", %progbits
@ sub_809F80C @ JP 0x0809F80C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F80C
	.thumb_func
sub_809F80C:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809F82A
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _0809F830
_0809F82A:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_0809F830:
	strb r0, [r1]
	ldr r0, _0809F84C @ =0x03005270
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0809F850
	bl sub_80C8E00
	cmp r0, #0
	beq _0809F864
	adds r0, #0x2b
	b _0809F862
	.align 2, 0
_0809F84C: .4byte 0x03005270
_0809F850:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809F870
	ldr r0, _0809F86C @ =0x08A93FE8
	bl Proc_Find
	adds r0, #0x32
_0809F862:
	ldrb r0, [r0]
_0809F864:
	adds r1, r4, #0
	adds r1, #0x35
	strb r0, [r1]
	b _0809F876
	.align 2, 0
_0809F86C: .4byte 0x08A93FE8
_0809F870:
	adds r0, r4, #0
	adds r0, #0x35
	strb r1, [r0]
_0809F876:
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_0809F890:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809F890
	pop {r4}
	pop {r0}
	bx r0

