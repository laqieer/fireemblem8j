	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set sub_802B8E8, 0x0802B8E8 + 1
	.section .text.sub_802B90C, "ax", %progbits
@ sub_802B90C @ JP 0x0802B90C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B90C
	.thumb_func
sub_802B90C:
	push {r4, lr}
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r4, #0
	cmp r4, #0
	bge _0802B91A
	adds r0, r4, #3
_0802B91A:
	asrs r0, r0, #2
	bl NextRN_N
	adds r1, r0, #0
	adds r0, r4, #0
	cmp r4, #0
	bge _0802B92A
	adds r0, r4, #7
_0802B92A:
	asrs r0, r0, #3
	subs r0, r1, r0
	adds r0, r4, r0
	bl sub_802B8E8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

