	.syntax unified
	.set ChangeUnitAi, 0x08011DB0 + 1
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8011DF4, "ax", %progbits
@ sub_8011DF4 @ JP 0x08011DF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011DF4
	.thumb_func
sub_8011DF4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r4, #1
_08011E0E:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08011E32
	ldr r0, [r1]
	cmp r0, #0
	beq _08011E32
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne _08011E32
	adds r0, r1, #0
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl ChangeUnitAi
_08011E32:
	adds r4, #1
	cmp r4, #0xbf
	ble _08011E0E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

