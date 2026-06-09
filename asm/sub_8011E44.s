	.syntax unified
	.set ChangeUnitAi, 0x08011DB0 + 1
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8011E44, "ax", %progbits
@ sub_8011E44 @ JP 0x08011E44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011E44
	.thumb_func
sub_8011E44:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	ldr r0, [sp, #0x28]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r4, #1
_08011E6C:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov r8, r4
	cmp r5, #0
	beq _08011EBA
	ldr r0, [r5]
	cmp r0, #0
	beq _08011EBA
	movs r6, #0
	cmp r6, r7
	bge _08011EBA
	ldr r4, [sp]
_08011E8A:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08011EAE
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08011EAE
	adds r0, r5, #0
	ldr r1, [sp, #4]
	mov r2, sl
	mov r3, sb
	bl ChangeUnitAi
_08011EAE:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	adds r4, #4
	asrs r6, r0, #0x10
	cmp r6, r7
	blt _08011E8A
_08011EBA:
	mov r4, r8
	cmp r4, #0xbf
	ble _08011E6C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

