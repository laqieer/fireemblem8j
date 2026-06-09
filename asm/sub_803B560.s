	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_801B674, 0x0801B674 + 1
	.section .text.sub_803B560, "ax", %progbits
@ sub_803B560 @ JP 0x0803B560 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803B560
	.thumb_func
sub_803B560:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	bl sub_801A05C
	ldr r0, _0803B5F4 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _0803B5F8 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B5E4
_0803B58A:
	ldr r0, _0803B5F8 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt _0803B5DE
	lsls r1, r7, #0x10
	mov r8, r1
_0803B59E:
	ldr r0, _0803B5FC @ =0x0202E4DC
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B5D8
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl sub_801B674
_0803B5D8:
	subs r6, #1
	cmp r6, #0
	bge _0803B59E
_0803B5DE:
	mov r7, sl
	cmp r7, #0
	bge _0803B58A
_0803B5E4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B5F4: .4byte 0x0202E4E0
_0803B5F8: .4byte 0x0202E4D0
_0803B5FC: .4byte 0x0202E4DC

