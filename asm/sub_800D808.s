	.syntax unified
	.section .text.sub_800D808, "ax", %progbits
@ sub_800D808 @ JP 0x0800D808 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D808
	.thumb_func
sub_800D808:
	push {r4, r5, r6, lr}
	ldr r3, _0800D83C @ =0x030004E8
	ldr r6, [r3]
	ldr r1, _0800D840 @ =0x030004B0
	ldr r0, [r1, #0x34]
	subs r0, #1
	str r0, [r1, #0x34]
	cmp r0, #0
	beq _0800D832
	adds r5, r1, #0
	movs r2, #0x80
	lsls r2, r2, #9
	adds r4, r2, #0
_0800D822:
	ldr r0, [r3, #4]
	stm r3!, {r0}
	adds r0, r2, #0
	adds r2, r2, r4
	asrs r1, r0, #0x10
	ldr r0, [r5, #0x34]
	cmp r1, r0
	blo _0800D822
_0800D832:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D83C: .4byte 0x030004E8
_0800D840: .4byte 0x030004B0

