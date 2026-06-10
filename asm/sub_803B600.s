	.syntax unified
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A05C, 0x0801A05C + 1
	.section .text.sub_803B600, "ax", %progbits
@ sub_803B600 @ JP 0x0803B600 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803B600
	.thumb_func
sub_803B600:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_8018EC4
	cmp r0, #0x14
	bgt _0803B616
	adds r0, r4, #0
	bl sub_8018EC4
	adds r7, r0, #0
	b _0803B618
_0803B616:
	movs r7, #0x14
_0803B618:
	adds r0, r4, #0
	bl sub_801A05C
	ldr r0, _0803B674 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _0803B678 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B66C
_0803B634:
	ldr r0, _0803B678 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803B666
_0803B642:
	ldr r0, _0803B67C @ =0x0202E4DC
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B660
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #1
	bl MapAddInRange
_0803B660:
	subs r4, #1
	cmp r4, #0
	bge _0803B642
_0803B666:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803B634
_0803B66C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B674: .4byte 0x0202E4E0
_0803B678: .4byte 0x0202E4D0
_0803B67C: .4byte 0x0202E4DC

