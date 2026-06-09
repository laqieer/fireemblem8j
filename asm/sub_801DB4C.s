	.syntax unified
	.set GetEnemyStartCursorPosition, 0x0801DAE4 + 1
	.set GetPhaseAbleUnitCount, 0x08024C9C + 1
	.set Proc_End, 0x08002CBC + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_801DA8C, 0x0801DA8C + 1
	.section .text.sub_801DB4C, "ax", %progbits
@ sub_801DB4C @ JP 0x0801DB4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DB4C
	.thumb_func
sub_801DB4C:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r4, _0801DB70 @ =0x0202BCEC
	ldrb r0, [r4, #0xf]
	bl GetPhaseAbleUnitCount
	cmp r0, #0
	bne _0801DB74
	adds r0, r5, #0
	bl Proc_End
	b _0801DBB6
	.align 2, 0
_0801DB70: .4byte 0x0202BCEC
_0801DB74:
	ldrb r0, [r4, #0xf]
	cmp r0, #0x40
	beq _0801DB94
	cmp r0, #0x40
	bgt _0801DB84
	cmp r0, #0
	beq _0801DB8A
	b _0801DB9C
_0801DB84:
	cmp r0, #0x80
	beq _0801DB94
	b _0801DB9C
_0801DB8A:
	add r1, sp, #4
	mov r0, sp
	bl sub_801DA8C
	b _0801DB9C
_0801DB94:
	add r1, sp, #4
	mov r0, sp
	bl GetEnemyStartCursorPosition
_0801DB9C:
	ldr r1, [sp]
	cmp r1, #0
	blt _0801DBB6
	ldr r2, [sp, #4]
	cmp r2, #0
	blt _0801DBB6
	adds r0, r5, #0
	bl sub_8015E18
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl SetCursorMapPosition
_0801DBB6:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

