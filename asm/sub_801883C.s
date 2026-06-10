	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_801883C, "ax", %progbits
@ sub_801883C @ JP 0x0801883C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801883C
	.thumb_func
sub_801883C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	movs r7, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _080188A6
	movs r0, #1
	mov r8, r0
_08018852:
	adds r0, r4, #0
	bl GetItemAttributes
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08018872
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018872
	mov r0, r8
	orrs r6, r0
_08018872:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08018892
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018892
	movs r0, #2
	orrs r6, r0
_08018892:
	adds r7, #1
	cmp r7, #4
	bgt _080188A6
	lsls r1, r7, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08018852
_080188A6:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

