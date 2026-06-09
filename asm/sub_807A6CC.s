	.syntax unified
	.set NextRN_100, 0x08000C3C + 1
	.section .text.sub_807A6CC, "ax", %progbits
@ sub_807A6CC @ JP 0x0807A6CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A6CC
	.thumb_func
sub_807A6CC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	bl NextRN_100
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r5, #0
	movs r2, #0
	cmp r2, r6
	bhs _0807A706
_0807A6E4:
	adds r1, r5, #0
	ldrb r0, [r4]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r1, r3
	bhi _0807A6FA
	cmp r3, r5
	bhs _0807A6FA
	adds r0, r2, #0
	b _0807A708
_0807A6FA:
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r6
	blo _0807A6E4
_0807A706:
	movs r0, #0xff
_0807A708:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

