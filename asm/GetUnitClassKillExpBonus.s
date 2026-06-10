	.syntax unified
	.section .text.GetUnitClassKillExpBonus, "ax", %progbits
@ GetUnitClassKillExpBonus @ JP 0x0802C320 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnitClassKillExpBonus
	.thumb_func
GetUnitClassKillExpBonus:
	push {lr}
	movs r2, #0
	ldr r0, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r3, #0x28]
	orrs r1, r0
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802C338
	movs r2, #0x14
_0802C338:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0802C344
	adds r2, #0x28
_0802C344:
	ldrb r0, [r3, #4]
	cmp r0, #0x53
	bne _0802C34C
	adds r2, #0x28
_0802C34C:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0

