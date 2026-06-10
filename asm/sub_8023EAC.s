	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8023EAC, "ax", %progbits
@ sub_8023EAC @ JP 0x08023EAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023EAC
	.thumb_func
sub_8023EAC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08023F00 @ =0x03004DF0
	ldr r0, [r0]
	movs r7, #0x10
	ldrsb r7, [r0, r7]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	movs r5, #0
	ldr r4, _08023F04 @ =0x080DC938
_08023EC8:
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, r7, r2
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	ldr r1, _08023F08 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08023F0C
	adds r0, r1, #0
	bl GetUnit
	cmp r0, #0
	beq _08023F0C
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne _08023F0C
	movs r0, #1
	b _08023F16
	.align 2, 0
_08023F00: .4byte 0x03004DF0
_08023F04: .4byte 0x080DC938
_08023F08: .4byte 0x0202E4D4
_08023F0C:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _08023EC8
	movs r0, #0
_08023F16:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

