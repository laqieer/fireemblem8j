	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemMight, 0x08017384 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.section .text.sub_804BB40, "ax", %progbits
@ sub_804BB40 @ JP 0x0804BB40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BB40
	.thumb_func
sub_804BB40:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0804BB8C
_0804BB56:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804BB78
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r8
	bls _0804BB78
	adds r7, r4, #0
	adds r0, r7, #0
	bl GetItemMight
	mov r8, r0
_0804BB78:
	adds r5, #1
	cmp r5, #4
	bgt _0804BB8C
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0804BB56
_0804BB8C:
	cmp r7, #0
	beq _0804BB9A
	adds r0, r6, #0
	bl sub_8018EC4
	add r0, r8
	b _0804BB9C
_0804BB9A:
	movs r0, #0
_0804BB9C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

