	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set IsUnitInCurrentRoster, 0x08097740 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_809819C, "ax", %progbits
@ sub_809819C @ JP 0x0809819C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809819C
	.thumb_func
sub_809819C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _08098208 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r4, #1
_080981C2:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080981E6
	ldr r0, [r1]
	cmp r0, #0
	beq _080981E6
	adds r0, r1, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080981E6
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080981E6:
	adds r4, #1
	cmp r4, #0x3f
	ble _080981C2
	cmp r5, #0
	bne _08098200
	adds r1, r6, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
_08098200:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098208: .4byte 0x03003020

